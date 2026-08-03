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

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Notifications</span>
        <h1>Interest Requests</h1>
        <p>People who are interested in connecting with you.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow">
        <% if (pendingRequests.isEmpty()) { %>
            <div class="people-empty">
                <i class="bi bi-inbox"></i>
                <p class="mb-0">No pending requests right now.</p>
            </div>
        <% } else { %>
            <div class="people-list">
            <% for (Map<String,String> req : pendingRequests) { %>
                <div class="person-card">
                    <img class="person-avatar" src="upload/<%=req.get("code")%>.jpg" alt=""
                         onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
                    <div class="person-info">
                        <h5><%=req.get("name")%></h5>
                        <span class="person-meta">Wants to connect with you</span>
                    </div>
                    <div class="person-actions">
                        <a href="request_pending.jsp?id=<%=req.get("code")%>" class="btn btn-brand btn-sm">View Profile</a>
                    </div>
                </div>
            <% } %>
            </div>
        <% } %>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
