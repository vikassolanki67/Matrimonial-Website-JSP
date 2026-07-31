<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    Cookie ct[] = request.getCookies();
    String email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) {
                email = ct[i].getValue();
            }
        }
    }
    if (email == null || session.getAttribute(email) == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String gender   = request.getParameter("gender");
    String caste    = request.getParameter("caste");
    String religion = request.getParameter("religion");
    if (caste != null)    { 
        caste = caste.trim();
    }
    if (religion != null) { 
        religion = religion.trim();
    }
%>
<% request.setAttribute("pageTitle", "Search Results — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Results</span>
        <h1>Search Results</h1>
        <p>
            Showing <%= (gender != null && gender.equalsIgnoreCase("female")) ? "female" : "male" %> profiles
            <% if (caste != null && caste.length() > 0) { 
            %>  Caste: <%= caste %>
            <% } %>
            <% if (religion != null && religion.length() > 0) { 
            %>  Religion: <%= religion %>
            <% } %>
        </p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow">
        <div class="table-responsive">
            <table class="table align-middle search-results-table">
                <thead>
                    <tr><th>Name</th><th>Gender</th><th>Caste</th><th>Religion</th><th>DOB</th><th>Occupation</th><th></th></tr>
                </thead>
                <tbody>
<%
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial", "root", "");

        StringBuilder sql = new StringBuilder(
            "select rt.usercode, pt.full_name, pt.gender, pt.caste, pt.religion, pt.dob, pt.profession "
          + "from profile_table pt "
          + "join registration_table rt on rt.email = pt.contact_email "
          + "where pt.gender = '" + gender + "' AND rt.email != '"+email+"'" 
                
        );
        if (caste != null && caste.length() > 0) {
            sql.append(" and pt.caste = '").append(caste).append("'");
        }
        if (religion != null && religion.length() > 0) {
            sql.append(" and pt.religion = '").append(religion).append("'");
        }

        Statement st = cn.createStatement();
        ResultSet rs = st.executeQuery(sql.toString());

        boolean hasResults = false;
        while (rs.next()) {
            hasResults = true;
            String usercode = rs.getString("usercode");
%>
                    <tr>
                        <td><%= rs.getString("full_name") %></td>
                        <td><%= rs.getString("gender") %></td>
                        <td><%= rs.getString("caste") %></td>
                        <td><%= rs.getString("religion") %></td>
                        <td><%= rs.getString("dob") %></td>
                        <td><%= rs.getString("profession") %></td>
                        <td><a href="user-profile.jsp?id=<%= usercode %>" class="btn btn-brand btn-sm">View</a></td>
                    </tr>
<%
        }
        if (!hasResults) {
%>
                    <tr><td colspan="7" class="text-center text-muted py-4">No matching profiles found. Try widening your filters.</td></tr>
<%
        }
        cn.close();
    } catch (Exception er) {
        out.println("<tr><td colspan='7'>Search error: " + er.getMessage() + "</td></tr>");
    }
%>
                </tbody>
            </table>
        </div>
        <div class="mt-3">
            <a href="search.jsp" class="btn btn-outline-brand"><i class="bi bi-arrow-left"></i> New Search</a>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />