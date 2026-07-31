<%-- 
    Document   : inbox
    Created on : 30 Jul, 2026, 4:00:04 PM
    Author     : LENOVO
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
%>
<html><body>
<h2>receive message</h2>
<%
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
            rs2.close(); ps2.close();

            PreparedStatement ps3 = cn.prepareStatement(
                "SELECT usercode, fname, lname FROM registration_table WHERE email=?");
            ps3.setString(1, fromEmail);
            ResultSet rs3 = ps3.executeQuery();
            String usercode = "";
            String fullname = "";
            if (rs3.next()) {
                usercode = rs3.getString("usercode");
                String fname = rs3.getString("fname") == null ? "" : rs3.getString("fname");
                String lname = rs3.getString("lname") == null ? "" : rs3.getString("lname");
                fullname = (fname + " " + lname).trim();
            }
            rs3.close(); 
            ps3.close();
%>
    <div style="border:1px solid #ccc; padding:10px; margin:8px;">
        <a href="user-profile.jsp?id=<%= usercode %>">
            <img src="upload/<%= usercode %>.jpg" width="50" height="50"
                 onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
            <b><%= fullname %></b>
        </a>
        <p><%= latestMessage %></p>
        <small><%= latestDt %></small>
    </div>
<%
        }
        rs.close(); 
        ps.close();
        cn.close();
    } catch (Exception e) {
        out.println(e.getMessage());
    }
%>
</body></html>
