<%-- 
    Document   : record
    Login check - matrimonial DB, registration_table
    Style follows the user's original record.jsp
--%>

<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%!
    // A hashed password is always 64 hex characters (SHA-256).
    // Old rows in the DB were saved as plain text (e.g. "123", "rahul123"),
    // so this checks both formats - old accounts keep working.
    public boolean passMatches(String entered, String stored){
        if(stored != null && stored.length()==64 && stored.matches("^[0-9a-fA-F]{64}$")){
            return sha256(entered).equals(stored);
        }
        return entered.equals(stored);
    }
    public String sha256(String text){
        try{
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(text.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for(byte b : digest){ sb.append(String.format("%02x", b)); }
            return sb.toString();
        }catch(Exception e){ 
            return text;
        }
    }
%>

<%
    String email = request.getParameter("email");
    String pass  = request.getParameter("pass");

    if(email == null || email.trim().length() == 0 || pass == null || pass.trim().length() == 0)
    {
        response.sendRedirect("login.jsp?empty=1");
    }
    else
    {
        email = email.trim();
        pass  = pass.trim();
        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from registration_table where email='" + email + "'");
            if(rs.next()){
                
                String storedPass = rs.getString("pass");

                if(passMatches(pass, storedPass)){
                    Cookie c = new Cookie("email", email);
                    c.setMaxAge(60*60*24);
                    session.setAttribute(email,storedPass);
                    session.setMaxInactiveInterval(1200);
                    response.addCookie(c);
                    response.sendRedirect("Dashboard.jsp");
                }
                else{
                    response.sendRedirect("login.jsp?invalid_pass=1");
                }
            }
            else{
                response.sendRedirect("login.jsp?invalid_email=1");
            }
            cn.close();
        }
        catch(Exception er)
        {
            out.println(er.getMessage());
        }
    }
%>
