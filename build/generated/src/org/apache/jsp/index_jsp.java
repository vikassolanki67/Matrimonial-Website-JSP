package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");


    Cookie ct[] = request.getCookies();
    String email = null;
    if(ct != null){
        for(int i=0 ; i < ct.length ; i++){
            if(ct[i].getName().equals("email")){
                email = ct[i].getValue();
            }
        }
    }
    if(email == null || session.getAttribute(email) == null){
        response.sendRedirect("login.jsp");
        return;
    }

      out.write('\n');

    // usercode aayega registration ke baad URL me (index.jsp?id=xxxxxxxx)
    String id = request.getParameter("id");
    if(id == null || id.trim().length() == 0){
        id = "";
    }

      out.write('\n');
 request.setAttribute("pageTitle", "Upload Your Photo â Vivaah Circle"); 
      out.write('\n');
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "includes/header.jsp", out, false);
      out.write("\n");
      out.write("\n");
      out.write("<header class=\"profile-page-header\">\n");
      out.write("    <div class=\"container-narrow text-center\">\n");
      out.write("        <span class=\"eyebrow justify-content-center\">Almost there</span>\n");
      out.write("        <h1>Upload Your Profile Photo</h1>\n");
      out.write("        <p class=\"mx-auto\" style=\"max-width:520px;\">A clear photo helps other members recognize a genuine profile. You can always change it later from Edit Profile.</p>\n");
      out.write("    </div>\n");
      out.write("</header>\n");
      out.write("\n");
      out.write("<section class=\"profile-form-wrap\">\n");
      out.write("    <div class=\"container-narrow\" style=\"max-width:560px;\">\n");
      out.write("        ");
 if(request.getParameter("fail")!=null){ 
      out.write("\n");
      out.write("            <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>Image upload failed, please try again.</span></div>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("        ");
 if(request.getParameter("no")!=null){ 
      out.write("\n");
      out.write("            <div class=\"alert-soft alert-soft-danger mb-3\"><i class=\"bi bi-exclamation-circle-fill\"></i><span>No image uploaded yet â please upload one to view your profile properly.</span></div>\n");
      out.write("        ");
 } 
      out.write("\n");
      out.write("\n");
      out.write("        <div class=\"form-section reveal\">\n");
      out.write("            <form method=\"post\" ACTION=\"FileUploadProcess.jsp?id=");
      out.print(id);
      out.write("\" name=\"uploadForm\" ENCTYPE='multipart/form-data'>\n");
      out.write("                <label for=\"uploadFileInput\" class=\"photo-drop d-block mb-3\">\n");
      out.write("                    <img id=\"uploadPreviewImg\" src=\"\" alt=\"Selected photo preview\" class=\"preview-avatar d-none\">\n");
      out.write("                    <span id=\"uploadPreviewImgPlaceholder\">\n");
      out.write("                        <i class=\"bi bi-cloud-arrow-up upload-icon\"></i>\n");
      out.write("                        <strong>Click to choose a photo</strong>\n");
      out.write("                        <div class=\"text-muted small mt-1\">JPG recommended &middot; square photos look best</div>\n");
      out.write("                    </span>\n");
      out.write("                    <input type=\"file\" name=\"uploadFile\" id=\"uploadFileInput\" data-preview-target=\"uploadPreviewImg\" accept=\"image/*\">\n");
      out.write("                </label>\n");
      out.write("                <div class=\"text-center text-muted small mb-3\" id=\"uploadPreviewImgFileName\"></div>\n");
      out.write("\n");
      out.write("                <div class=\"d-flex gap-2 justify-content-center\">\n");
      out.write("                    <input type=\"submit\" name=\"Submit\" value=\"Submit\" class=\"btn btn-brand\">\n");
      out.write("                    <input type=\"reset\" name=\"Reset\" value=\"Reset\" class=\"btn btn-outline-brand\">\n");
      out.write("                </div>\n");
      out.write("            </form>\n");
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
