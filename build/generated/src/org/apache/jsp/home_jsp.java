package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class home_jsp extends org.apache.jasper.runtime.HttpJspBase
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
 request.setAttribute("pageTitle", "Vivaah Circle — Find Your Forever"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<!-- ================= HERO ================= -->\n");
      out.write("<section class=\"hero\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"row align-items-center gy-5\">\n");
      out.write("            <div class=\"col-lg-6\">\n");
      out.write("                <span class=\"eyebrow\">Matrimony, done thoughtfully</span>\n");
      out.write("                <h1>A quieter way to find <em>the one</em> who's actually right for you.</h1>\n");
      out.write("                <p class=\"lead-text\">Verified profiles, privacy you control, and matches built around what genuinely matters to your family — not a swipe deck. Vivaah Circle is matchmaking for people who want to get it right, once.</p>\n");
      out.write("                <div class=\"hero-cta\">\n");
      out.write("                    <a href=\"register.jsp\" class=\"btn btn-brand btn-lg\">Create Your Free Profile</a>\n");
      out.write("                    <a href=\"about.jsp\" class=\"btn btn-outline-brand btn-lg\">How It Works</a>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"hero-stats\">\n");
      out.write("                    <div><strong>12,400+</strong><span>Verified members</span></div>\n");
      out.write("                    <div><strong>3,150+</strong><span>Success stories</span></div>\n");
      out.write("                    <div><strong>4.8/5</strong><span>Average rating</span></div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-lg-6\">\n");
      out.write("                <div class=\"hero-art reveal\">\n");
      out.write("                    <img src=\"assets/images/rings-motif.svg\" alt=\"Two interlocking rings, illustrating a union\" width=\"420\" height=\"420\">\n");
      out.write("                    <div class=\"floating-card card-a\">\n");
      out.write("                        <i class=\"bi bi-patch-check-fill\"></i>\n");
      out.write("                        <div><strong>ID Verified</strong><span>Every member, checked</span></div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"floating-card card-b\">\n");
      out.write("                        <i class=\"bi bi-shield-lock-fill\"></i>\n");
      out.write("                        <div><strong>Private by default</strong><span>You choose who sees what</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("<!-- ================= HOW IT WORKS ================= -->\n");
      out.write("<section class=\"section\" id=\"how-it-works\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"section-heading text-center mx-auto\">\n");
      out.write("            <span class=\"eyebrow justify-content-center\">How it works</span>\n");
      out.write("            <h2>Three steps, at your own pace</h2>\n");
      out.write("            <p class=\"mx-auto\">No forced timelines and no pressure — build your profile as completely as you're comfortable with, then let good matches come to you.</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row g-4\">\n");
      out.write("            <div class=\"col-md-4 reveal\">\n");
      out.write("                <div class=\"card-elevated step-card\">\n");
      out.write("                    <span class=\"step-index\">01</span>\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-person-plus\"></i></div>\n");
      out.write("                    <h5>Create your account</h5>\n");
      out.write("                    <p class=\"text-muted mb-0\">Register with your name and email in under a minute — no long forms up front.</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4 reveal\">\n");
      out.write("                <div class=\"card-elevated step-card\">\n");
      out.write("                    <span class=\"step-index\">02</span>\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-card-heading\"></i></div>\n");
      out.write("                    <h5>Build your profile</h5>\n");
      out.write("                    <p class=\"text-muted mb-0\">Add your details, preferences, and a photo — you're always in control of what's shared.</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4 reveal\">\n");
      out.write("                <div class=\"card-elevated step-card\">\n");
      out.write("                    <span class=\"step-index\">03</span>\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-people\"></i></div>\n");
      out.write("                    <h5>Connect with matches</h5>\n");
      out.write("                    <p class=\"text-muted mb-0\">Browse profiles that fit what you're looking for, and reach out when you're ready.</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("<!-- ================= WHY CHOOSE US ================= -->\n");
      out.write("<section class=\"section section--warm\" id=\"why-us\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"section-heading text-center mx-auto\">\n");
      out.write("            <span class=\"eyebrow justify-content-center\">Why Vivaah Circle</span>\n");
      out.write("            <h2>Built around trust, not just matches</h2>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row g-4\">\n");
      out.write("            <div class=\"col-md-6 col-lg-3 reveal\">\n");
      out.write("                <div class=\"card-elevated feature-card\">\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-patch-check\"></i></div>\n");
      out.write("                    <h5>Verified profiles</h5>\n");
      out.write("                    <p>Every account is checked before it's visible to other members.</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-6 col-lg-3 reveal\">\n");
      out.write("                <div class=\"card-elevated feature-card\">\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-eye-slash\"></i></div>\n");
      out.write("                    <h5>Privacy first</h5>\n");
      out.write("                    <p>Your contact details stay hidden until you decide to share them.</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-6 col-lg-3 reveal\">\n");
      out.write("                <div class=\"card-elevated feature-card\">\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-sliders\"></i></div>\n");
      out.write("                    <h5>Real preferences</h5>\n");
      out.write("                    <p>Filter by the things that matter to you and your family, not just a photo.</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-6 col-lg-3 reveal\">\n");
      out.write("                <div class=\"card-elevated feature-card\">\n");
      out.write("                    <div class=\"icon-tile\"><i class=\"bi bi-headset\"></i></div>\n");
      out.write("                    <h5>Real support</h5>\n");
      out.write("                    <p>A support team you can actually reach if something doesn't feel right.</p>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("<!-- ================= SUCCESS STORIES ================= -->\n");
      out.write("<section class=\"section\" id=\"stories\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"section-heading text-center mx-auto\">\n");
      out.write("            <span class=\"eyebrow justify-content-center\">Success stories</span>\n");
      out.write("            <h2>Happy couples who started here</h2>\n");
      out.write("            <p class=\"mx-auto\">A few words from members who found their match. Names are shortened for privacy.</p>\n");
      out.write("        </div>\n");
      out.write("        <div class=\"row g-4\">\n");
      out.write("            <div class=\"col-md-4 reveal\">\n");
      out.write("                <div class=\"card-elevated testimonial-card\">\n");
      out.write("                    <span class=\"quote-mark\">&rdquo;</span>\n");
      out.write("                    <p class=\"quote\">We were both tired of endless swiping. Here, everyone had actually filled in their profile properly — it made the first conversation so much easier.</p>\n");
      out.write("                    <div class=\"testimonial-person\">\n");
      out.write("                        <div class=\"avatar-initials\">R&nbsp;S</div>\n");
      out.write("                        <div><strong>R. &amp; S.</strong><span>Married, Jodhpur</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4 reveal\">\n");
      out.write("                <div class=\"card-elevated testimonial-card\">\n");
      out.write("                    <span class=\"quote-mark\">&rdquo;</span>\n");
      out.write("                    <p class=\"quote\">My parents were nervous about an online platform. The verification badges and privacy controls won them over within a week.</p>\n");
      out.write("                    <div class=\"testimonial-person\">\n");
      out.write("                        <div class=\"avatar-initials\">P&nbsp;K</div>\n");
      out.write("                        <div><strong>P. &amp; K.</strong><span>Engaged, Jaipur</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"col-md-4 reveal\">\n");
      out.write("                <div class=\"card-elevated testimonial-card\">\n");
      out.write("                    <span class=\"quote-mark\">&rdquo;</span>\n");
      out.write("                    <p class=\"quote\">The partner-preference section meant I only heard from people who actually matched what I was looking for. That saved me months.</p>\n");
      out.write("                    <div class=\"testimonial-person\">\n");
      out.write("                        <div class=\"avatar-initials\">A&nbsp;N</div>\n");
      out.write("                        <div><strong>A. &amp; N.</strong><span>Married, Ajmer</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("<!-- ================= STATS BAND ================= -->\n");
      out.write("<section class=\"section--tight section--brand\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"stat-band\">\n");
      out.write("            <div class=\"reveal\"><strong>12,400+</strong><span>Verified members</span></div>\n");
      out.write("            <div class=\"reveal\"><strong>3,150+</strong><span>Success stories</span></div>\n");
      out.write("            <div class=\"reveal\"><strong>48</strong><span>Cities represented</span></div>\n");
      out.write("            <div class=\"reveal\"><strong>4.8/5</strong><span>Average member rating</span></div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      out.write("<!-- ================= CTA ================= -->\n");
      out.write("<section class=\"section\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"cta-banner reveal\">\n");
      out.write("            <div class=\"row align-items-center g-4\">\n");
      out.write("                <div class=\"col-lg-8\">\n");
      out.write("                    <h3>Your profile takes five minutes. Finding the right match can take a lifetime — start today.</h3>\n");
      out.write("                    <p>Free to join. You control what's shared and with whom.</p>\n");
      out.write("                </div>\n");
      out.write("                <div class=\"col-lg-4 text-lg-end\">\n");
      out.write("                    <a href=\"register.jsp\" class=\"btn btn-light-pill\">Get Started — It's Free</a>\n");
      out.write("                </div>\n");
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
