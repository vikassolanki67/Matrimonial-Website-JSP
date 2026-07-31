package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class interested_005fprocess_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');

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

    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
