<%-- 
    Document   : message
    Created on : 29 Jul, 2026, 8:51:15 AM
    Author     : LENOVO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<%
    Cookie ct[] = request.getCookies();
    String loginemail = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) {
                loginemail = ct[i].getValue();
            }
        }
    }
    if (loginemail == null || session.getAttribute(loginemail) == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String usercode = request.getParameter("id");
    if (usercode == null || usercode.trim().length() == 0) {
        response.sendRedirect("user-profile.jsp");
        return;
    }
    usercode = usercode.trim();

    String useremail = null;
    String fullname = null;
    String logincode = null;
    List<Map<String,String>> chat = new ArrayList<Map<String,String>>();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        Statement st1 = cn.createStatement();
        ResultSet rs2 = st1.executeQuery("select * from registration_table where email='"+loginemail+"'");
        if (rs2.next()) {
            logincode = rs2.getString("usercode");
        }
        Statement st3 = cn.createStatement();
        ResultSet rs3 = st3.executeQuery("select status from interested where ((from_code='" + logincode + "' AND to_code='" + usercode + "') OR (from_code='" + usercode + "' AND to_code='" + logincode + "')) AND status=1");
        if (!rs3.next()) {
            response.sendRedirect("user-profile.jsp?id=" + usercode);
            return;
        }
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from registration_table where usercode='"+usercode+"'");
        if (rs.next()) {
            useremail = rs.getString("email");
            String fname = rs.getString("fname") == null ? "" : rs.getString("fname");
            String lname = rs.getString("lname") == null ? "" : rs.getString("lname");
            fullname = (fname + " " + lname).trim();
        }

        Statement st2 = cn.createStatement();
        ResultSet rs1 = st2.executeQuery("select * from message WHERE (to_email='"+useremail+"' AND from_email='"+loginemail+"') OR (to_email='"+loginemail+"' AND from_email='"+useremail+"') ORDER BY dt");

        while (rs1.next()) {
            Map<String,String> row = new HashMap<String,String>();
            row.put("sn", String.valueOf(rs1.getInt("sn")));
            row.put("message", rs1.getString("message"));
            row.put("dt", rs1.getString("dt"));
            row.put("mine", rs1.getString("from_email").equals(loginemail) ? "yes" : "no");
            chat.add(row);
        }
        cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>
<% request.setAttribute("pageTitle", fullname + " — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Conversation</span>
        <h1><%= fullname %></h1>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow" style="max-width:700px;">
        <%
            String errP = request.getParameter("err");
            if ("nosend".equals(errP)) {
        %>
            <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Message was not sent.</span></div>
        <% } else if ("empty".equals(errP)) { %>
            <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Please enter your message.</span></div>
        <% }
            String messP = request.getParameter("mess");
            if ("success".equals(messP)) {
        %>
            <div class="alert-soft alert-soft-success mb-3"><i class="bi bi-check-circle-fill"></i><span>Message sent successfully.</span></div>
        <% } else if ("delete".equals(messP)) { %>
            <div class="alert-soft alert-soft-success mb-3"><i class="bi bi-check-circle-fill"></i><span>Message deleted.</span></div>
        <% } else if ("nodata".equals(messP)) { %>
            <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>That message is not available.</span></div>
        <% } %>

        <div class="chat-thread">
            <% if (chat.isEmpty()) { %>
                <p class="text-muted text-center mb-0">No messages yet. Say hello!</p>
            <% } else {
                for (Map<String,String> row : chat) {
                    boolean mine = "yes".equals(row.get("mine"));
            %>
                <div class="chat-row <%= mine ? "chat-row--mine" : "chat-row--theirs" %>">
                    <div class="chat-bubble <%= mine ? "chat-bubble--mine" : "chat-bubble--theirs" %>">
                        <%= row.get("message") %>
                        <span class="chat-time">
                            <%= row.get("dt") %>
                            &nbsp;&middot;&nbsp;<a class="chat-delete" href="delete_message.jsp?sn=<%= row.get("sn") %>&id=<%= usercode %>">Delete</a>
                        </span>
                    </div>
                </div>
            <%  }
            } %>
        </div>

        <form action="send_message.jsp?id=<%= usercode %>" method="post" class="message-composer">
            <textarea name="message" rows="2" placeholder="Type a message..." required></textarea>
            <button type="submit" class="btn btn-brand"><i class="bi bi-send"></i></button>
        </form>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
