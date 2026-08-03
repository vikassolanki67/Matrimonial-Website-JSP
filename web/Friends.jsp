<%-- 
    Document   : Friends
    Created on : 1 Aug, 2026, 12:10:51 PM
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

    List<Map<String,String>> friends = new ArrayList<Map<String,String>>();

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
        ResultSet rs1 = st1.executeQuery("select * from interested where ((from_code='"+logincode+"' AND status=1) OR (to_code='"+logincode+"' AND status=1))");

        while (rs1.next()) {
            String otherCode, otherEmail;
            if (rs1.getString("from_code").equals(logincode)) {
                otherCode = rs1.getString("to_code");
                otherEmail = rs1.getString("to_email");
            } else {
                otherCode = rs1.getString("from_code");
                otherEmail = rs1.getString("from_email");
            }
         
   
            String OtherName = otherEmail;
            Statement st2 = cn.createStatement();
            ResultSet rs2 = st2.executeQuery("select full_name from profile_table where contact_email='"+otherEmail+"'");
            if (rs2.next()) {
                OtherName = rs2.getString("full_name");
            }

            Map<String,String> row = new HashMap<String,String>();
            row.put("code", otherCode);
            row.put("email", otherEmail);
            row.put("name", OtherName);
            friends.add(row);
            
        }

        cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>
<% request.setAttribute("pageTitle", "Friends — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Connections</span>
        <h1>Friends</h1>
        <p>Everyone you're currently connected with.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow">
        <% if (friends.isEmpty()) { %>
            <div class="people-empty">
                <i class="bi bi-heart"></i>
                <p class="mb-0">No connections yet. Send an interest request from a profile to get started.</p>
            </div>
        <% } else { %>
            <div class="people-list">
            <% for (Map<String,String> req : friends) { %>
                <div class="person-card">
                    <img class="person-avatar" src="upload/<%=req.get("code")%>.jpg" alt=""
                         onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
                    <div class="person-info">
                        <h5><%=req.get("name")%></h5>
                        <span class="person-meta">Connected</span>
                    </div>
                    <div class="person-actions">
                        <a href="user-profile.jsp?id=<%=req.get("code")%>" class="btn btn-outline-brand btn-sm">View Profile</a>
                        <a href="message.jsp?id=<%=req.get("code")%>" class="btn btn-brand btn-sm">Message</a>
                    </div>
                </div>
            <% } %>
            </div>
        <% } %>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
