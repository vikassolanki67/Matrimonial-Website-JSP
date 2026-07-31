<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Cookie ct[] = request.getCookies();
    String email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) { email = ct[i].getValue(); }
        }
    }
    if (email == null || session.getAttribute(email) == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<% request.setAttribute("pageTitle", "Search Members — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Find a match</span>
        <h1>Search Other Members</h1>
        <p>Narrow down profiles by gender, caste, and religion.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow" style="max-width:700px;">
        <form method="post" action="search_record.jsp">
            <div class="form-section reveal">
                <div class="section-title"><span class="num">1</span><h4>Search Filters</h4></div>
                <div class="row g-3">
                    <div class="col-12">
                        <label class="d-block mb-2">Gender</label>
                        <div class="d-flex gap-4">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="genderMale" value="male" checked>
                                <label class="form-check-label" for="genderMale">Male</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="gender" id="genderFemale" value="female">
                                <label class="form-check-label" for="genderFemale">Female</label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <label>Caste</label>
                        <input type="text" name="caste" class="form-control" placeholder="e.g. Rajput (leave blank for any)">
                    </div>
                    <div class="col-md-6">
                        <label>Religion</label>
                        <input type="text" name="religion" class="form-control" placeholder="e.g. Hindu (leave blank for any)">
                    </div>
                </div>
            </div>
            <div class="d-flex justify-content-between mt-4">
                <a href="Dashboard.jsp" class="btn btn-outline-brand"><i class="bi bi-arrow-left"></i> Back</a>
                <button type="submit" class="btn btn-brand"><i class="bi bi-search"></i> Search</button>
            </div>
        </form>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />