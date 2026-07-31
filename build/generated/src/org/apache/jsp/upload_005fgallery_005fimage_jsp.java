package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.io.*;
import java.sql.*;

public final class upload_005fgallery_005fimage_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n");
      out.write("\n");

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
     else{
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from registration_table where email='"+email +"'");    
            String code = null;
            if(rs.next()){
                out.print(code);
               code =  rs.getString("usercode");
            }
             if(code == null){
            response.sendRedirect("login.jsp");
            }
            else{

                
                Statement st2 = cn.createStatement();
                String sql2 = "SELECT MAX(sn) as maxsn FROM gallery WHERE usercode = '" + code + "'";
                ResultSet rs2 = st2.executeQuery(sql2);

                int sn = 1;
                if(rs2.next()){
                    int maxsn = rs2.getInt("maxsn"); 
                    sn = maxsn + 1;
                }
                String saveFile = sn + ".jpg";
                String imageSave = null;

                String contentType = request.getContentType();
                if((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)){

                    // -- yahi tarika FileUploadProcess.jsp me bhi use hua hai --
                    DataInputStream in = new DataInputStream(request.getInputStream());
                    int formDataLength = request.getContentLength();
                    byte dataBytes[] = new byte[formDataLength];
                    int byteRead = 0;
                    int totalBytesRead = 0;
                    while(totalBytesRead < formDataLength){
                        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                        totalBytesRead += byteRead;
                    }

                    String file = new String(dataBytes);
                    int lastIndex = contentType.lastIndexOf("=");
                    String boundary = contentType.substring(lastIndex + 1, contentType.length());

                    int pos;
                    pos = file.indexOf("filename=\"");
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    int boundaryLocation = file.indexOf(boundary, pos) - 4;
                    int startPos = ((file.substring(0, pos)).getBytes()).length;
                    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                    try{
                        // request.getRealPath() + "/gallery/" + code   (jaisa register_retreview.jsp me bana tha)
                        File dir = new File(request.getRealPath("/") + "/gallery/" + code);
                        if(!dir.exists()){
                            dir.mkdirs();
                        }

                        FileOutputStream fileOut = new FileOutputStream(dir.getPath() + "/" + saveFile);
                        fileOut.write(dataBytes, startPos, (endPos - startPos));
                        fileOut.flush();
                        fileOut.close();
                        imageSave = "Success";
                    }catch (Exception e){
                        imageSave = "Failure";
                    }

                    if("Success".equals(imageSave)){
                        // gallery table me entry daalo: sn + usercode
                        Statement st3 = cn.createStatement();
                        String sql3 = "INSERT INTO gallery(sn, usercode) VALUES(" + sn + ", '" + code + "')";
                        st3.executeUpdate(sql3);

                        response.sendRedirect("upload_multiple.jsp?success=1");
                    }
                    else{
                        response.sendRedirect("upload_multiple.jsp?fail=1");
                    }
                }
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
