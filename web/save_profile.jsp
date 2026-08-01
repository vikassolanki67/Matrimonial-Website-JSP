<%-- 
    Document   : save_profile
    Created on : 1 Aug, 2026, 4:36:58 PM
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

    List<Map<String,String>> saved = new ArrayList<Map<String,String>>();
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        Statement st1 = cn.createStatement();
        ResultSet rs1 = st1.executeQuery("select * from saved_profiles where loginemail='"+login_email+"'");

        while (rs1.next()) {
            String otherEmail = rs1.getString("otheremail");

            Statement st2 = cn.createStatement();
            ResultSet rs2 = st2.executeQuery("select usercode, fname, lname from registration_table where email='"+otherEmail+"'");
            String usercode = "";
            String fullname = otherEmail;
            if (rs2.next()) {
                usercode = rs2.getString("usercode");
                String fname = rs2.getString("fname") == null ? "" : rs2.getString("fname");
                String lname = rs2.getString("lname") == null ? "" : rs2.getString("lname");
                fullname = (fname + " " + lname).trim();
            }

            Map<String,String> row = new HashMap<String,String>();
            row.put("code", usercode);
            row.put("email", otherEmail);
            row.put("name", fullname);
            saved.add(row);
        }
        cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>
<% request.setAttribute("pageTitle", "Saved Profiles — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />
<!-- Plain, unstyled on purpose -- design this yourself as planned. -->
<div style="padding-top:140px; padding-bottom:60px; max-width:700px; margin:0 auto;">
    <h1>Saved Profiles</h1>
    <% if (saved.isEmpty()) { %>
        <p>You haven't saved any profiles yet.</p>
    <% } else {
        for (Map<String,String> row : saved) {
    %>
        <div style="display:flex; align-items:center; gap:16px; margin-bottom:16px;">
            <img src="upload/<%=row.get("code")%>.jpg" alt="" width="60" height="60" onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
            <span><%=row.get("name")%></span>
            <a href="user-profile.jsp?id=<%=row.get("code")%>">View Profile</a>
        </div>
    <%  }
    } %>
</div>
<jsp:include page="includes/footer.jsp" />
