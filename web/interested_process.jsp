<%-- 
    Document   : interested_process
    Created on : 25 Jul, 2026, 2:25:09 PM
    Author     : LENOVO
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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

    String usercode = request.getParameter("id");
    if (usercode == null || usercode.trim().length() == 0) {
        response.sendRedirect("search.jsp");
        return;
    }
     usercode = usercode.trim();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from registration_table where usercode='"+usercode+"'");

        String useremail = null;
        if (rs.next()) {    
            useremail = rs.getString("email");
        } 
        Statement st1= cn.createStatement();
        ResultSet rs1 = st1.executeQuery("select * from registration_table where email='"+login_email+"'");
        
        String logincode = null;
        if (rs1.next()) {    
            logincode = rs1.getString("usercode");
        }
        if(logincode.equals(usercode)){
           response.sendRedirect("user-profile.jsp"); 
        }
        else{
            Statement st2 = cn.createStatement();
            ResultSet rs2 = st2.executeQuery("select * from interested where ( to_code='"+usercode+"' AND from_code='"+logincode+"') OR ( to_code='"+logincode+"' AND from_code='"+usercode+"')");
            String status = null;
            if(rs2.next()){
                status = rs2.getString("status");
                
                if (status.equals("0") || status.equals("1")) {
                    response.sendRedirect("user-profile.jsp?mess=exists&id="+usercode);
                }
                else if (status.equals("-1") || status.equals("-2")) {
                    PreparedStatement ps = cn.prepareStatement("UPDATE interested SET status = 0, from_email = ?, to_email = ?, from_code = ?, to_code = ? WHERE " +"((from_email = ? AND to_email = ?) OR (from_email = ? AND to_email = ?)) " +"AND (status = -1 OR status = -2)");
                    ps.setString(1, login_email);
                    ps.setString(2, useremail);
                    ps.setString(3, logincode);
                    ps.setString(4, usercode);
                    ps.setString(5, login_email);
                    ps.setString(6, useremail);
                    ps.setString(7, useremail);
                    ps.setString(8, login_email);
                    if (ps.executeUpdate() > 0) {
                        response.sendRedirect("user-profile.jsp?mess=success&id=" + usercode);
                    }
               }
            }
            else{
                PreparedStatement ps = cn.prepareStatement("INSERT INTO interested (from_email, to_email, from_code, to_code) VALUES (?, ?, ?, ?)");
                    ps.setString(1, login_email);
                    ps.setString(2, useremail);
                    ps.setString(3, logincode);
                    ps.setString(4, usercode);
                if(ps.executeUpdate() > 0){
                   response.sendRedirect("user-profile.jsp?mess=success&id=" + usercode);
                }
            }
        }
        
        cn.close();
    } 
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>