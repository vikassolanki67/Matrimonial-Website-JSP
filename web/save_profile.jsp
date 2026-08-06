.,jhg<%-- 
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
            PreparedStatement ps = cn.prepareStatement("select * from interested where (( to_email = ? AND from_email = ?) OR ( to_email = ? AND from_email = ?)) AND status = 3");
            ps.setString(1,otherEmail );
            ps.setString(2, login_email);
            ps.setString(3, login_email);
            ps.setString(4,otherEmail );
            
            ResultSet rs5 = ps.executeQuery();
            if (rs5.next()) {
                 continue;
            }else{
                PreparedStatement ps2 = cn.prepareStatement("select usercode, fname, lname from registration_table where email=?");
                ps2.setString(1, otherEmail);
                ResultSet rs2 = ps2.executeQuery();  
                
                String usercode = "";
                String fullname = null;
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
        }
        cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>
<% request.setAttribute("pageTitle", "Saved Profiles — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Bookmarks</span>
        <h1>Saved Profiles</h1>
        <p>Profiles you've bookmarked to revisit later.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow">
        <% if (saved.isEmpty()) { %>
            <div class="people-empty">
                <i class="bi bi-bookmark-heart"></i>
                <p class="mb-0">You haven't saved any profiles yet.</p>
            </div>
        <% } else { %>
            <div class="people-list">
            <% for (Map<String,String> row : saved) { %>
                <div class="person-card">
                    <img class="person-avatar" src="upload/<%=row.get("code")%>.jpg" alt=""
                         onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
                    <div class="person-info">
                        <h5><%=row.get("name")%></h5>
                        <span class="person-meta">Saved profile</span>
                    </div>
                    <div class="person-actions">
                        <a href="user-profile.jsp?id=<%=row.get("code")%>" class="btn btn-brand btn-sm">View Profile</a>
                    </div>
                </div>
            <% } %>
            </div>
        <% } %>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
