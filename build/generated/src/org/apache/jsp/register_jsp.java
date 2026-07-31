package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class register_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 request.setAttribute("pageTitle", "Register — Vivaah Circle"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"auth-shell\">\n");
      out.write("    <a href=\"home.jsp\" class=\"auth-back-home \"><i class=\"bi bi-arrow-left\"></i> Back to home</a>\n");
      out.write("    <img src=\"assets/images/rings-motif.svg\" class=\"ring-motif\" alt=\"\" aria-hidden=\"true\">\n");
      out.write("    <img src=\"assets/images/rings-motif.svg\" class=\"ring-motif ring-motif--b\" alt=\"\" aria-hidden=\"true\">\n");
      out.write("\n");
      out.write("    <div class=\"auth-card reveal\">\n");
      out.write("        <div class=\"brand-mark\">\n");
      out.write("            <svg viewBox=\"0 0 40 40\" xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\">\n");
      out.write("                <circle cx=\"15\" cy=\"20\" r=\"11\" fill=\"none\" stroke=\"#E91E63\" stroke-width=\"2.6\"/>\n");
      out.write("                <circle cx=\"25\" cy=\"20\" r=\"11\" fill=\"none\" stroke=\"#6A1B9A\" stroke-width=\"2.6\"/>\n");
      out.write("                <circle cx=\"20\" cy=\"20\" r=\"2\" fill=\"#C9A227\"/>\n");
      out.write("            </svg>\n");
      out.write("            <span class=\"brand-word\">Vivaah <em>Circle</em></span>\n");
      out.write("        </div>\n");
      out.write("        <h2 class=\"auth-title\">Create Your Free Account</h2>\n");
      out.write("        <p class=\"auth-subtitle\">Join in a minute — your profile details come next.</p>\n");
      out.write("\n");

    String err = request.getParameter("err");

    if ("mismatch".equals(err)) {

      out.write("\n");
      out.write("        <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>Passwords do not match.</span></div>\n");
      out.write("\n");
 } else if ("exists".equals(err)) { 
      out.write("\n");
      out.write("        <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>An account with this email already exists. Please login instead.</span></div>\n");
      out.write("\n");
 } else if ("empty".equals(err)) { 
      out.write("\n");
      out.write("        <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>Please fill in all fields.</span></div>\n");
 } 
      out.write("\n");
      out.write("\n");
      out.write("        <form action=\"register_process.jsp\" method=\"post\" class=\"needs-validation\" novalidate>\n");
      out.write("            <div class=\"row\">\n");
      out.write("                <div class=\"col-sm-6\">\n");
      out.write("                    <div class=\"field-group\">\n");
      out.write("                        <label for=\"regFname\">First Name</label>\n");
      out.write("                        <div class=\"field-icon-wrap\">\n");
      out.write("                            <i class=\"bi bi-person field-icon\"></i>\n");
      out.write("                            <input type=\"text\" name=\"fname\" id=\"regFname\" class=\"form-control\" placeholder=\"First name\" required>\n");
      out.write("                            <div class=\"invalid-feedback\">Required.</div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-sm-6\">\n");
      out.write("                    <div class=\"field-group\">\n");
      out.write("                        <label for=\"regLname\">Last Name</label>\n");
      out.write("                        <div class=\"field-icon-wrap\">\n");
      out.write("                            <i class=\"bi bi-person field-icon\"></i>\n");
      out.write("                            <input type=\"text\" name=\"lname\" id=\"regLname\" class=\"form-control\" placeholder=\"Last name\" required>\n");
      out.write("                            <div class=\"invalid-feedback\">Required.</div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"field-group\">\n");
      out.write("                <label for=\"regEmail\">Email</label>\n");
      out.write("                <div class=\"field-icon-wrap\">\n");
      out.write("                    <i class=\"bi bi-envelope field-icon\"></i>\n");
      out.write("                    <input type=\"email\" name=\"email\" id=\"regEmail\" class=\"form-control\" placeholder=\"you@example.com\" required>\n");
      out.write("                    <div class=\"invalid-feedback\">Please enter a valid email address.</div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"field-group\">\n");
      out.write("                <label for=\"regPass\">Password</label>\n");
      out.write("                <div class=\"field-icon-wrap\">\n");
      out.write("                    <i class=\"bi bi-lock field-icon\"></i>\n");
      out.write("                    <input type=\"password\" name=\"pass\" id=\"regPass\" class=\"form-control\" placeholder=\"Create a password\" required>\n");
      out.write("                    <button type=\"button\" class=\"toggle-password\" data-target=\"regPass\" aria-label=\"Show password\"><i class=\"bi bi-eye\"></i></button>\n");
      out.write("                    <div class=\"invalid-feedback\">Please create a password.</div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"field-group\">\n");
      out.write("                <label for=\"regCPass\">Confirm Password</label>\n");
      out.write("                <div class=\"field-icon-wrap\">\n");
      out.write("                    <i class=\"bi bi-lock field-icon\"></i>\n");
      out.write("                    <input type=\"password\" name=\"cpass\" id=\"regCPass\" class=\"form-control\" placeholder=\"Re-enter your password\" required>\n");
      out.write("                    <button type=\"button\" class=\"toggle-password\" data-target=\"regCPass\" aria-label=\"Show password\"><i class=\"bi bi-eye\"></i></button>\n");
      out.write("                    <div class=\"invalid-feedback\">Please confirm your password.</div>\n");
      out.write("                </div>\n");
      out.write("                <div id=\"passMatchHint\" class=\"form-text\"></div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <button type=\"submit\" class=\"btn btn-brand\">Register</button>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <p class=\"auth-footer-note\">Already have an account? <a href=\"login.jsp\">Login here</a></p>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/footer.jsp", out, false);
      out.write('\n');
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
