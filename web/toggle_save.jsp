<%-- 
    Document   : toggle_save
    Created on : 1 Aug, 2026, 4:25:33 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    Cookie ct[] = request.getCookies();
    String login_email = null;
    if (ct != null) {
        for (Cookie c : ct) {
            if ("email".equals(c.getName())) {
                login_email = c.getValue();
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
        ResultSet rs = st.executeQuery("select email from registration_table where usercode='"+usercode+"'");
        String otheremail = null;
        if (rs.next()) {
            otheremail = rs.getString("email");
        }

        Statement stCheck = cn.createStatement();
        ResultSet rsCheck = stCheck.executeQuery(
            "select * from saved_profiles where loginemail='" + login_email + "' AND otheremail='" + otheremail + "'");

        if (rsCheck.next()) {
            // Already saved -> remove (unsave)
            PreparedStatement ps = cn.prepareStatement(
                "DELETE FROM saved_profiles WHERE loginemail=? AND otheremail=?");
            ps.setString(1, login_email);
            ps.setString(2, otheremail);
            ps.executeUpdate();
        } else {
            // Not saved yet -> insert (save)
            PreparedStatement ps = cn.prepareStatement(
                "INSERT INTO saved_profiles (loginemail, otheremail) VALUES (?, ?)");
            ps.setString(1, login_email);
            ps.setString(2, otheremail);
            ps.executeUpdate();
        }

        cn.close();
    } catch (Exception er) {
        out.println("Save/Unsave error: " + er.getMessage());
    }
    response.sendRedirect("user-profile.jsp?id=" + usercode);
%>