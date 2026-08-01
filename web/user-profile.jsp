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
    String mess = request.getParameter("mess");
    if ("exists".equals(mess)) {
%>
        <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Already Requested</span></div>
<% }
    if ("success".equals(mess)) {
%>
        <div class="alert-soft alert-soft-success mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Requeste send</span></div>
<% }
    
    String usercode = request.getParameter("id");
    if (usercode == null || usercode.trim().length() == 0) {
        response.sendRedirect("search.jsp");
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
            response.sendRedirect("search.jsp");
            return;
        }
        
        Statement st3 = cn.createStatement();
        ResultSet rs3 = st3.executeQuery("select * from registration_table where email='"+email+"'");
        String logincode =null;
        if(rs3.next()){
            logincode=rs3.getString("usercode");
        }
        
        Statement st4 = cn.createStatement();
        ResultSet rs4 = st4.executeQuery("select * from interested where " +"(from_code='" + logincode + "' AND to_code='" + usercode + "') OR " +
                        "(from_code='" + usercode + "' AND to_code='" + logincode + "')");
        String relStatus = null;
        String relFromCode = null;
        if (rs4.next()) {
            relStatus = rs4.getString("status");
             relFromCode = rs4.getString("from_code");
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
                <div class="vp-detail-card reveal mt-4">
                    <h4><i class="bi bi-images"></i> Gallery</h4>
                    <div class="vp-gallery-grid">
                        <%
                        Statement st5 = cn.createStatement();
                        ResultSet rs5 = st5.executeQuery("SELECT * FROM gallery WHERE usercode='"+photo+"' ORDER BY sn");

                        boolean hasGalleryPhotos = false;
                        while(rs5.next())
                        {
                            hasGalleryPhotos = true;
                            int sn = rs5.getInt("sn");
                        %>
                        <a href="gallery/<%=photo%>/<%=sn%>.jpg" target="_blank" class="vp-gallery-item">
                            <img src="gallery/<%=photo%>/<%=sn%>.jpg" alt="Gallery photo <%=sn%>">
                        </a>
                        <%
                        }
                        if(!hasGalleryPhotos){
                        %>
                        <p class="text-muted mb-0">No extra photos yet. <a href="upload_multiple.jsp">Add some</a>.</p>
                        <%
                        }
                        %>
                    </div>
                </div>
                <div class="vp-actions reveal">
                    <a href="search_record.jsp" class="btn btn-outline-brand flex-fill text-center" onclick="history.back();return false;"><i class="bi bi-arrow-left"></i> Back to Results</a>
                    <a href="search.jsp" class="btn btn-brand flex-fill text-center"><i class="bi bi-search"></i> New Search</a>
                    <% if (relStatus == null || "-1".equals(relStatus) || "-2".equals(relStatus)) { %>
                        <a href="interested_process.jsp?id=<%= usercode %>" class="btn btn-brand flex-fill text-center">Interested</a>
                    <%} else if ("0".equals(relStatus) && logincode.equals(relFromCode)) {%>
                        <a href="request_action.jsp?id=<%= usercode %>&action=withdraw&from=profile" class="btn btn-outline-brand flex-fill text-center">Cancel Request</a>
                    <%} else if ("0".equals(relStatus)) {%>
                        <a href="request_action.jsp?id=<%= usercode %>&action=accept&from=profile" class="btn btn-brand flex-fill text-center">Accept</a>
                        <a href="request_action.jsp?id=<%= usercode %>&action=decline&from=profile" class="btn btn-outline-brand flex-fill text-center">Reject</a>
                    <% } else if ("1".equals(relStatus)) { %>
                        <a href="request_action.jsp?id=<%= usercode %>&action=cancel&from=profile" class="btn btn-outline-brand flex-fill text-center">Disconnect</a>
                        <a href="message.jsp?id=<%= usercode %> "class="btn btn-brand flex-fill text-center">Message</a>
                    <% } %>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
<%
        } else {
            response.sendRedirect("search.jsp");
            return;
        }
        cn.close();
    } catch (Exception er) {
        out.println("Profile lookup error: " + er.getMessage());
    }
%>