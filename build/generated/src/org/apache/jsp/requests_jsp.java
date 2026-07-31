package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;
import java.util.*;

public final class requests_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    List<Map<String,String>> pendingRequests = new ArrayList<Map<String,String>>();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select * from registration_table where email='"+login_email+"'");

        String logincode = null;
        if (rs.next()) {
            logincode = rs.getString("usercode");
        }

        Statement st1 = cn.createStatement();
        ResultSet rs1 = st1.executeQuery("select * from interested where to_code='"+logincode+"' AND status = 0");

        while (rs1.next()) {
            String senderCode = rs1.getString("from_code");
            String senderEmail = rs1.getString("from_email");

            // Look up the sender's display name from profile_table (same
            // contact_email join pattern already used in edit.jsp / view_profile.jsp)
            String senderName = senderEmail;
            Statement st2 = cn.createStatement();
            ResultSet rs2 = st2.executeQuery("select full_name from profile_table where contact_email='"+senderEmail+"'");
            if (rs2.next()) {
                senderName = rs2.getString("full_name");
            }

            Map<String,String> row = new HashMap<String,String>();
            row.put("code", senderCode);
            row.put("email", senderEmail);
            row.put("name", senderName);
            pendingRequests.add(row);
        }

        cn.close();
    }
    catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }

      out.write('\n');
 request.setAttribute("pageTitle", "Requests — Vivaah Circle"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<!-- Plain, unstyled on purpose -- design this yourself as planned. -->\n");
      out.write("<div style=\"padding-top:140px; padding-bottom:60px; max-width:700px; margin:0 auto;\">\n");
      out.write("    <h1>Interest Requests</h1>\n");
      out.write("\n");
      out.write("    ");
 if (pendingRequests.isEmpty()) { 
      out.write("\n");
      out.write("        <p>No pending requests right now.</p>\n");
      out.write("    ");
 } else {
        for (Map<String,String> req : pendingRequests) {
    
      out.write("\n");
      out.write("        <div style=\"display:flex; align-items:center; gap:16px; margin-bottom:16px;\">\n");
      out.write("            <img src=\"upload/");
      out.print(req.get("code"));
      out.write(".jpg\" alt=\"\" width=\"60\" height=\"60\" onerror=\"this.onerror=null;this.src='assets/images/default-profile.svg';\">\n");
      out.write("            <span>");
      out.print(req.get("name"));
      out.write("</span>\n");
      out.write("            <a href=\"request_pending.jsp?id=");
      out.print(req.get("code"));
      out.write("\">View Profile</a>\n");
      out.write("        </div>\n");
      out.write("    ");
  }
    } 
      out.write("\n");
      out.write("</div>\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/footer.jsp", out, false);
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
