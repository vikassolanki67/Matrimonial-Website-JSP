package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.*;

public final class request_005faction_jsp extends org.apache.jasper.runtime.HttpJspBase
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

    Cookie ct[] = request.getCookies();
    String login_email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) {
                login_email = ct[i].getValue();
            }
        }
    }
    if (login_email == null || session.getAttribute(login_email) == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String senderCode = request.getParameter("id");
    String action = request.getParameter("action");
    if (senderCode == null || senderCode.trim().length() == 0 || action == null) {
        response.sendRedirect("requests.jsp");
        return;
    }
    senderCode = senderCode.trim();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery("select usercode from registration_table where email='"+login_email+"'");
        String logincode = null;
        if (rs.next()) {
            logincode = rs.getString("usercode");
        }

        int newStatus = "accept".equals(action) ? 1 : -1;

        PreparedStatement ps;

        if ("accept".equals(action)) {
            ps = cn.prepareStatement("UPDATE interested SET status = 1 WHERE from_code = ? AND to_code = ? AND status = 0");
            ps.setString(1, senderCode);
            ps.setString(2, logincode);
        }
        else if ("decline".equals(action)) {
            ps = cn.prepareStatement("UPDATE interested SET status = -1 WHERE from_code = ? AND to_code = ? AND status = 0");
            ps.setString(1, senderCode);
            ps.setString(2, logincode);
        }
        else if ("cancel".equals(action)) {
            ps = cn.prepareStatement("UPDATE interested SET status = -2 WHERE " +"((from_code = ? AND to_code = ?) OR (from_code = ? AND to_code = ?)) AND status = 1");
            ps.setString(1, senderCode);
            ps.setString(2, logincode);
            ps.setString(3, logincode);
            ps.setString(4, senderCode);
        }
        else {
            response.sendRedirect("requests.jsp");
            return;
        }

        if (ps.executeUpdate() > 0) {
            if ("cancel".equals(action)) {
                response.sendRedirect("user-profile.jsp?id=" + senderCode);
            } 
            else {
                response.sendRedirect("requests.jsp");
            }
            return;
        }
        response.sendRedirect("requests.jsp");

        cn.close();
    }
    catch (Exception er) {
        out.println("Request update error: " + er.getMessage());
    }
    response.sendRedirect("requests.jsp");

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
