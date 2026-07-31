<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% request.setAttribute("pageTitle", "Login — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<div class="auth-shell">
    <a href="home.jsp" class="auth-back-home"><i class="bi bi-arrow-left"></i> Back to home</a>
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
        <h2 class="auth-title">Login to Your Account</h2>
        <p class="auth-subtitle">Welcome back — enter your details to continue.</p>

<%
    // record.jsp redirects back here with these query params on error
    if (request.getParameter("empty") != null) {
%>
        <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Please fill in both email and password.</span></div>
<% }
    if (request.getParameter("invalid_email") != null) {
%>
        <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>No account found with that email.</span></div>
<% }
    if (request.getParameter("invalid_pass") != null) {
%>
        <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Incorrect password. Please try again.</span></div>
<% }
    if (request.getParameter("registered") != null) {
%>
        <div class="alert-soft alert-soft-success mb-3"><i class="bi bi-check-circle-fill"></i><span>Registration successful! You can now login.</span></div>
<% } %>

        <form action="record.jsp" method="post" class="needs-validation" novalidate>
            <div class="field-group">
                <label for="loginEmail">Email</label>
                <div class="field-icon-wrap">
                    <i class="bi bi-envelope field-icon"></i>
                    <input type="email" name="email" id="loginEmail" class="form-control" placeholder="you@example.com" required>
                    <div class="invalid-feedback">Please enter a valid email address.</div>
                </div>
            </div>
            <div class="field-group">
                <label for="loginPass">Password</label>
                <div class="field-icon-wrap">
                    <i class="bi bi-lock field-icon"></i>
                    <input type="password" name="pass" id="loginPass" class="form-control" placeholder="Your password" required>
                    <button type="button" class="toggle-password" data-target="loginPass" aria-label="Show password"><i class="bi bi-eye"></i></button>
                    <div class="invalid-feedback">Please enter your password.</div>
                </div>
            </div>

            <div class="form-check-row">
                <span></span>
                <a href="#">Forgot password?</a>
            </div>

            <button type="submit" class="btn btn-brand">Login</button>
        </form>

        <p class="auth-footer-note">Don't have an account? <a href="register.jsp">Register here</a></p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/script.js"></script>
<script src="assets/js/validation.js"></script>
<script src="assets/js/dashboard.js"></script>
</body>
</html>