<%--
    Document   : footer.jsp
    Shared site footer + back-to-top button + shared scripts.
    Included at runtime with <jsp:include> for the same reason as
    header.jsp — it stays fully isolated from every page's own Java code.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<footer class="site-footer">
    <div class="container-narrow">
        <div class="row gy-4">
            <div class="col-lg-4 col-md-6">
                <div class="brand-mark mb-3">
                    <svg viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                        <circle cx="15" cy="20" r="11" fill="none" stroke="#E91E63" stroke-width="2.6"/>
                        <circle cx="25" cy="20" r="11" fill="none" stroke="#6A1B9A" stroke-width="2.6"/>
                        <circle cx="20" cy="20" r="2" fill="#C9A227"/>
                    </svg>
                    <span class="brand-word">Vivaah Circle</span>
                </div>
                <p class="small mb-3">A calmer, more private way to look for a life partner &mdash; verified profiles, thoughtful matches, and your data kept to yourself.</p>
                <div class="social-icons">
                    <a href="#" aria-label="Facebook"><i class="bi bi-facebook"></i></a>
                    <a href="#" aria-label="Instagram"><i class="bi bi-instagram"></i></a>
                    <a href="#" aria-label="X (Twitter)"><i class="bi bi-twitter-x"></i></a>
                    <a href="#" aria-label="YouTube"><i class="bi bi-youtube"></i></a>
                </div>
            </div>

            <div class="col-lg-2 col-md-6 offset-lg-1">
                <h5>Quick Links</h5>
                <ul class="list-unstyled footer-links">
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                    <li><a href="register.jsp">Register</a></li>
                </ul>
            </div>

            <div class="col-lg-2 col-md-6">
                <h5>Account</h5>
                <ul class="list-unstyled footer-links">
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="Dashboard.jsp">Dashboard</a></li>
                    <li><a href="view_profile.jsp">My Profile</a></li>
                    <li><a href="edit.jsp">Edit Profile</a></li>
                </ul>
            </div>

            <div class="col-lg-3 col-md-6">
                <h5>Legal</h5>
                <ul class="list-unstyled footer-links">
                    <li><a href="#">Privacy Policy</a></li>
                    <li><a href="#">Terms &amp; Conditions</a></li>
                    <li><a href="contact.jsp">Support</a></li>
                </ul>
            </div>
        </div>

        <div class="footer-bottom">
           <span>&copy; <%= java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) %> Vivaah Circle. All rights reserved.</span>
            <span>Built with <i class="bi bi-heart-fill" style="color:#E91E63;"></i> by <strong>Vikash Solanki</strong> | Full Stack Web Developer</span>
        </div>
    </div>
</footer>

<button class="back-to-top" aria-label="Back to top">
    <i class="bi bi-arrow-up"></i>
</button>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/script.js"></script>
<script src="assets/js/validation.js"></script>
<script src="assets/js/dashboard.js"></script>
</body>
</html>
