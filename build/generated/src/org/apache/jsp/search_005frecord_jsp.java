package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class search_005frecord_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    Cookie ct[] = request.getCookies();
    String email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) {
                email = ct[i].getValue();
            }
        }
    }
    if (email == null || session.getAttribute(email) == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String gender   = request.getParameter("gender");
    String caste    = request.getParameter("caste");
    String religion = request.getParameter("religion");
    if (caste != null)    { 
        caste = caste.trim();
    }
    if (religion != null) { 
        religion = religion.trim();
    }

      out.write('\n');
 request.setAttribute("pageTitle", "Search Results — Vivaah Circle"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<header class=\"profile-page-header\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <span class=\"eyebrow\">Results</span>\n");
      out.write("        <h1>Search Results</h1>\n");
      out.write("        <p>\n");
      out.write("            Showing ");
      out.print( (gender != null && gender.equalsIgnoreCase("female")) ? "female" : "male" );
      out.write(" profiles\n");
      out.write("            ");
 if (caste != null && caste.length() > 0) { 
            
      out.write("  Caste: ");
      out.print( caste );
      out.write("\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("            ");
 if (religion != null && religion.length() > 0) { 
            
      out.write("  Religion: ");
      out.print( religion );
      out.write("\n");
      out.write("            ");
 } 
      out.write("\n");
      out.write("        </p>\n");
      out.write("    </div>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("<section class=\"profile-form-wrap\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"table-responsive\">\n");
      out.write("            <table class=\"table align-middle search-results-table\">\n");
      out.write("                <thead>\n");
      out.write("                    <tr><th>Name</th><th>Gender</th><th>Caste</th><th>Religion</th><th>DOB</th><th>Occupation</th><th></th></tr>\n");
      out.write("                </thead>\n");
      out.write("                <tbody>\n");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial", "root", "");

        StringBuilder sql = new StringBuilder(
            "select rt.usercode, pt.full_name, pt.gender, pt.caste, pt.religion, pt.dob, pt.profession "
          + "from profile_table pt "
          + "join registration_table rt on rt.email = pt.contact_email "
          + "where pt.gender = '" + gender + "'"
        );
        if (caste != null && caste.length() > 0) {
            sql.append(" and pt.caste = '").append(caste).append("'");
        }
        if (religion != null && religion.length() > 0) {
            sql.append(" and pt.religion = '").append(religion).append("'");
        }

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery(sql.toString());

        boolean hasResults = false;
        while (rs.next()) {
            hasResults = true;
            String usercode = rs.getString("usercode");

      out.write("\n");
      out.write("                    <tr>\n");
      out.write("                        <td>");
      out.print( rs.getString("full_name") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getString("gender") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getString("caste") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getString("religion") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getString("dob") );
      out.write("</td>\n");
      out.write("                        <td>");
      out.print( rs.getString("profession") );
      out.write("</td>\n");
      out.write("                        <td><a href=\"user-profile.jsp?id=");
      out.print( usercode );
      out.write("\" class=\"btn btn-brand btn-sm\">View</a></td>\n");
      out.write("                    </tr>\n");

        }
        if (!hasResults) {

      out.write("\n");
      out.write("                    <tr><td colspan=\"7\" class=\"text-center text-muted py-4\">No matching profiles found. Try widening your filters.</td></tr>\n");

        }
        cn.close();
    } catch (Exception er) {
        out.println("<tr><td colspan='7'>Search error: " + er.getMessage() + "</td></tr>");
    }

      out.write("\n");
      out.write("                </tbody>\n");
      out.write("            </table>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"mt-3\">\n");
      out.write("            <a href=\"search.jsp\" class=\"btn btn-outline-brand\"><i class=\"bi bi-arrow-left\"></i> New Search</a>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
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
