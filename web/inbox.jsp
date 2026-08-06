<%-- 
    Document   : inbox
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

    List<Map<String,String>> inboxList = new ArrayList<Map<String,String>>();
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        PreparedStatement ps = cn.prepareStatement(
            "SELECT from_email, MAX(dt) AS latest_dt FROM message WHERE to_email=? GROUP BY from_email");
        ps.setString(1, login_email);
        ResultSet rs = ps.executeQuery();

        while (rs.next()) {
            String fromEmail = rs.getString("from_email");
            String latestDt = rs.getString("latest_dt");

            PreparedStatement ps2 = cn.prepareStatement(
                "SELECT message FROM message WHERE from_email=? AND dt=? LIMIT 1");
            ps2.setString(1, fromEmail);
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
            ps3.setString(1, fromEmail);
            ResultSet rs3 = ps3.executeQuery();
            String usercode = "";
            String fullname = fromEmail;
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
            inboxList.add(row);
        }
        rs.close();
        ps.close();
        cn.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
<% request.setAttribute("pageTitle", "Inbox — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Messages</span>
        <h1>Inbox</h1>
        <p>Conversations others have started with you.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow">
        <% if (inboxList.isEmpty()) { %>
            <div class="people-empty">
                <i class="bi bi-inbox"></i>
                <p class="mb-0">No messages yet.</p>
            </div>
        <% } else { %>
            <div class="people-list">
            <% for (Map<String,String> row : inboxList) { %>
                <a href="message.jsp?id=<%= row.get("code") %>&from=inbox" class="person-card" style="text-decoration:none; color:inherit;">
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
