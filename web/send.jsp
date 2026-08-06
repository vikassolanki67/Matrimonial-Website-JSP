<%-- 
    Document   : send
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*,java.util.*"%>
<%
    Cookie ct[] = request.getCookies();
    String login_email = null;
    if (ct != null) {
        for (Cookie c : ct) {
            if ("email".equals(c.getName())) {
                login_email = c.getValue();
                break;
            }
        }
    }
    if (login_email == null || session.getAttribute(login_email) == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Map<String,String>> sentList = new ArrayList<Map<String,String>>();
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        PreparedStatement ps = cn.prepareStatement(
            "SELECT to_email, MAX(dt) AS latest_dt FROM message WHERE from_email=? GROUP BY to_email");
        ps.setString(1, login_email);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String toEmail = rs.getString("to_email");
            String latestDt = rs.getString("latest_dt");

            PreparedStatement ps2 = cn.prepareStatement(
                "SELECT message FROM message WHERE to_email=? AND dt=? LIMIT 1");
            ps2.setString(1, toEmail);
            ps2.setString(2, latestDt);
            ResultSet rs2 = ps2.executeQuery();
            String latestMessage = "";
            if (rs2.next()) {
                latestMessage = rs2.getString("message");
            }
            rs2.close();
            ps2.close();

            PreparedStatement ps3 = cn.prepareStatement(
                "SELECT usercode, fname, lname FROM registration_table WHERE email=?");
            ps3.setString(1, toEmail);
            ResultSet rs3 = ps3.executeQuery();
            String usercode = "";
            String fullname = toEmail;
            if (rs3.next()) {
                usercode = rs3.getString("usercode");
                String fname = rs3.getString("fname") == null ? "" : rs3.getString("fname");
                String lname = rs3.getString("lname") == null ? "" : rs3.getString("lname");
                fullname = (fname + " " + lname).trim();
            }
            rs3.close();
            ps3.close();

            Map<String,String> row = new HashMap<String,String>();
            row.put("code", usercode);
            row.put("name", fullname);
            row.put("latest", latestMessage);
            row.put("dt", latestDt);
            sentList.add(row);
        }
        rs.close();
        ps.close();
        cn.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
<% request.setAttribute("pageTitle", "Sent — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Messages</span>
        <h1>Sent</h1>
        <p>Conversations you've started.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow">
        <% if (sentList.isEmpty()) { %>
            <div class="people-empty">
                <i class="bi bi-send"></i>
                <p class="mb-0">You haven't sent any messages yet.</p>
            </div>
        <% } else { %>
            <div class="people-list">
            <% for (Map<String,String> row : sentList) { %>
                <a href="message.jsp?id=<%= row.get("code")%>&from=send" class="person-card" style="text-decoration:none; color:inherit;">
                    <img class="person-avatar" src="upload/<%= row.get("code") %>.jpg" alt=""
                         onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
                    <div class="person-info">
                        <h5><%= row.get("name") %></h5>
                        <span class="person-latest"><%= row.get("latest") %></span>
                    </div>
                    <div class="person-actions">
                        <span class="person-meta"><%= row.get("dt") %></span>
                    </div>
                </a>
            <% } %>
            </div>
        <% } %>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
