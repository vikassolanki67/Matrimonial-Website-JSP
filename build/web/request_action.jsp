<%-- 
    Document   : request_action
    Accept / decline an interest request sent to the logged in user.
    Expects: ?id=<sender's usercode>&action=accept|decline
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

    String senderCode = request.getParameter("id");
    String action = request.getParameter("action");
    String from = request.getParameter("from"); 
    
    if (senderCode == null || senderCode.trim().length() == 0 || action == null) {
        response.sendRedirect("requests.jsp");
        return;
    }
    senderCode = senderCode.trim();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select usercode from registration_table where email='"+login_email+"'");
        String logincode = null;
        if (rs.next()) {
            logincode = rs.getString("usercode");
        }

        int newStatus = "accept".equals(action) ? 1 : -1;

        PreparedStatement ps;

        if ("accept".equals(action)) {
            ps = cn.prepareStatement("UPDATE interested SET status = 1 WHERE from_code = ? AND to_code = ? AND status = 0");
            ps.setString(1, senderCode);
            ps.setString(2, logincode);
        }
        else if ("decline".equals(action)) {
            ps = cn.prepareStatement("UPDATE interested SET status = -1 WHERE from_code = ? AND to_code = ? AND status = 0");
            ps.setString(1, senderCode);
            ps.setString(2, logincode);
        }
        else if("withdraw".equals(action)){
             ps = cn.prepareStatement("UPDATE interested SET status = -2 WHERE from_code = ? AND to_code = ? AND status = 0");
             ps.setString(1, logincode);
             ps.setString(2, senderCode);
        }
        else if ("cancel".equals(action)) {
            ps = cn.prepareStatement("UPDATE interested SET status = -2 WHERE " +"((from_code = ? AND to_code = ?) OR (from_code = ? AND to_code = ?)) AND status = 1");
            ps.setString(1, senderCode);
            ps.setString(2, logincode);
            ps.setString(3, logincode);
            ps.setString(4, senderCode);
        }
        else {
            response.sendRedirect("requests.jsp");
            return;
        }

        if (ps.executeUpdate() > 0) {
            if ("profile".equals(from)) {
                response.sendRedirect("user-profile.jsp?id=" + senderCode);
            } else {
                response.sendRedirect("requests.jsp");
            }
            return;
        }
        response.sendRedirect("requests.jsp");

        cn.close();
    }
    catch (Exception er) {
        out.println("Request update error: " + er.getMessage());
    }
    response.sendRedirect("requests.jsp");
%>