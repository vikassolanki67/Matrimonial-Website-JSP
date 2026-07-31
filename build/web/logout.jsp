<%-- 
    Document   : logout
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie ct[] = request.getCookies();
    String email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")){
                email = ct[i].getValue();
            }
        }
    }
    if (email != null) {
        session.removeAttribute(email); // clear server-side session too, not just the cookie
    }
    Cookie c = new Cookie("email", "");
    c.setMaxAge(0);
    response.addCookie(c);
    response.sendRedirect("login.jsp");
%>
