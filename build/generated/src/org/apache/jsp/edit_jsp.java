package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class edit_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    Cookie ct[] = request.getCookies();
    String email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")){
                email = ct[i].getValue();
            }
        }
    }
    if (email == null || session.getAttribute(email) == null) {
        response.sendRedirect("login.jsp");
        return;
    }
    else{
        try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");
            
            Statement stCode = cn.createStatement();
            ResultSet rsCode = stCode.executeQuery("select * from registration_table where email = '"+email+"'");
            String usercode = null;
            if(rsCode.next()){
                usercode = rsCode.getString("usercode");
            }
            
            Statement st = cn.createStatement();
            String sql = "select * from profile_table where contact_email = '"+email+"'";
            ResultSet rs = st.executeQuery(sql);

             if(rs.next()){
  
      out.write('\n');
 request.setAttribute("pageTitle", "Edit Your Profile — Vivaah Circle"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<header class=\"profile-page-header\">\n");
      out.write("    <div class=\"container-narrow\">\n");
      out.write("        <span class=\"eyebrow\">Keep it current</span>\n");
      out.write("        <h1>Edit Your Profile</h1>\n");
      out.write("        <p>Update any section below — your changes are saved as soon as you submit.</p>\n");
      out.write("    </div>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("<section class=\"profile-form-wrap\">\n");
      out.write("    <div class=\"container-narrow\" style=\"max-width:900px;\">\n");
      out.write("        <form method=\"post\" action=\"update.jsp\" class=\"needs-validation\" novalidate>\n");
      out.write("\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">1</span><h4>Basic Information</h4></div>\n");
      out.write("                <div class=\"row g-3\">\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Full Name</label>\n");
      out.write("                        <input type=\"text\" name=\"full_name\" class=\"form-control\" value=\"");
      out.print(rs.getString("full_name"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Gender</label>\n");
      out.write("                        <select name=\"gender\" class=\"form-select\" required>\n");
      out.write("                            <option value=\"male\" ");
      out.print( "male".equalsIgnoreCase(rs.getString("gender")) ? "selected" : "" );
      out.write(">Male</option>\n");
      out.write("                            <option value=\"female\" ");
      out.print( "female".equalsIgnoreCase(rs.getString("gender")) ? "selected" : "" );
      out.write(">Female</option>\n");
      out.write("                            <option value=\"other\" ");
      out.print( "other".equalsIgnoreCase(rs.getString("gender")) ? "selected" : "" );
      out.write(">Other</option>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Date of Birth</label>\n");
      out.write("                        <input type=\"date\" name=\"dob\" class=\"form-control\" value=\"");
      out.print(rs.getString("dob"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Height</label>\n");
      out.write("                        <input type=\"text\" name=\"height\" class=\"form-control\" value=\"");
      out.print(rs.getString("height"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Marital Status</label>\n");
      out.write("                        <select name=\"marital_status\" class=\"form-select\" required>\n");
      out.write("                            <option value=\"single\" ");
      out.print( "single".equalsIgnoreCase(rs.getString("marital_status")) ? "selected" : "" );
      out.write(">Single</option>\n");
      out.write("                            <option value=\"married\" ");
      out.print( "married".equalsIgnoreCase(rs.getString("marital_status")) ? "selected" : "" );
      out.write(">Married</option>\n");
      out.write("                            <option value=\"divorced\" ");
      out.print( "divorced".equalsIgnoreCase(rs.getString("marital_status")) ? "selected" : "" );
      out.write(">Divorced</option>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">2</span><h4>Religion &amp; Community</h4></div>\n");
      out.write("                <div class=\"row g-3\">\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Religion</label>\n");
      out.write("                        <input type=\"text\" name=\"religion\" class=\"form-control\" value=\"");
      out.print(rs.getString("religion"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Caste</label>\n");
      out.write("                        <input type=\"text\" name=\"caste\" class=\"form-control\" value=\"");
      out.print(rs.getString("caste"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Mother Tongue</label>\n");
      out.write("                        <input type=\"text\" name=\"mother_tongue\" class=\"form-control\" value=\"");
      out.print(rs.getString("mother_tongue"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">3</span><h4>Location Details</h4></div>\n");
      out.write("                <div class=\"row g-3\">\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Country</label>\n");
      out.write("                        <input type=\"text\" name=\"country\" class=\"form-control\" value=\"");
      out.print(rs.getString("country"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>State</label>\n");
      out.write("                        <input type=\"text\" name=\"state\" class=\"form-control\" value=\"");
      out.print(rs.getString("state"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>City</label>\n");
      out.write("                        <input type=\"text\" name=\"city\" class=\"form-control\" value=\"");
      out.print(rs.getString("city"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">4</span><h4>Education &amp; Career</h4></div>\n");
      out.write("                <div class=\"row g-3\">\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Highest Education</label>\n");
      out.write("                        <input type=\"text\" name=\"education\" class=\"form-control\" value=\"");
      out.print(rs.getString("education"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Profession</label>\n");
      out.write("                        <input type=\"text\" name=\"profession\" class=\"form-control\" value=\"");
      out.print(rs.getString("profession"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Company / Job Title</label>\n");
      out.write("                        <input type=\"text\" name=\"company\" class=\"form-control\" value=\"");
      out.print(rs.getString("company"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Annual Income</label>\n");
      out.write("                        <input type=\"text\" name=\"income\" class=\"form-control\" value=\"");
      out.print(rs.getString("income"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">5</span><h4>About Yourself</h4></div>\n");
      out.write("                <p class=\"section-hint\">Write something about yourself.</p>\n");
      out.write("                <textarea name=\"bio\" class=\"form-control\" rows=\"4\">");
      out.print(rs.getString("bio"));
      out.write("</textarea>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">6</span><h4>Family Details</h4></div>\n");
      out.write("                <div class=\"row g-3\">\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Father's Occupation</label>\n");
      out.write("                        <input type=\"text\" name=\"father_occupation\" class=\"form-control\" value=\"");
      out.print(rs.getString("father_occupation"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Mother's Occupation</label>\n");
      out.write("                        <input type=\"text\" name=\"mother_occupation\" class=\"form-control\" value=\"");
      out.print(rs.getString("mother_occupation"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Number of Siblings</label>\n");
      out.write("                        <input type=\"text\" name=\"siblings\" class=\"form-control\" value=\"");
      out.print(rs.getString("siblings"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">7</span><h4>Partner Preferences</h4></div>\n");
      out.write("                <div class=\"row g-3\">\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label>Partner Age Min</label>\n");
      out.write("                        <input type=\"text\" name=\"partner_age_min\" class=\"form-control\" value=\"");
      out.print(rs.getString("partner_age_min"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label>Partner Age Max</label>\n");
      out.write("                        <input type=\"text\" name=\"partner_age_max\" class=\"form-control\" value=\"");
      out.print(rs.getString("partner_age_max"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label>Preferred Religion</label>\n");
      out.write("                        <input type=\"text\" name=\"preferred_religion\" class=\"form-control\" value=\"");
      out.print(rs.getString("preferred_religion"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-3\">\n");
      out.write("                        <label>Preferred Location</label>\n");
      out.write("                        <input type=\"text\" name=\"preferred_location\" class=\"form-control\" value=\"");
      out.print(rs.getString("preferred_location"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Education Preference</label>\n");
      out.write("                        <input type=\"text\" name=\"preferred_education\" class=\"form-control\" value=\"");
      out.print(rs.getString("preferred_education"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">8</span><h4>Lifestyle</h4></div>\n");
      out.write("                <div class=\"row g-3\">\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Smoking</label>\n");
      out.write("                        <select name=\"smoking\" class=\"form-select\" required>\n");
      out.write("                            <option value=\"yes\" ");
      out.print( "yes".equalsIgnoreCase(rs.getString("smoking")) ? "selected" : "" );
      out.write(">Yes</option>\n");
      out.write("                            <option value=\"no\" ");
      out.print( "no".equalsIgnoreCase(rs.getString("smoking")) ? "selected" : "" );
      out.write(">No</option>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Drinking</label>\n");
      out.write("                        <select name=\"drinking\" class=\"form-select\" required>\n");
      out.write("                            <option value=\"yes\" ");
      out.print( "yes".equalsIgnoreCase(rs.getString("drinking")) ? "selected" : "" );
      out.write(">Yes</option>\n");
      out.write("                            <option value=\"no\" ");
      out.print( "no".equalsIgnoreCase(rs.getString("drinking")) ? "selected" : "" );
      out.write(">No</option>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-4\">\n");
      out.write("                        <label>Diet</label>\n");
      out.write("                        <select name=\"diet\" class=\"form-select\" required>\n");
      out.write("                            <option value=\"veg\" ");
      out.print( "veg".equalsIgnoreCase(rs.getString("diet")) ? "selected" : "" );
      out.write(">Vegetarian</option>\n");
      out.write("                            <option value=\"Non-veg\" ");
      out.print( "Non-veg".equalsIgnoreCase(rs.getString("diet")) ? "selected" : "" );
      out.write(">Non-Vegetarian</option>\n");
      out.write("                            <option value=\"both\" ");
      out.print( "both".equalsIgnoreCase(rs.getString("diet")) ? "selected" : "" );
      out.write(">Veg &amp; Non-Veg</option>\n");
      out.write("                        </select>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\">9</span><h4>Contact Details</h4></div>\n");
      out.write("                <div class=\"row g-3\">\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Phone Number</label>\n");
      out.write("                        <input type=\"text\" name=\"phone\" class=\"form-control\" value=\"");
      out.print(rs.getString("phone"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-md-6\">\n");
      out.write("                        <label>Contact Email</label>\n");
      out.write("                        <input type=\"text\" name=\"contact_email\" class=\"form-control\" value=\"");
      out.print(rs.getString("contact_email"));
      out.write("\" required>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"form-section reveal\">\n");
      out.write("                <div class=\"section-title\"><span class=\"num\"><i class=\"bi bi-images\"></i></span><h4>Update Profile Photo</h4></div>\n");
      out.write("                ");
      out.write("\n");
      out.write("                <a href=\"updateprofilephoto.jsp?id=");
      out.print(usercode);
      out.write("\" class=\"btn btn-outline-brand\"><i class=\"bi bi-images\"></i>Select New Photo </a>\n");
      out.write("            </div>\n");
      out.write("                    \n");
      out.write("            <div class=\"profile-sticky-actions reveal\">\n");
      out.write("                <span class=\"save-hint\"><i class=\"bi bi-shield-check\"></i> Only you can see this form.</span>\n");
      out.write("                <input type=\"submit\" value=\"Update Profile\" class=\"btn btn-brand btn-lg\">\n");
      out.write("            </div>\n");
      out.write("        </form>\n");
      out.write("    </div>\n");
      out.write("</section>\n");
      out.write("\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/footer.jsp", out, false);
      out.write('\n');

            }
            else{
                 response.sendRedirect("Dashboard.jsp?account=1");

            }
        }
        catch (Exception er) {
            out.println(er.getMessage());
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
