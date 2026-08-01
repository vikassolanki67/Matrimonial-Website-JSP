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

    String usercode = request.getParameter("id");
    String message = request.getParameter("message");

    if (usercode == null || usercode.trim().isEmpty()) {
        response.sendRedirect("user-profile.jsp");
        return;
    }

    if (message == null || message.trim().isEmpty()) {
        response.sendRedirect("message.jsp?err=empty&id="+usercode);
        return;
    }

    usercode = usercode.trim();
    String logincode = null;
    
    try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");
        
         Statement st1 = cn.createStatement();
        ResultSet rs2 = st1.executeQuery("select * from registration_table where email='"+login_email+"'");
        if (rs2.next()) {
            logincode  = rs2.getString("usercode");
        }
        Statement st3 = cn.createStatement();
        ResultSet rs3 = st3.executeQuery("select status from interested where ((from_code='" + logincode + "' AND to_code='" + usercode + "') OR (from_code='" + usercode + "' AND to_code='" + logincode + "')) AND status=1");
        if (!rs3.next()) {
            response.sendRedirect("user-profile.jsp?id=" + usercode);
            return;
        }
        
        PreparedStatement ps = cn.prepareStatement("SELECT email FROM registration_table WHERE usercode=?");
        ps.setString(1, usercode);
        ResultSet rs = ps.executeQuery();

        String useremail = null;

        if (rs.next()) {
            useremail = rs.getString("email");
        } else {
            response.sendRedirect("message.jsp?err=usernotfound&id="+usercode);
            return;
        }

        rs.close();
        ps.close();

        String chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
        Random random = new Random();
        StringBuilder sb = new StringBuilder();

        for (int i = 0; i < 8; i++) {
            sb.append(chars.charAt(random.nextInt(chars.length())));
        }
        String code = sb.toString();

        ps = cn.prepareStatement("INSERT INTO message(code,from_email,to_email,message) VALUES(?,?,?,?)");

        ps.setString(1, code);
        ps.setString(2, login_email);
        ps.setString(3, useremail);
        ps.setString(4, message);

        if (ps.executeUpdate() > 0) {
            response.sendRedirect("message.jsp?mess=success&id="+usercode);
        } else {
            response.sendRedirect("message.jsp?err=nosend&id="+usercode);
        }

        ps.close();
        cn.close();

    } catch (Exception e) {
        out.println(e.getMessage());
    }
    %>