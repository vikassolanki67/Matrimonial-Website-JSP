package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
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
            if (ct[i].getName().equals("email")) { email = ct[i].getValue(); }
        }
    }
    if (email == null || session.getAttribute(email) == null) {
        response.sendRedirect("login.jsp");
        return;
    }

      out.write('\n');
 request.setAttribute("pageTitle", "Search Members — Vivaah Circle"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<header class=\"profile-page-header\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <span class=\"eyebrow\">Find a match</span>\n");
      out.write("        <h1>Search Other Members</h1>\n");
      out.write("        <p>Narrow down profiles by gender, caste, and religion.</p>\n");
      out.write("    </div>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("<section class=\"profile-form-wrap\">\n");
      out.write("    <div class=\"container-narrow\" style=\"max-width:700px;\">\n");
      out.write("        <form method=\"post\" action=\"search_record.jsp\">\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">1</span><h4>Search Filters</h4></div>\n");
      out.write("                <div class=\"row g-3\">\n");
      out.write("                    <div class=\"col-12\">\n");
      out.write("                        <label class=\"d-block mb-2\">Gender</label>\n");
      out.write("                        <div class=\"d-flex gap-4\">\n");
      out.write("                            <div class=\"form-check\">\n");
      out.write("                                <input class=\"form-check-input\" type=\"radio\" name=\"gender\" id=\"genderMale\" value=\"male\" checked>\n");
      out.write("                                <label class=\"form-check-label\" for=\"genderMale\">Male</label>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"form-check\">\n");
      out.write("                                <input class=\"form-check-input\" type=\"radio\" name=\"gender\" id=\"genderFemale\" value=\"female\">\n");
      out.write("                                <label class=\"form-check-label\" for=\"genderFemale\">Female</label>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Caste</label>\n");
      out.write("                        <input type=\"text\" name=\"caste\" class=\"form-control\" placeholder=\"e.g. Rajput (leave blank for any)\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Religion</label>\n");
      out.write("                        <input type=\"text\" name=\"religion\" class=\"form-control\" placeholder=\"e.g. Hindu (leave blank for any)\">\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"d-flex justify-content-between mt-4\">\n");
      out.write("                <a href=\"Dashboard.jsp\" class=\"btn btn-outline-brand\"><i class=\"bi bi-arrow-left\"></i> Back</a>\n");
      out.write("                <button type=\"submit\" class=\"btn btn-brand\"><i class=\"bi bi-search\"></i> Search</button>\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
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
