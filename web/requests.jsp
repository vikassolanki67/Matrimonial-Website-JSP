<%-- 
    Document   : requests
    Created on : 26 Jul, 2026, 7:01:06 PM
    Author     : LENOVO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<%
    Cookie ct[] = request.getCookies();
    String login_email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) {
                login_email = ct[i].getValue();
            }
        }
    }
    if (login_email == null || session.getAttribute(login_email) == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String,String>> pendingRequests = new ArrayList<Map<String,String>>();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from registration_table where email='"+login_email+"'");

        String logincode = null;
        if (rs.next()) {
            logincode = rs.getString("usercode");
        }

        Statement st1 = cn.createStatement();
        ResultSet rs1 = st1.executeQuery("select * from interested where to_code='"+logincode+"' AND status = 0");

        while (rs1.next()) {
            String senderCode = rs1.getString("from_code");
            String senderEmail = rs1.getString("from_email");

            // Look up the sender's display name from profile_table (same
            // contact_email join pattern already used in edit.jsp / view_profile.jsp)
            String senderName = senderEmail;
            Statement st2 = cn.createStatement();
            ResultSet rs2 = st2.executeQuery("select full_name from profile_table where contact_email='"+senderEmail+"'");
            if (rs2.next()) {
                senderName = rs2.getString("full_name");
            }

            Map<String,String> row = new HashMap<String,String>();
            row.put("code", senderCode);
            row.put("email", senderEmail);
            row.put("name", senderName);
            pendingRequests.add(row);
        }

        cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>
<% request.setAttribute("pageTitle", "Requests — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<!-- Plain, unstyled on purpose -- design this yourself as planned. -->
<div style="padding-top:140px; padding-bottom:60px; max-width:700px; margin:0 auto;">
    <h1>Interest Requests</h1>

    <% if (pendingRequests.isEmpty()) { %>
        <p>No pending requests right now.</p>
    <% } else {
        for (Map<String,String> req : pendingRequests) {
    %>
        <div style="display:flex; align-items:center; gap:16px; margin-bottom:16px;">
            <img src="upload/<%=req.get("code")%>.jpg" alt="" width="60" height="60" onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
            <span><%=req.get("name")%></span>
            <a href="request_pending.jsp?id=<%=req.get("code")%>">View Profile</a>
        </div>
    <%  }
    } %>
</div>

<jsp:include page="includes/footer.jsp" />