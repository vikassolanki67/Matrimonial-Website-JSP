package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class contact_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 request.setAttribute("pageTitle", "Contact Us — Vivaah Circle"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<header class=\"page-header\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <span class=\"eyebrow justify-content-center\">Get in touch</span>\n");
      out.write("        <h1>We'd love to hear from you</h1>\n");
      out.write("        <p class=\"mx-auto\" style=\"max-width:560px;\">Questions about your profile, verification, or anything else — send us a note and our team will get back to you.</p>\n");
      out.write("    </div>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("<section class=\"section\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"row g-5\">\n");
      out.write("            <div class=\"col-lg-5 reveal\">\n");
      out.write("                <div class=\"card-elevated feature-card mb-4\">\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-geo-alt\"></i></div>\n");
      out.write("                    <h5>Our Office</h5>\n");
      out.write("                    <p class=\"mb-0\">Vivaah Circle HQ<br>Residency Road, Jodhpur, Rajasthan, India</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card-elevated feature-card mb-4\">\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-envelope\"></i></div>\n");
      out.write("                    <h5>Email Us</h5>\n");
      out.write("                    <p class=\"mb-0\">support@vivaahcircle.example</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"card-elevated feature-card mb-4\">\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-telephone\"></i></div>\n");
      out.write("                    <h5>Call Us</h5>\n");
      out.write("                    <p class=\"mb-0\">+91 98765 43210 &middot; Mon&ndash;Sat, 10am&ndash;6pm</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"social-icons\" style=\"margin-top:0;\">\n");
      out.write("                    <a href=\"#\" aria-label=\"Facebook\" style=\"border-color:var(--color-border);\"><i class=\"bi bi-facebook\" style=\"color:var(--color-secondary);\"></i></a>\n");
      out.write("                    <a href=\"#\" aria-label=\"Instagram\" style=\"border-color:var(--color-border);\"><i class=\"bi bi-instagram\" style=\"color:var(--color-secondary);\"></i></a>\n");
      out.write("                    <a href=\"#\" aria-label=\"X (Twitter)\" style=\"border-color:var(--color-border);\"><i class=\"bi bi-twitter-x\" style=\"color:var(--color-secondary);\"></i></a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-lg-7 reveal\">\n");
      out.write("                <div class=\"card-elevated p-4 p-md-5\">\n");
      out.write("                    <h4 class=\"mb-1\">Send us a message</h4>\n");
      out.write("                    <p class=\"text-muted mb-4\">This form is a front-end preview for the project — it doesn't send an email yet.</p>\n");
      out.write("\n");
      out.write("                    <div id=\"contactSuccess\" class=\"alert-soft alert-soft-success d-none mb-3\" role=\"status\">\n");
      out.write("                        <i class=\"bi bi-check-circle-fill\"></i>\n");
      out.write("                        <span>Thanks! Your message has been noted (demo only — no email was actually sent).</span>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <form id=\"contactForm\" class=\"needs-validation\" novalidate>\n");
      out.write("                        <div class=\"row g-3\">\n");
      out.write("                            <div class=\"col-md-6\">\n");
      out.write("                                <label class=\"form-label fw-semibold\" for=\"cName\">Full Name</label>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" id=\"cName\" required>\n");
      out.write("                                <div class=\"invalid-feedback\">Please tell us your name.</div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-md-6\">\n");
      out.write("                                <label class=\"form-label fw-semibold\" for=\"cEmail\">Email</label>\n");
      out.write("                                <input type=\"email\" class=\"form-control\" id=\"cEmail\" required>\n");
      out.write("                                <div class=\"invalid-feedback\">Please enter a valid email.</div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-12\">\n");
      out.write("                                <label class=\"form-label fw-semibold\" for=\"cSubject\">Subject</label>\n");
      out.write("                                <input type=\"text\" class=\"form-control\" id=\"cSubject\" required>\n");
      out.write("                                <div class=\"invalid-feedback\">Please add a short subject.</div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-12\">\n");
      out.write("                                <label class=\"form-label fw-semibold\" for=\"cMessage\">Message</label>\n");
      out.write("                                <textarea class=\"form-control\" id=\"cMessage\" rows=\"5\" required></textarea>\n");
      out.write("                                <div class=\"invalid-feedback\">Please write your message.</div>\n");
      out.write("                            </div>\n");
      out.write("                            <div class=\"col-12\">\n");
      out.write("                                <button type=\"submit\" class=\"btn btn-brand btn-lg\">Send Message</button>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("<section class=\"section--tight section--warm\">\n");
      out.write("    <div class=\"container-narrow reveal\">\n");
      out.write("        <div class=\"section-heading text-center mx-auto mb-4\">\n");
      out.write("            <span class=\"eyebrow justify-content-center\">Find us</span>\n");
      out.write("            <h2>Jodhpur, Rajasthan</h2>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"card-elevated d-flex align-items-center justify-content-center\" style=\"height:320px; background:var(--gradient-soft);\">\n");
      out.write("            <div class=\"text-center text-muted\">\n");
      out.write("                <i class=\"bi bi-map\" style=\"font-size:2.4rem; color:var(--color-secondary);\"></i>\n");
      out.write("                <p class=\"mb-0 mt-2\">Map placeholder &mdash; UI only, no live map embedded.</p>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
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
