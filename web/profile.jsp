<%--
    Document   : profile
    Shows the logged in user's full profile (registration_table + profile_table)
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
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
%>
<% request.setAttribute("pageTitle", "Create Your Profile — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow">
        <span class="eyebrow">Step 2 of 2</span>
        <h1>Tell us about yourself</h1>
        <p>The more complete your profile, the better your matches. Everything here can be edited later.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow" style="max-width:900px;">
<%
    if(request.getParameter("empty")!=null){
%>
        <div class="alert-soft alert-soft-danger mb-4"><i class="bi bi-exclamation-circle-fill"></i><span>Please fill the required fields.</span></div>
<%
    }
    if(request.getParameter("fail")!=null){
%>
        <div class="alert-soft alert-soft-danger mb-4"><i class="bi bi-exclamation-circle-fill"></i><span>Profile could not be created. Please try again.</span></div>
<%
    }
  %>

        <form method="post" action="profile_retreview.jsp" class="needs-validation" novalidate>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">1</span><h4>Basic Information</h4></div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label>Full Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Your full name" required>
                    </div>
                    <div class="col-md-6">
                        <label>Gender</label>
                        <select name="gender" class="form-select" required>
                            <option value="" selected disabled>Select gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                            <option value="other">Other</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>Date of Birth</label>
                        <input type="date" name="dob" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label>Height</label>
                        <input type="text" name="height" class="form-control" placeholder="e.g. 5.6" required>
                    </div>
                    <div class="col-md-4">
                        <label>Marital Status</label>
                        <select name="marital_status" class="form-select" required>
                            <option value="" selected disabled>Select status</option>
                            <option value="single">Single</option>
                            <option value="married">Married</option>
                            <option value="divorced">Divorced</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">2</span><h4>Religion &amp; Community</h4></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Religion</label>
                        <input type="text" name="religion" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label>Caste</label>
                        <input type="text" name="caste" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label>Mother Tongue</label>
                        <input type="text" name="mother_tongue" class="form-control" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">3</span><h4>Location Details</h4></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Country</label>
                        <input type="text" name="country" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label>State</label>
                        <input type="text" name="state" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label>City</label>
                        <input type="text" name="city" class="form-control" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">4</span><h4>Education &amp; Career</h4></div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label>Highest Education</label>
                        <input type="text" name="education" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>Profession</label>
                        <input type="text" name="profession" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>Company / Job Title</label>
                        <input type="text" name="company" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>Annual Income</label>
                        <input type="text" name="income" class="form-control" placeholder="In your local currency" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">5</span><h4>About Yourself</h4></div>
                <p class="section-hint">Write something about yourself — this is optional.</p>
                <textarea name="bio" class="form-control" rows="4" placeholder="A few lines about you, your interests, and what you're looking for..."></textarea>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">6</span><h4>Family Details</h4></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Father's Occupation</label>
                        <input type="text" name="father_occupation" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label>Mother's Occupation</label>
                        <input type="text" name="mother_occupation" class="form-control" required>
                    </div>
                    <div class="col-md-4">
                        <label>Number of Siblings</label>
                        <input type="text" name="siblings" class="form-control" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">7</span><h4>Partner Preferences</h4></div>
                <div class="row g-3">
                    <div class="col-md-3">
                        <label>Partner Age Min</label>
                        <input type="text" name="partner_age_min" class="form-control" required>
                    </div>
                    <div class="col-md-3">
                        <label>Partner Age Max</label>
                        <input type="text" name="partner_age_max" class="form-control" required>
                    </div>
                    <div class="col-md-3">
                        <label>Preferred Religion</label>
                        <input type="text" name="preferred_religion" class="form-control" required>
                    </div>
                    <div class="col-md-3">
                        <label>Preferred Location</label>
                        <input type="text" name="preferred_location" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>Education Preference</label>
                        <input type="text" name="preferred_education" class="form-control" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">8</span><h4>Lifestyle</h4></div>
                <div class="row g-3">
                    <div class="col-md-4">
                        <label>Smoking</label>
                        <select name="smoking" class="form-select" required>
                            <option value="" selected disabled>Select</option>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>Drinking</label>
                        <select name="drinking" class="form-select" required>
                            <option value="" selected disabled>Select</option>
                            <option value="yes">Yes</option>
                            <option value="no">No</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <label>Diet</label>
                        <select name="diet" class="form-select" required>
                            <option value="" selected disabled>Select</option>
                            <option value="veg">Vegetarian</option>
                            <option value="Non-veg">Non-Vegetarian</option>
                            <option value="both">Veg &amp; Non-Veg</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num">9</span><h4>Contact Details</h4></div>
                <div class="row g-3">
                    <div class="col-md-6">
                        <label>Phone Number</label>
                        <input type="text" name="phone" class="form-control" required>
                    </div>
                    <div class="col-md-6">
                        <label>Contact Email</label>
                        <input type="text" name="contact_email" class="form-control" required>
                    </div>
                </div>
            </div>

            <div class="form-section reveal">
                <div class="section-title"><span class="num"><i class="bi bi-images"></i></span><h4>Gallery Photos</h4></div>
                <p class="section-hint">Add a few more photos so people get a better sense of you — totally optional, you can always come back to this later.</p>
                <a href="upload_multiple.jsp" class="btn btn-outline-brand"><i class="bi bi-images"></i> Add More Photos</a>
            </div>

            <div class="profile-sticky-actions reveal">
                <span class="save-hint"><i class="bi bi-shield-check"></i> Your details stay private until you choose to share them.</span>
                <input type="submit" value="Submit Profile" class="btn btn-brand btn-lg">
            </div>
        </form>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
