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
        <div class="match-grid">
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
            <div class="match-card">
                <img class="match-avatar" src="upload/<%= usercode %>.jpg" alt="<%= rs.getString("full_name") %>"
                     onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
                <h5><%= rs.getString("full_name") %></h5>
                <p class="match-sub"><%= rs.getString("profession") %></p>
                <div class="match-meta">
                    <span><%= rs.getString("gender") %></span>
                    <span><%= rs.getString("caste") %></span>
                    <span><%= rs.getString("religion") %></span>
                    <span><%= rs.getString("dob") %></span>
                </div>
                <a href="user-profile.jsp?id=<%= usercode %>" class="btn btn-brand">View Profile</a>
            </div>
<%
        }
        if (!hasResults) {
%>
            <div class="people-empty" style="grid-column: 1 / -1;">
                <i class="bi bi-search"></i>
                <p class="mb-0">No matching profiles found. Try widening your filters.</p>
            </div>
<%
        }
        cn.close();
    } catch (Exception er) {
        out.println("<p class='text-danger'>Search error: " + er.getMessage() + "</p>");
    }
%>
        </div>
        <div class="mt-4">
            <a href="search.jsp" class="btn btn-outline-brand"><i class="bi bi-arrow-left"></i> New Search</a>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />