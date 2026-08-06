<%-- 
    Document   : block_action
    Created on : 4 Aug, 2026, 5:21:20 PM
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
    String from = request.getParameter("from");
    String action = request.getParameter("action");
    
    if (usercode == null || usercode.trim().length() == 0) {
        response.sendRedirect("search.jsp");
        return;
    }
    usercode = usercode.trim();
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select usercode from registration_table where email='"+login_email+"'");
        String logincode = null;
        if (rs.next()) {
            logincode = rs.getString("usercode");
        }
        
        if("block".equals(action) || action==null){
            PreparedStatement ps = cn.prepareStatement("select * from registration_table where usercode=?");
            ps.setString(1, usercode);
            ResultSet rs2 = ps.executeQuery();
            String useremail = null;

            if (rs2.next()){
                useremail=rs2.getString("email");
            }
            if(logincode.equals(usercode)){
               response.sendRedirect("user-profile.jsp");
               return;
            }
            PreparedStatement ps2 = cn.prepareStatement("select * from interested where ( to_code = ? AND from_code = ?) OR ( to_code = ? AND from_code = ?)");
            ps2.setString(1, usercode);
            ps2.setString(2, logincode);
            ps2.setString(3, logincode);
            ps2.setString(4, usercode);
            ResultSet rs3 = ps2.executeQuery();

            if (rs3.next()){
                PreparedStatement ps3 = cn.prepareStatement("UPDATE interested SET status = 3, from_email = ?, to_email = ?, from_code = ?, to_code = ? WHERE " +"((from_email = ? AND to_email = ?) OR (from_email = ? AND to_email = ?))");
                    ps3.setString(1, login_email);
                    ps3.setString(2, useremail);
                    ps3.setString(3, logincode);
                    ps3.setString(4, usercode);
                    ps3.setString(5, login_email);
                    ps3.setString(6, useremail);
                    ps3.setString(7, useremail);
                    ps3.setString(8, login_email);
                    if (ps3.executeUpdate() > 0) {
                         if ("search".equals(from)) {
                            response.sendRedirect("search.jsp");
                            return;
                         }
                         else if("request".equals(from)){
                            response.sendRedirect("requests.jsp");
                            return;
                         }
                         else{
                           response.sendRedirect("Dashboard.jsp");
                           return;
                         }
                    }
            }
            else{

                PreparedStatement ps4 = cn.prepareStatement("INSERT INTO interested (from_email, to_email, from_code, to_code , status) VALUES (?,?, ?, ?, ?)");
                    ps4.setString(1, login_email);
                    ps4.setString(2, useremail);
                    ps4.setString(3, logincode);
                    ps4.setString(4, usercode);
                    ps4.setInt(5,3);
                if(ps4.executeUpdate() > 0){
                    if ("search".equals(from)) {
                       response.sendRedirect("search.jsp");
                       return;
                    }
                    else if("request".equals(from)){
                       response.sendRedirect("requests.jsp");
                       return;
                    }
                    else{
                      response.sendRedirect("Dashboard.jsp");
                      return;
                    }
                }
            }
        }
        else{
            PreparedStatement ps5 = cn.prepareStatement("UPDATE interested SET status=-2 WHERE from_code=? AND to_code=? AND status=3");
            ps5.setString(1, logincode);
            ps5.setString(2, usercode);
            if (ps5.executeUpdate() > 0) {
                response.sendRedirect("block.jsp");
                return;
            }
        }
        
        cn.close();
    }
    catch (Exception er) {
        out.println("Request update error: " + er.getMessage());
    }
    response.sendRedirect("user-profile.jsp?id=" + usercode);
   
%>
