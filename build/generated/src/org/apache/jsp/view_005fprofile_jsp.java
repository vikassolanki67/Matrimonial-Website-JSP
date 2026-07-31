package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class view_005fprofile_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("\n");
      out.write("\n");
      out.write("\n");

    // retreview the session
     Cookie ct[] = request.getCookies();
    String email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) {
                email = ct[i].getValue();


            }
        }
    }
    if(email == null || session.getAttribute(email)== null){
       response.sendRedirect("login.jsp");

    }
    else{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

            Statement st1 = cn.createStatement();
            ResultSet rs1 = st1.executeQuery("select * from registration_table where email='"+email +"'");

            Statement st2 = cn.createStatement();
            ResultSet rs  = st2.executeQuery("select * from profile_table where contact_email='"+email+"'");
                String photo = null;
            if(rs1.next()){
                photo = rs1.getString("usercode");
                
      out.write('\n');
 request.setAttribute("pageTitle", "My Profile — Vivaah Circle"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<header class=\"vp-hero\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"vp-photo-wrap\">\n");
      out.write("            <img src=\"upload/");
      out.print( photo );
      out.write(".jpg\" alt=\"Your profile photo\" onerror=\"this.onerror=null;this.src='assets/images/default-profile.svg';\">\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("    ");

            }
            else{
                response.sendRedirect("index.jsp?no=1");
            }
            if(rs.next()){

                    String name = rs.getString("full_name");
                    String gender = rs.getString("gender");
                    String dob = rs.getString("dob");
                    String height = rs.getString("height");
                    String marital_status = rs.getString("marital_status");
                    String religion = rs.getString("religion");
                    String caste = rs.getString("caste");
                    String mother_tongue = rs.getString("mother_tongue");
                    String country = rs.getString("country");
                    String state = rs.getString("state");
                    String city = rs.getString("city");
                    String education = rs.getString("education");
                    String profession = rs.getString("profession");
                    String company = rs.getString("company");
                    String income = rs.getString("income");
                    String bio = rs.getString("bio");
                    String father_occupation = rs.getString("father_occupation");
                    String mother_occupation = rs.getString("mother_occupation");
                    String siblings = rs.getString("siblings");
                    String partner_age_min = rs.getString("partner_age_min");
                    String partner_age_max = rs.getString("partner_age_max");
                    String preferred_religion = rs.getString("preferred_religion");
                    String preferred_location = rs.getString("preferred_location");
                    String preferred_education = rs.getString("preferred_education");
                    String smoking = rs.getString("smoking");
                    String drinking = rs.getString("drinking");
                    String diet = rs.getString("diet");
                    String phone = rs.getString("phone");
                    String contact_email = rs.getString("contact_email");

      
      out.write("\n");
      out.write("        <h1>");
      out.print( name);
      out.write("</h1>\n");
      out.write("        <p class=\"vp-subline\">");
      out.print( city);
      out.write(',');
      out.write(' ');
      out.print( state);
      out.write(" &middot; ");
      out.print( profession);
      out.write("</p>\n");
      out.write("        <div class=\"vp-badges\">\n");
      out.write("            <span class=\"vp-badge\"><i class=\"bi bi-patch-check-fill\"></i> Verified</span>\n");
      out.write("            <span class=\"vp-badge\">");
      out.print( marital_status);
      out.write("</span>\n");
      out.write("            <span class=\"vp-badge\">");
      out.print( religion);
      out.write("</span>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("<section class=\"vp-body\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <div class=\"row g-4\">\n");
      out.write("            <div class=\"col-lg-8\">\n");
      out.write("\n");
      out.write("                <div class=\"vp-detail-card reveal\">\n");
      out.write("                    <h4><i class=\"bi bi-person-vcard\"></i> Basic Information</h4>\n");
      out.write("                    <div class=\"detail-grid\">\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Full Name</span><span class=\"value\">");
      out.print( name);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Gender</span><span class=\"value\">");
      out.print( gender);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Date of Birth</span><span class=\"value\">");
      out.print( dob);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Height</span><span class=\"value\">");
      out.print( height);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Marital Status</span><span class=\"value\">");
      out.print( marital_status);
      out.write("</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"vp-detail-card reveal\">\n");
      out.write("                    <h4><i class=\"bi bi-gem\"></i> Religion &amp; Community</h4>\n");
      out.write("                    <div class=\"detail-grid\">\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Religion</span><span class=\"value\">");
      out.print( religion);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Caste</span><span class=\"value\">");
      out.print( caste);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Mother Tongue</span><span class=\"value\">");
      out.print( mother_tongue);
      out.write("</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"vp-detail-card reveal\">\n");
      out.write("                    <h4><i class=\"bi bi-geo-alt\"></i> Location Details</h4>\n");
      out.write("                    <div class=\"detail-grid\">\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Country</span><span class=\"value\">");
      out.print( country);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">State</span><span class=\"value\">");
      out.print( state);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">City</span><span class=\"value\">");
      out.print( city);
      out.write("</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"vp-detail-card reveal\">\n");
      out.write("                    <h4><i class=\"bi bi-mortarboard\"></i> Education &amp; Career</h4>\n");
      out.write("                    <div class=\"detail-grid\">\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Highest Education</span><span class=\"value\">");
      out.print( education);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Profession</span><span class=\"value\">");
      out.print( profession);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Company / Job Title</span><span class=\"value\">");
      out.print( company);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Annual Income</span><span class=\"value\">");
      out.print( income);
      out.write("</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"vp-detail-card reveal\">\n");
      out.write("                    <h4><i class=\"bi bi-chat-quote\"></i> About</h4>\n");
      out.write("                    <p class=\"vp-bio-text mb-0\">");
      out.print( bio);
      out.write("</p>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"vp-detail-card reveal\">\n");
      out.write("                    <h4><i class=\"bi bi-people\"></i> Family Details</h4>\n");
      out.write("                    <div class=\"detail-grid\">\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Father's Occupation</span><span class=\"value\">");
      out.print( father_occupation);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Mother's Occupation</span><span class=\"value\">");
      out.print( mother_occupation);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Number of Siblings</span><span class=\"value\">");
      out.print( siblings);
      out.write("</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"col-lg-4\">\n");
      out.write("                <div class=\"vp-detail-card reveal\">\n");
      out.write("                    <h4><i class=\"bi bi-heart\"></i> Partner Preferences</h4>\n");
      out.write("                    <div class=\"detail-grid\" style=\"grid-template-columns:1fr;\">\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Preferred Age Range</span><span class=\"value\">");
      out.print( partner_age_min);
      out.write(" &ndash; ");
      out.print( partner_age_max);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Preferred Religion</span><span class=\"value\">");
      out.print( preferred_religion);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Preferred Location</span><span class=\"value\">");
      out.print( preferred_location);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Education Preference</span><span class=\"value\">");
      out.print( preferred_education);
      out.write("</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"vp-detail-card reveal\">\n");
      out.write("                    <h4><i class=\"bi bi-activity\"></i> Lifestyle</h4>\n");
      out.write("                    <div class=\"detail-grid\" style=\"grid-template-columns:1fr;\">\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Smoking</span><span class=\"value\">");
      out.print( smoking);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Drinking</span><span class=\"value\">");
      out.print( drinking);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Diet</span><span class=\"value\">");
      out.print( diet);
      out.write("</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"vp-detail-card reveal\">\n");
      out.write("                    <h4><i class=\"bi bi-telephone\"></i> Contact Details</h4>\n");
      out.write("                    <div class=\"detail-grid\" style=\"grid-template-columns:1fr;\">\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Phone Number</span><span class=\"value\">");
      out.print( phone);
      out.write("</span></div>\n");
      out.write("                        <div class=\"detail-item\"><span class=\"label\">Contact Email</span><span class=\"value\">");
      out.print( contact_email);
      out.write("</span></div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("\n");
      out.write("                <div class=\"vp-actions reveal\">\n");
      out.write("                    <a href=\"edit.jsp\" class=\"btn btn-brand flex-fill text-center\"><i class=\"bi bi-pencil-square\"></i> Edit Profile</a>\n");
      out.write("                    <a href=\"Dashboard.jsp\" class=\"btn btn-outline-brand flex-fill text-center\"><i class=\"bi bi-arrow-left\"></i> Back</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("\n");
      out.write("        <div class=\"vp-detail-card reveal mt-4\">\n");
      out.write("            <h4><i class=\"bi bi-images\"></i> Gallery</h4>\n");
      out.write("            <div class=\"vp-gallery-grid\">\n");
      out.write("                ");

                Statement st3 = cn.createStatement();
                ResultSet rs3 = st3.executeQuery("SELECT * FROM gallery WHERE usercode='"+photo+"' ORDER BY sn");

                boolean hasGalleryPhotos = false;
                while(rs3.next())
                {
                    hasGalleryPhotos = true;
                    int sn = rs3.getInt("sn");
                
      out.write("\n");
      out.write("                <a href=\"gallery/");
      out.print(photo);
      out.write('/');
      out.print(sn);
      out.write(".jpg\" target=\"_blank\" class=\"vp-gallery-item\">\n");
      out.write("                    <img src=\"gallery/");
      out.print(photo);
      out.write('/');
      out.print(sn);
      out.write(".jpg\" alt=\"Gallery photo ");
      out.print(sn);
      out.write("\">\n");
      out.write("                </a>\n");
      out.write("                ");

                }
                if(!hasGalleryPhotos){
                
      out.write("\n");
      out.write("                <p class=\"text-muted mb-0\">No extra photos yet. <a href=\"upload_multiple.jsp\">Add some</a>.</p>\n");
      out.write("                ");

                }
                
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/footer.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("    ");

            }
            else{
                 response.sendRedirect("profile.jsp");

            }

                cn.close();
        }


        catch (Exception er) {
            out.println("Update error: " + er.getMessage());
        }
        }
     
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
