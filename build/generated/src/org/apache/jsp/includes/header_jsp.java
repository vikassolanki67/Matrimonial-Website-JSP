package org.apache.jsp.includes;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class header_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    String navLoggedInEmail = null;
    Cookie[] navCookies = request.getCookies();
    if (navCookies != null) {
        for (int navIdx = 0; navIdx < navCookies.length; navIdx++) {
            if (navCookies[navIdx].getName().equals("email")) {
                navLoggedInEmail = navCookies[navIdx].getValue();
            }
        }
    }
    boolean navIsLoggedIn = (navLoggedInEmail != null && session.getAttribute(navLoggedInEmail) != null);

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("<meta charset=\"UTF-8\">\n");
      out.write("<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n");
      out.write("<title>");
      out.print( (request.getAttribute("pageTitle") != null) ? request.getAttribute("pageTitle") : "Vivaah Circle — Find Your Forever" );
      out.write("</title>\n");
      out.write("<meta name=\"description\" content=\"Vivaah Circle — a premium, privacy-first matrimonial platform to help you find a life partner.\">\n");
      out.write("\n");
      out.write("<!-- Fonts -->\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.googleapis.com\">\n");
      out.write("<link rel=\"preconnect\" href=\"https://fonts.gstatic.com\" crossorigin>\n");
      out.write("<link href=\"https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;1,600&family=Outfit:wght@400;500;600;700&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<!-- Bootstrap 5 + Icons -->\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<!-- Site styles (order matters: responsive.css last so it can refine) -->\n");
      out.write("<link href=\"assets/css/style.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"assets/css/auth.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"assets/css/dashboard.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"assets/css/profile.css\" rel=\"stylesheet\">\n");
      out.write("<link href=\"assets/css/responsive.css\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("<link rel=\"icon\" href=\"assets/images/logo.svg\" type=\"image/svg+xml\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("\n");
      out.write("<div class=\"page-loader\">\n");
      out.write("    <div class=\"loader-ring\" role=\"status\" aria-label=\"Loading\"></div>\n");
      out.write("</div>\n");
      out.write("\n");
      out.write("<nav class=\"site-navbar navbar navbar-expand-lg fixed-top\">\n");
      out.write("    <div class=\"container-narrow d-flex flex-wrap align-items-center justify-content-between w-100\">\n");
      out.write("        <a href=\"home.jsp\" class=\"brand-mark\">\n");
      out.write("            <svg viewBox=\"0 0 40 40\" xmlns=\"http://www.w3.org/2000/svg\" aria-hidden=\"true\">\n");
      out.write("                <defs>\n");
      out.write("                    <linearGradient id=\"navRingA\" x1=\"0\" y1=\"0\" x2=\"1\" y2=\"1\">\n");
      out.write("                        <stop offset=\"0%\" stop-color=\"#E91E63\"/><stop offset=\"100%\" stop-color=\"#AD1457\"/>\n");
      out.write("                    </linearGradient>\n");
      out.write("                    <linearGradient id=\"navRingB\" x1=\"1\" y1=\"0\" x2=\"0\" y2=\"1\">\n");
      out.write("                        <stop offset=\"0%\" stop-color=\"#6A1B9A\"/><stop offset=\"100%\" stop-color=\"#4A148C\"/>\n");
      out.write("                    </linearGradient>\n");
      out.write("                </defs>\n");
      out.write("                <circle cx=\"15\" cy=\"20\" r=\"11\" fill=\"none\" stroke=\"url(#navRingA)\" stroke-width=\"2.6\"/>\n");
      out.write("                <circle cx=\"25\" cy=\"20\" r=\"11\" fill=\"none\" stroke=\"url(#navRingB)\" stroke-width=\"2.6\"/>\n");
      out.write("                <circle cx=\"20\" cy=\"20\" r=\"2\" fill=\"#C9A227\"/>\n");
      out.write("            </svg>\n");
      out.write("            <span class=\"brand-word\">Vivaah <em>Circle</em></span>\n");
      out.write("        </a>\n");
      out.write("\n");
      out.write("        <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" \n");
      out.write("                data-bs-target=\"#siteNavCollapse\" aria-controls=\"siteNavCollapse\" \n");
      out.write("                aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n");
      out.write("            <i class=\"bi bi-list fs-2\"></i>\n");
      out.write("        </button>\n");
      out.write("\n");
      out.write("        <div class=\"collapse navbar-collapse flex-grow-0\" id=\"siteNavCollapse\">\n");
      out.write("            <ul class=\"navbar-nav align-items-lg-center gap-lg-1 mt-3 mt-lg-0\">\n");
      out.write("                <li class=\"nav-item\"><a class=\"nav-link\" data-page=\"home.jsp\" href=\"home.jsp\">Home</a></li>\n");
      out.write("                <li class=\"nav-item\"><a class=\"nav-link\" data-page=\"about.jsp\" href=\"about.jsp\">About</a></li>\n");
      out.write("                <li class=\"nav-item\"><a class=\"nav-link\" data-page=\"contact.jsp\" href=\"contact.jsp\">Contact</a></li>\n");
      out.write("\n");
      out.write("                ");
 if (navIsLoggedIn) { 
      out.write("\n");
      out.write("                <li class=\"nav-item\"><a class=\"nav-link\" data-page=\"Dashboard.jsp\" href=\"Dashboard.jsp\">Dashboard</a></li>\n");
      out.write("                <li class=\"nav-item\"><a class=\"nav-link\" href=\"requests.jsp\">Requests</a></li>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("                <li class=\"nav-item  ms-lg-2 my-2 my-lg-0\">\n");
      out.write("                    <form class=\"nav-search\" action=\"search.jsp\" method=\"get\" role=\"search\" aria-label=\"Search member profiles\">    \n");
      out.write("                        <button type=\"submit\" aria-label=\"Search\"><i class=\"bi bi-search\"></i></button>\n");
      out.write("                    </form>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("                <li class=\"nav-divider-mobile d-lg-none\"></li>\n");
      out.write("                ");
 if (navIsLoggedIn) { 
      out.write("\n");
      out.write("                <li class=\"nav-item ms-lg-2\"><a class=\"btn btn-outline-brand btn-sm-pill\" href=\"logout.jsp\">Log Out</a></li>\n");
      out.write("                ");
 } 
                else { 
      out.write("\n");
      out.write("                <li class=\"nav-item ms-lg-1\"><a class=\"nav-link\" data-page=\"login.jsp\" href=\"login.jsp\">Login</a></li>\n");
      out.write("                <li class=\"nav-item ms-lg-1\"><a class=\"btn btn-brand btn-sm-pill\" href=\"register.jsp\">Register</a></li>\n");
      out.write("                ");
 } 
      out.write("\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
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
