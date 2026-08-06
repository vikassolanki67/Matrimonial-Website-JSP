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
    
    String from = request.getParameter("from");
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

        PreparedStatement ps1 = cn.prepareStatement("SELECT usercode FROM registration_table WHERE email=?");
        ps1.setString(1, loginemail);
        ResultSet rs2 = ps1.executeQuery();
        if (rs2.next()) {
            logincode = rs2.getString("usercode");
        }
        PreparedStatement ps2 = cn.prepareStatement("SELECT status FROM interested WHERE ((from_code=? AND to_code=?) OR (from_code=? AND to_code=?)) AND status=?");
        ps2.setString(1, logincode);
        ps2.setString(2, usercode);
        ps2.setString(3, usercode);
        ps2.setString(4, logincode);
        ps2.setInt(5, 1);

        ResultSet rs3 = ps2.executeQuery();
        if (!rs3.next()) {
            if ("inbox".equals(from)) {
                response.sendRedirect("inbox.jsp");
            } else if ("send".equals(from)) {
                response.sendRedirect("send.jsp");
            } else {
                response.sendRedirect("user-profile.jsp?id=" + usercode);
            }

            return;
        }
        
        PreparedStatement ps3 = cn.prepareStatement("SELECT * FROM registration_table WHERE usercode=?"); 
        ps3.setString(1, usercode);
        ResultSet rs = ps3.executeQuery();
        if (rs.next()) {
           
           useremail = rs.getString("email");

           String fname = rs.getString("fname") == null ? "" : rs.getString("fname");
           String lname = rs.getString("lname") == null ? "" : rs.getString("lname");
           fullname = (fname + " " + lname).trim();
        }

       PreparedStatement ps4 = cn.prepareStatement("SELECT * FROM message WHERE (to_email=? AND from_email=?) OR (to_email=? AND from_email=?) ORDER BY dt");

        ps4.setString(1, useremail);
        ps4.setString(2, loginemail);
        ps4.setString(3, loginemail);
        ps4.setString(4, useremail);

        ResultSet rs1 = ps4.executeQuery();

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
        <%-- <%
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
--%>
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
                            &nbsp;&middot;&nbsp;<a class="chat-delete" href="delete_message.jsp?sn=<%= row.get("sn") %>&id=<%= usercode %>"><i class="bi bi-trash3"></i></a>
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
