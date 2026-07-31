<%--
    Document   : edit
    Updated for matrimonial DB (profile_table). Works for BOTH:
    - first time (no profile row yet) -> shows blank form
    - editing an existing profile -> pre-fills values
    update.jsp decides INSERT vs UPDATE based on whether a row already exists.

    Design note: the original <select ... value="<%=rs.getString(...)%>">
    markup has no effect in HTML (a <select> has no `value` attribute —
    only individual <option> elements can be marked `selected`), so edit
    forms never actually showed the saved dropdown value. That is fixed
    below by marking the matching <option> as selected, using the exact
    same rs.getString(...) reads already present in the original file —
    no new query, no new field, just the option that was always intended
    to be pre-selected.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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
  %>
<% request.setAttribute("pageTitle", "Edit Your Profile — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Keep it current</span>
        <h1>Edit Your Profile</h1>
        <p>Update any section below — your changes are saved as soon as you submit.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow" style="max-width:900px;">
        <form method="post" action="update.jsp" class="needs-validation" novalidate>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">1</span><h4>Basic Information</h4></div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label>Full Name</label>
                        <input type="text" name="full_name" class="form-control" value="<%=rs.getString("full_name")%>" required>
                    </div>
                    <div class="col-md-6">
                        <label>Gender</label>
                        <select name="gender" class="form-select" required>
                            <option value="male" <%= "male".equalsIgnoreCase(rs.getString("gender")) ? "selected" : "" %>>Male</option>
                            <option value="female" <%= "female".equalsIgnoreCase(rs.getString("gender")) ? "selected" : "" %>>Female</option>
                            <option value="other" <%= "other".equalsIgnoreCase(rs.getString("gender")) ? "selected" : "" %>>Other</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>Date of Birth</label>
                        <input type="date" name="dob" class="form-control" value="<%=rs.getString("dob")%>" required>
                    </div>
                    <div class="col-md-4">
                        <label>Height</label>
                        <input type="text" name="height" class="form-control" value="<%=rs.getString("height")%>" required>
                    </div>
                    <div class="col-md-4">
                        <label>Marital Status</label>
                        <select name="marital_status" class="form-select" required>
                            <option value="single" <%= "single".equalsIgnoreCase(rs.getString("marital_status")) ? "selected" : "" %>>Single</option>
                            <option value="married" <%= "married".equalsIgnoreCase(rs.getString("marital_status")) ? "selected" : "" %>>Married</option>
                            <option value="divorced" <%= "divorced".equalsIgnoreCase(rs.getString("marital_status")) ? "selected" : "" %>>Divorced</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">2</span><h4>Religion &amp; Community</h4></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Religion</label>
                        <input type="text" name="religion" class="form-control" value="<%=rs.getString("religion")%>" required>
                    </div>
                    <div class="col-md-4">
                        <label>Caste</label>
                        <input type="text" name="caste" class="form-control" value="<%=rs.getString("caste")%>" required>
                    </div>
                    <div class="col-md-4">
                        <label>Mother Tongue</label>
                        <input type="text" name="mother_tongue" class="form-control" value="<%=rs.getString("mother_tongue")%>" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">3</span><h4>Location Details</h4></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Country</label>
                        <input type="text" name="country" class="form-control" value="<%=rs.getString("country")%>" required>
                    </div>
                    <div class="col-md-4">
                        <label>State</label>
                        <input type="text" name="state" class="form-control" value="<%=rs.getString("state")%>" required>
                    </div>
                    <div class="col-md-4">
                        <label>City</label>
                        <input type="text" name="city" class="form-control" value="<%=rs.getString("city")%>" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">4</span><h4>Education &amp; Career</h4></div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label>Highest Education</label>
                        <input type="text" name="education" class="form-control" value="<%=rs.getString("education")%>" required>
                    </div>
                    <div class="col-md-6">
                        <label>Profession</label>
                        <input type="text" name="profession" class="form-control" value="<%=rs.getString("profession")%>" required>
                    </div>
                    <div class="col-md-6">
                        <label>Company / Job Title</label>
                        <input type="text" name="company" class="form-control" value="<%=rs.getString("company")%>" required>
                    </div>
                    <div class="col-md-6">
                        <label>Annual Income</label>
                        <input type="text" name="income" class="form-control" value="<%=rs.getString("income")%>" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">5</span><h4>About Yourself</h4></div>
                <p class="section-hint">Write something about yourself.</p>
                <textarea name="bio" class="form-control" rows="4"><%=rs.getString("bio")%></textarea>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">6</span><h4>Family Details</h4></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Father's Occupation</label>
                        <input type="text" name="father_occupation" class="form-control" value="<%=rs.getString("father_occupation")%>" required>
                    </div>
                    <div class="col-md-4">
                        <label>Mother's Occupation</label>
                        <input type="text" name="mother_occupation" class="form-control" value="<%=rs.getString("mother_occupation")%>" required>
                    </div>
                    <div class="col-md-4">
                        <label>Number of Siblings</label>
                        <input type="text" name="siblings" class="form-control" value="<%=rs.getString("siblings")%>" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">7</span><h4>Partner Preferences</h4></div>
                <div class="row g-3">
                    <div class="col-md-3">
                        <label>Partner Age Min</label>
                        <input type="text" name="partner_age_min" class="form-control" value="<%=rs.getString("partner_age_min")%>" required>
                    </div>
                    <div class="col-md-3">
                        <label>Partner Age Max</label>
                        <input type="text" name="partner_age_max" class="form-control" value="<%=rs.getString("partner_age_max")%>" required>
                    </div>
                    <div class="col-md-3">
                        <label>Preferred Religion</label>
                        <input type="text" name="preferred_religion" class="form-control" value="<%=rs.getString("preferred_religion")%>" required>
                    </div>
                    <div class="col-md-3">
                        <label>Preferred Location</label>
                        <input type="text" name="preferred_location" class="form-control" value="<%=rs.getString("preferred_location")%>" required>
                    </div>
                    <div class="col-md-6">
                        <label>Education Preference</label>
                        <input type="text" name="preferred_education" class="form-control" value="<%=rs.getString("preferred_education")%>" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">8</span><h4>Lifestyle</h4></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Smoking</label>
                        <select name="smoking" class="form-select" required>
                            <option value="yes" <%= "yes".equalsIgnoreCase(rs.getString("smoking")) ? "selected" : "" %>>Yes</option>
                            <option value="no" <%= "no".equalsIgnoreCase(rs.getString("smoking")) ? "selected" : "" %>>No</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>Drinking</label>
                        <select name="drinking" class="form-select" required>
                            <option value="yes" <%= "yes".equalsIgnoreCase(rs.getString("drinking")) ? "selected" : "" %>>Yes</option>
                            <option value="no" <%= "no".equalsIgnoreCase(rs.getString("drinking")) ? "selected" : "" %>>No</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>Diet</label>
                        <select name="diet" class="form-select" required>
                            <option value="veg" <%= "veg".equalsIgnoreCase(rs.getString("diet")) ? "selected" : "" %>>Vegetarian</option>
                            <option value="Non-veg" <%= "Non-veg".equalsIgnoreCase(rs.getString("diet")) ? "selected" : "" %>>Non-Vegetarian</option>
                            <option value="both" <%= "both".equalsIgnoreCase(rs.getString("diet")) ? "selected" : "" %>>Veg &amp; Non-Veg</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">9</span><h4>Contact Details</h4></div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label>Phone Number</label>
                        <input type="text" name="phone" class="form-control" value="<%=rs.getString("phone")%>" required>
                    </div>
                    <div class="col-md-6">
                        <label>Contact Email</label>
                        <input type="text" name="contact_email" class="form-control" value="<%=rs.getString("contact_email")%>" required>
                    </div>
                </div>
            </div>
            <div class="form-section reveal">
                <div class="section-title"><span class="num"><i class="bi bi-images"></i></span><h4>Update Profile Photo</h4></div>
                <%--<p class="section-hint">Add a few more photos so people get a better sense of you — totally optional, you can always come back to this later.</p>--%>
                <a href="updateprofilephoto.jsp?id=<%=usercode%>" class="btn btn-outline-brand"><i class="bi bi-images"></i>Select New Photo </a>
            </div>
                    
            <div class="profile-sticky-actions reveal">
                <span class="save-hint"><i class="bi bi-shield-check"></i> Only you can see this form.</span>
                <input type="submit" value="Update Profile" class="btn btn-brand btn-lg">
            </div>
        </form>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
<%
            }
            else{
                 response.sendRedirect("Dashboard.jsp?account=1");

            }
        }
        catch (Exception er) {
            out.println(er.getMessage());
        }
    }
   %>
