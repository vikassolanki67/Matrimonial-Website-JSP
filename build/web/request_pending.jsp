<%--
    Document   : request_pending
    Full profile view of a user who sent an interest request to the
    logged-in user, so they can decide whether to accept or reject.
    Same query/field pattern as user-profile.jsp, plus the gallery
    section from view_profile.jsp. Expects ?id=<sender's usercode>.
--%>
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

    String usercode = request.getParameter("id");
    if (usercode == null || usercode.trim().length() == 0) {
        response.sendRedirect("requests.jsp");
        return;
    }
    usercode = usercode.trim();

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial", "root", "");

        Statement st1 = cn.createStatement();
        ResultSet rs1 = st1.executeQuery("select * from registration_table where usercode='"+usercode+"'");

        String photo = null;
        String contactEmailForLookup = null;
        if (rs1.next()) {
            photo = rs1.getString("usercode");
            contactEmailForLookup = rs1.getString("email");
        } else {
            response.sendRedirect("requests.jsp");
            return;
        }

        Statement st2 = cn.createStatement();
        ResultSet rs = st2.executeQuery("select * from profile_table where contact_email='" + contactEmailForLookup + "'");

        if (rs.next()) {
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
            String smoking = rs.getString("smoking");
            String drinking = rs.getString("drinking");
            String diet = rs.getString("diet");
            String phone = rs.getString("phone");
            String contact_email = rs.getString("contact_email");
%>
<% request.setAttribute("pageTitle", name + " — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="vp-hero">
    <div class="container-narrow">
        <div class="vp-photo-wrap">
            <img src="upload/<%= photo %>.jpg" alt="<%= name %>'s profile photo" onerror="this.onerror=null;this.src='assets/images/default-profile.svg';">
        </div>
        <h1><%= name %></h1>
        <p class="vp-subline"><%= city %>, <%= state %> &middot; <%= profession %></p>
        <div class="vp-badges">
            <span class="vp-badge"><i class="bi bi-patch-check-fill"></i> Verified</span>
            <span class="vp-badge"><%= marital_status %></span>
            <span class="vp-badge"><%= religion %></span>
        </div>
    </div>
</header>

<section class="vp-body">
    <div class="container-narrow">
        <div class="row g-4">
            <div class="col-lg-8">
                <div class="vp-detail-card reveal">
                    <h4><i class="bi bi-person-vcard"></i> Basic Information</h4>
                    <div class="detail-grid">
                        <div class="detail-item"><span class="label">Full Name</span><span class="value"><%= name %></span></div>
                        <div class="detail-item"><span class="label">Gender</span><span class="value"><%= gender %></span></div>
                        <div class="detail-item"><span class="label">Date of Birth</span><span class="value"><%= dob %></span></div>
                        <div class="detail-item"><span class="label">Height</span><span class="value"><%= height %></span></div>
                        <div class="detail-item"><span class="label">Marital Status</span><span class="value"><%= marital_status %></span></div>
                    </div>
                </div>
                <div class="vp-detail-card reveal">
                    <h4><i class="bi bi-gem"></i> Religion &amp; Community</h4>
                    <div class="detail-grid">
                        <div class="detail-item"><span class="label">Religion</span><span class="value"><%= religion %></span></div>
                        <div class="detail-item"><span class="label">Caste</span><span class="value"><%= caste %></span></div>
                        <div class="detail-item"><span class="label">Mother Tongue</span><span class="value"><%= mother_tongue %></span></div>
                    </div>
                </div>
                <div class="vp-detail-card reveal">
                    <h4><i class="bi bi-geo-alt"></i> Location Details</h4>
                    <div class="detail-grid">
                        <div class="detail-item"><span class="label">Country</span><span class="value"><%= country %></span></div>
                        <div class="detail-item"><span class="label">State</span><span class="value"><%= state %></span></div>
                        <div class="detail-item"><span class="label">City</span><span class="value"><%= city %></span></div>
                    </div>
                </div>
                <div class="vp-detail-card reveal">
                    <h4><i class="bi bi-mortarboard"></i> Education &amp; Career</h4>
                    <div class="detail-grid">
                        <div class="detail-item"><span class="label">Highest Education</span><span class="value"><%= education %></span></div>
                        <div class="detail-item"><span class="label">Profession</span><span class="value"><%= profession %></span></div>
                        <div class="detail-item"><span class="label">Company / Job Title</span><span class="value"><%= company %></span></div>
                        <div class="detail-item"><span class="label">Annual Income</span><span class="value"><%= income %></span></div>
                    </div>
                </div>
                <div class="vp-detail-card reveal">
                    <h4><i class="bi bi-chat-quote"></i> About</h4>
                    <p class="vp-bio-text mb-0"><%= bio %></p>
                </div>
                <div class="vp-detail-card reveal">
                    <h4><i class="bi bi-people"></i> Family Details</h4>
                    <div class="detail-grid">
                        <div class="detail-item"><span class="label">Father's Occupation</span><span class="value"><%= father_occupation %></span></div>
                        <div class="detail-item"><span class="label">Mother's Occupation</span><span class="value"><%= mother_occupation %></span></div>
                        <div class="detail-item"><span class="label">Number of Siblings</span><span class="value"><%= siblings %></span></div>
                    </div>
                </div>

                <div class="vp-detail-card reveal">
                    <h4><i class="bi bi-images"></i> Gallery</h4>
                    <div class="vp-gallery-grid">
                        <%
                        Statement st3 = cn.createStatement();
                        ResultSet rs3 = st3.executeQuery("SELECT * FROM gallery WHERE usercode='"+photo+"' ORDER BY sn");

                        boolean hasGalleryPhotos = false;
                        while(rs3.next()){
                            hasGalleryPhotos = true;
                            int sn = rs3.getInt("sn");
                        %>
                        <a href="gallery/<%=photo%>/<%=sn%>.jpg" target="_blank" class="vp-gallery-item">
                            <img src="gallery/<%=photo%>/<%=sn%>.jpg" alt="Gallery photo <%=sn%>">
                        </a>
                        <%
                        }
                        if(!hasGalleryPhotos){
                        %>
                        <p class="text-muted mb-0">No extra photos.</p>
                        <%
                        }
                        %>
                    </div>
                </div>
            </div>

            <div class="col-lg-4">
                <div class="vp-detail-card reveal">
                    <h4><i class="bi bi-activity"></i> Lifestyle</h4>
                    <div class="detail-grid" style="grid-template-columns:1fr;">
                        <div class="detail-item"><span class="label">Smoking</span><span class="value"><%= smoking %></span></div>
                        <div class="detail-item"><span class="label">Drinking</span><span class="value"><%= drinking %></span></div>
                        <div class="detail-item"><span class="label">Diet</span><span class="value"><%= diet %></span></div>
                    </div>
                </div>
                <div class="vp-detail-card reveal">
                    <h4><i class="bi bi-telephone"></i> Contact Details</h4>
                    <div class="detail-grid" style="grid-template-columns:1fr;">
                        <div class="detail-item"><span class="label">Phone Number</span><span class="value"><%= phone %></span></div>
                        <div class="detail-item"><span class="label">Contact Email</span><span class="value"><%= contact_email %></span></div>
                    </div>
                </div>
                <div class="vp-actions reveal">
                    <a href="request_action.jsp?id=<%= usercode %>&action=accept&from=notify " class="btn btn-brand flex-fill text-center"><i class="bi bi-check-lg"></i> Accept</a>
                    <a href="request_action.jsp?id=<%= usercode %>&action=decline&from=notify" class="btn btn-outline-brand flex-fill text-center"><i class="bi bi-x-lg"></i> Reject</a>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
<%
        } else {
            response.sendRedirect("requests.jsp");
            return;
        }
        cn.close();
    } catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>