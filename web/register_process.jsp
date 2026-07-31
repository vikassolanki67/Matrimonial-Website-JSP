<%-- 
    Document   : register_process
    Handles the form submitted by register.jsp
    Style follows the user's original code (Statement for select, PreparedStatement for insert - same as their update.jsp)
--%>
<%@page contentType="text/html" import="java.sql.* ,java.io.File,java.util.Random" pageEncoding="UTF-8"%>
<%
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String email = request.getParameter("email");
    String pass  = request.getParameter("pass");
    String cpass = request.getParameter("cpass");

    if(fname==null || lname==null || email==null || pass==null || cpass==null ||
       fname.trim().length()==0 || lname.trim().length()==0 || email.trim().length()==0 ||
       pass.trim().length()==0 || cpass.trim().length()==0)
    {
        response.sendRedirect("register.jsp?err=empty");
    }
    else if(!pass.equals(cpass))
    {
        response.sendRedirect("register.jsp?err=mismatch");
    }
    else
    {
        try
        {
            fname = fname.trim();
            lname = lname.trim();
            email = email.trim();

            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

            Statement st = cn.createStatement();
            ResultSet rsCheck = st.executeQuery("select user_id from registration_table where email='" + email + "'");

            if(rsCheck.next()){
                response.sendRedirect("register.jsp?err=exists");
            }
            else{
                ResultSet rsSn = st.executeQuery("select count(*) as c from registration_table");
                int sn = rsSn.next() ? rsSn.getInt("c") + 1 : 1;
                
                String hashedPass = sha256(pass);

                String chars = "abcdefghijklmnopqrstuvwxyz0123456789";
                Random rnd = new Random();
                StringBuilder codeBuilder = new StringBuilder();
                for(int i=0; i<8; i++){
                    codeBuilder.append(chars.charAt(rnd.nextInt(chars.length())));
                }
                String usercode = codeBuilder.toString();
                
                PreparedStatement ps = cn.prepareStatement("insert into registration_table (fname,lname,email,pass,usercode) " +
                    "values (?,?,?,?,?)");
                ps.setString(1, fname);
                ps.setString(2, lname);
                ps.setString(3, email);
                ps.setString(4, hashedPass);
                ps.setString(5, usercode);

                if(ps.executeUpdate() > 0){
                    Cookie c = new Cookie("email", email);
                    c.setMaxAge(60*60*24);
                    session.setAttribute(email, hashedPass);
                    session.setMaxInactiveInterval(1200);
                    response.addCookie(c);
                    File f = new File(request.getRealPath("/")+"/gallery/"+usercode);
                    f.mkdirs();
                    response.sendRedirect("index.jsp?id=" + usercode);
                }
                else{
                    out.println("Registration failed. Please try again.");
                }
            }
            cn.close();
        }
        catch(Exception er)
        {
            out.println(er.getMessage());
        }
    }
%>
<%!
    public String sha256(String text){
        try{
            java.security.MessageDigest md = java.security.MessageDigest.getInstance("SHA-256");
            byte[] digest = md.digest(text.getBytes("UTF-8"));
            StringBuilder sb = new StringBuilder();
            for(byte b : digest){ sb.append(String.format("%02x", b)); }
            return sb.toString();
        }catch(Exception e){ return text; }
    }
%>
