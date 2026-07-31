<%-- 
    Document   : message
    Created on : 29 Jul, 2026, 8:51:15 AM
    Author     : LENOVO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*, java.util.*"%>
<%
String err = request.getParameter("err");

    if ("nosend".equals(err)) {
%>
        <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Message are not send.</span></div>

<% }else if ("empty".equals(err)) { %>
        <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Please Enter your Message.</span></div>
<% } 
   String mess = request.getParameter("mess");
   if ("success".equals(mess)) {
%>
    <div class="alert-soft alert-soft-success mb-3"><i class="bi bi-check-circle-fill"></i><span>Message sent successfully.</span></div>
<%
   }

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
    String latestDt = null;
    Integer sn = null;
    String message = null;
    String from_email = null;
    String to_email = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");
        
        Statement st1 = cn.createStatement();
        ResultSet rs2 = st1.executeQuery("select * from registration_table where email='"+loginemail+"'");
        if (rs2.next()) {
            logincode  = rs2.getString("usercode");
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
            latestDt = rs1.getString("dt");
            sn = rs1.getInt("sn");
            message = rs1.getString("message");
            from_email = rs1.getString("from_email");
            to_email = rs1.getString("to_email");
            if (rs1.getString("from_email").equals(loginemail)) {
            %>
                <div style="text-align:right; margin:8px;">
                    <span style="background:#DCF8C6; padding:8px 12px; border-radius:10px; display:inline-block;">
                        <%= message %>
                    </span><br>
                    <small><%= latestDt %></small>
                    &nbsp;<a href="delete_message.jsp?sn=<%= sn %>&id=<%= usercode %>" style="color:red; font-size:12px;">Delete</a>
                </div>
            <%
            } else {
            %>
                <div style="text-align:left; margin:8px;">
                    <span style="background:#F1F0F0; padding:8px 12px; border-radius:10px; display:inline-block;">
                        <%= message %>
                    </span><br>
                    <small><%= latestDt %></small>
                    &nbsp;<a href="delete_message.jsp?sn=<%= sn %>&id=<%= usercode %>" style="color:red; font-size:12px;">Delete</a>
                </div>
            <%
            }
        }
    
    cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>
    <h2><%= fullname %></h2>

    <form action="send_message.jsp?id=<%= usercode %>" method="post">
   <%--
        <input type="hidden" name="to_email" value="<%= useremail %>">

        <input type="hidden" name="usercode" value="<%= usercode %>">
    --%>    
        <textarea name="message" rows="5" cols="50" placeholder="Enter your message..." required>
        
        </textarea><br><br>

        <input type="submit" value="Send">

    </form>