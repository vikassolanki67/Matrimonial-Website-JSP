package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class message_jsp extends org.apache.jasper.runtime.HttpJspBase
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

String err = request.getParameter("err");

    if ("nosend".equals(err)) {

      out.write("\n");
      out.write("        <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>Message are not send.</span></div>\n");
      out.write("\n");
 }else if ("empty".equals(err)) { 
      out.write("\n");
      out.write("        <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>Please Enter your Message.</span></div>\n");
 } 
   String mess = request.getParameter("mess");
   if ("success".equals(mess)) {

      out.write("\n");
      out.write("    <div class=\"alert-soft alert-soft-success mb-3\"><i class=\"bi bi-check-circle-fill\"></i><span>Message sent successfully.</span></div>\n");

   }

    Cookie ct[] = request.getCookies();
    String loginemail = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) {
                loginemail = ct[i].getValue();
            }
        }
    }
    if (loginemail == null || session.getAttribute(loginemail) == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    String usercode = request.getParameter("id");
    if (usercode == null || usercode.trim().length() == 0) {
        response.sendRedirect("user-profile.jsp");
        return; 
    }
    usercode = usercode.trim();
    
    String useremail = null;
    String fullname = null;
    String logincode = null;
    String latestDt = null;
    Integer sn = null;
    String message = null;
    String from_email = null;
    String to_email = null;
    
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");
        
        Statement st1 = cn.createStatement();
        ResultSet rs2 = st1.executeQuery("select * from registration_table where email='"+loginemail+"'");
        if (rs2.next()) {
            logincode  = rs2.getString("usercode");
        }
        Statement st3 = cn.createStatement();
        ResultSet rs3 = st3.executeQuery("select status from interested where ((from_code='" + logincode + "' AND to_code='" + usercode + "') OR (from_code='" + usercode + "' AND to_code='" + logincode + "')) AND status=1");
        if (!rs3.next()) {
            response.sendRedirect("user-profile.jsp?id=" + usercode);
            return;
        }
        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from registration_table where usercode='"+usercode+"'");
        if (rs.next()) {
            useremail = rs.getString("email");
            
            String fname = rs.getString("fname") == null ? "" : rs.getString("fname");
            String lname = rs.getString("lname") == null ? "" : rs.getString("lname");
            fullname = (fname + " " + lname).trim();
        }
        
        Statement st2 = cn.createStatement();
        ResultSet rs1 = st2.executeQuery("select * from message WHERE (to_email='"+useremail+"' AND from_email='"+loginemail+"') OR (to_email='"+loginemail+"' AND from_email='"+useremail+"') ORDER BY dt");
        
        while (rs1.next()) {
            latestDt = rs1.getString("dt");
            sn = rs1.getInt("sn");
            message = rs1.getString("message");
            from_email = rs1.getString("from_email");
            to_email = rs1.getString("to_email");
            if (rs1.getString("from_email").equals(loginemail)) {
            
      out.write("\n");
      out.write("                <div style=\"text-align:right; margin:8px;\">\n");
      out.write("                    <span style=\"background:#DCF8C6; padding:8px 12px; border-radius:10px; display:inline-block;\">\n");
      out.write("                        ");
      out.print( message );
      out.write("\n");
      out.write("                    </span><br>\n");
      out.write("                    <small>");
      out.print( latestDt );
      out.write("</small>\n");
      out.write("                    &nbsp;<a href=\"delete_message.jsp?sn=");
      out.print( sn );
      out.write("&id=");
      out.print( usercode );
      out.write("\" style=\"color:red; font-size:12px;\">Delete</a>\n");
      out.write("                </div>\n");
      out.write("            ");

            } else {
            
      out.write("\n");
      out.write("                <div style=\"text-align:left; margin:8px;\">\n");
      out.write("                    <span style=\"background:#F1F0F0; padding:8px 12px; border-radius:10px; display:inline-block;\">\n");
      out.write("                        ");
      out.print( message );
      out.write("\n");
      out.write("                    </span><br>\n");
      out.write("                    <small>");
      out.print( latestDt );
      out.write("</small>\n");
      out.write("                    &nbsp;<a href=\"delete_message.jsp?sn=");
      out.print( sn );
      out.write("&id=");
      out.print( usercode );
      out.write("\" style=\"color:red; font-size:12px;\">Delete</a>\n");
      out.write("                </div>\n");
      out.write("            ");

            }
        }
    
    cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }

      out.write("\n");
      out.write("    <h2>");
      out.print( fullname );
      out.write("</h2>\n");
      out.write("\n");
      out.write("    <form action=\"send_message.jsp?id=");
      out.print( usercode );
      out.write("\" method=\"post\">\n");
      out.write("   ");
      out.write("    \n");
      out.write("        <textarea name=\"message\" rows=\"5\" cols=\"50\" placeholder=\"Enter your message...\" required>\n");
      out.write("        \n");
      out.write("        </textarea><br><br>\n");
      out.write("\n");
      out.write("        <input type=\"submit\" value=\"Send\">\n");
      out.write("\n");
      out.write("    </form>");
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
