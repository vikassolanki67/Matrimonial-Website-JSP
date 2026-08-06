<%-- 
    Document   : block
    Created on : 5 Aug, 2026, 11:50:03 AM
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

    List<Map<String,String>> block_user = new ArrayList<Map<String,String>>();

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
        ResultSet rs1 = st1.executeQuery("select * from interested where from_code='"+logincode+"' AND status=3");

        while (rs1.next()) {
            String otherCode, otherEmail;
            
            otherCode = rs1.getString("to_code");
            otherEmail = rs1.getString("to_email");
            
         
            String OtherName = null;
            Statement st2 = cn.createStatement();
            ResultSet rs2 = st2.executeQuery("select full_name from profile_table where contact_email='"+otherEmail+"'");
            if (rs2.next()) {
                OtherName = rs2.getString("full_name");
            }

            Map<String,String> row = new HashMap<String,String>();
            row.put("code", otherCode);
            row.put("email", otherEmail);
            row.put("name", OtherName);
            block_user.add(row);
            
        }

        cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>
<% request.setAttribute("pageTitle", "Blocked Users — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Privacy</span>
        <h1>Blocked Users</h1>
       <p>Manage the profiles you've chosen not to interact with.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow">
        <% if (block_user.isEmpty()) { %>
            <div class="people-empty">
                <i class="bi bi-shield-check"></i>
                <p class="mb-0">You haven't blocked anyone. Blocked profiles will appear here.</p>
            </div>
        <% } else { %>
            <div class="people-list">
            <% for (Map<String,String> req : block_user) { %>
                <div class="person-card">
                    <img class="person-avatar" src="upload/<%=req.get("code")%>.jpg" alt=""
                         onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
                    <div class="person-info">
                        <h5><%=req.get("name")%></h5>
                        <span class="person-meta">blocked</span>
                    </div>
                    <div class="person-actions">
                        <a href="block_action.jsp?id=<%=req.get("code")%>&action=unblock" class="btn btn-brand btn-sm">Unblock</a>                      </div>
                </div>
            <% } %>
            </div>
        <% } %>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
