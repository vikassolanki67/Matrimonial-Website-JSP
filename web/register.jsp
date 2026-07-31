<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setAttribute("pageTitle", "Register — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<div class="auth-shell">
    <a href="home.jsp" class="auth-back-home "><i class="bi bi-arrow-left"></i> Back to home</a>
    <img src="assets/images/rings-motif.svg" class="ring-motif" alt="" aria-hidden="true">
    <img src="assets/images/rings-motif.svg" class="ring-motif ring-motif--b" alt="" aria-hidden="true">

    <div class="auth-card reveal">
        <div class="brand-mark">
            <svg viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <circle cx="15" cy="20" r="11" fill="none" stroke="#E91E63" stroke-width="2.6"/>
                <circle cx="25" cy="20" r="11" fill="none" stroke="#6A1B9A" stroke-width="2.6"/>
                <circle cx="20" cy="20" r="2" fill="#C9A227"/>
            </svg>
            <span class="brand-word">Vivaah <em>Circle</em></span>
        </div>
        <h2 class="auth-title">Create Your Free Account</h2>
        <p class="auth-subtitle">Join in a minute — your profile details come next.</p>

<%
    String err = request.getParameter("err");

    if ("mismatch".equals(err)) {
%>
        <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Passwords do not match.</span></div>

<% } else if ("exists".equals(err)) { %>
        <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>An account with this email already exists. Please login instead.</span></div>

<% } else if ("empty".equals(err)) { %>
        <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Please fill in all fields.</span></div>
<% } %>

        <form action="register_process.jsp" method="post" class="needs-validation" novalidate>
            <div class="row">
                <div class="col-sm-6">
                    <div class="field-group">
                        <label for="regFname">First Name</label>
                        <div class="field-icon-wrap">
                            <i class="bi bi-person field-icon"></i>
                            <input type="text" name="fname" id="regFname" class="form-control" placeholder="First name" required>
                            <div class="invalid-feedback">Required.</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="field-group">
                        <label for="regLname">Last Name</label>
                        <div class="field-icon-wrap">
                            <i class="bi bi-person field-icon"></i>
                            <input type="text" name="lname" id="regLname" class="form-control" placeholder="Last name" required>
                            <div class="invalid-feedback">Required.</div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="field-group">
                <label for="regEmail">Email</label>
                <div class="field-icon-wrap">
                    <i class="bi bi-envelope field-icon"></i>
                    <input type="email" name="email" id="regEmail" class="form-control" placeholder="you@example.com" required>
                    <div class="invalid-feedback">Please enter a valid email address.</div>
                </div>
            </div>

            <div class="field-group">
                <label for="regPass">Password</label>
                <div class="field-icon-wrap">
                    <i class="bi bi-lock field-icon"></i>
                    <input type="password" name="pass" id="regPass" class="form-control" placeholder="Create a password" required>
                    <button type="button" class="toggle-password" data-target="regPass" aria-label="Show password"><i class="bi bi-eye"></i></button>
                    <div class="invalid-feedback">Please create a password.</div>
                </div>
            </div>

            <div class="field-group">
                <label for="regCPass">Confirm Password</label>
                <div class="field-icon-wrap">
                    <i class="bi bi-lock field-icon"></i>
                    <input type="password" name="cpass" id="regCPass" class="form-control" placeholder="Re-enter your password" required>
                    <button type="button" class="toggle-password" data-target="regCPass" aria-label="Show password"><i class="bi bi-eye"></i></button>
                    <div class="invalid-feedback">Please confirm your password.</div>
                </div>
                <div id="passMatchHint" class="form-text"></div>
            </div>

            <button type="submit" class="btn btn-brand">Register</button>
        </form>

        <p class="auth-footer-note">Already have an account? <a href="login.jsp">Login here</a></p>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/script.js"></script>
<script src="assets/js/validation.js"></script>
<script src="assets/js/dashboard.js"></script>
</body>
</html>
