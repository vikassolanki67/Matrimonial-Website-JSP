<%-- 
    Document   : delete_message
    Created on : 1 Aug, 2026, 12:32:10 AM
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
    
    String sn = request.getParameter("sn");
    if (sn == null || sn.trim().length() == 0) {
        response.sendRedirect("message.jsp");
        return; 
    }
    String usercode = request.getParameter("id");
    if (usercode == null || usercode.trim().length() == 0) {
        response.sendRedirect("user-profile.jsp");
        return; 
    }
    usercode = usercode.trim();
    sn = sn.trim();
    try {

        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");
        
        Statement st = cn.createStatement();
        int rs = st.executeUpdate("DELETE FROM message WHERE ((from_email ='"+login_email+"') OR (to_email='"+login_email+"')) AND sn ='"+sn+"'");
        if( rs> 0){
            response.sendRedirect("message.jsp?mess=delete&id="+usercode);
        }
        else {
           response.sendRedirect("message.jsp?mess=nodata&id="+usercode);
        }
 
    cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>