package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class login_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 request.setAttribute("pageTitle", "Login — Vivaah Circle"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<div class=\"auth-shell\">\n");
      out.write("    <a href=\"home.jsp\" class=\"auth-back-home\"><i class=\"bi bi-arrow-left\"></i> Back to home</a>\n");
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
      out.write("        <h2 class=\"auth-title\">Login to Your Account</h2>\n");
      out.write("        <p class=\"auth-subtitle\">Welcome back — enter your details to continue.</p>\n");
      out.write("\n");

    // record.jsp redirects back here with these query params on error
    if (request.getParameter("empty") != null) {

      out.write("\n");
      out.write("        <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>Please fill in both email and password.</span></div>\n");
 }
    if (request.getParameter("invalid_email") != null) {

      out.write("\n");
      out.write("        <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>No account found with that email.</span></div>\n");
 }
    if (request.getParameter("invalid_pass") != null) {

      out.write("\n");
      out.write("        <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>Incorrect password. Please try again.</span></div>\n");
 }
    if (request.getParameter("registered") != null) {

      out.write("\n");
      out.write("        <div class=\"alert-soft alert-soft-success mb-3\"><i class=\"bi bi-check-circle-fill\"></i><span>Registration successful! You can now login.</span></div>\n");
 } 
      out.write("\n");
      out.write("\n");
      out.write("        <form action=\"record.jsp\" method=\"post\" class=\"needs-validation\" novalidate>\n");
      out.write("            <div class=\"field-group\">\n");
      out.write("                <label for=\"loginEmail\">Email</label>\n");
      out.write("                <div class=\"field-icon-wrap\">\n");
      out.write("                    <i class=\"bi bi-envelope field-icon\"></i>\n");
      out.write("                    <input type=\"email\" name=\"email\" id=\"loginEmail\" class=\"form-control\" placeholder=\"you@example.com\" required>\n");
      out.write("                    <div class=\"invalid-feedback\">Please enter a valid email address.</div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"field-group\">\n");
      out.write("                <label for=\"loginPass\">Password</label>\n");
      out.write("                <div class=\"field-icon-wrap\">\n");
      out.write("                    <i class=\"bi bi-lock field-icon\"></i>\n");
      out.write("                    <input type=\"password\" name=\"pass\" id=\"loginPass\" class=\"form-control\" placeholder=\"Your password\" required>\n");
      out.write("                    <button type=\"button\" class=\"toggle-password\" data-target=\"loginPass\" aria-label=\"Show password\"><i class=\"bi bi-eye\"></i></button>\n");
      out.write("                    <div class=\"invalid-feedback\">Please enter your password.</div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-check-row\">\n");
      out.write("                <span></span>\n");
      out.write("                <a href=\"#\">Forgot password?</a>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <button type=\"submit\" class=\"btn btn-brand\">Login</button>\n");
      out.write("        </form>\n");
      out.write("\n");
      out.write("        <p class=\"auth-footer-note\">Don't have an account? <a href=\"register.jsp\">Register here</a></p>\n");
      out.write("    </div>\n");
      out.write("</div>\n");
      out.write("\n");
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
