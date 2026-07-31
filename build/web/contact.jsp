<%--
    Document   : contact.jsp
    New static page. No contact-processing backend exists in the original
    project and none was requested, so the form below is a front-end-only
    demo (see validation.js -> initContactFormDemo): it validates, then
    shows a success message locally. It does not submit anywhere, in the
    same spirit as the intentionally non-functional navbar search box.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<% request.setAttribute("pageTitle", "Contact Us — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="page-header">
    <div class="container-narrow">
        <span class="eyebrow justify-content-center">Get in touch</span>
        <h1>We'd love to hear from you</h1>
        <p class="mx-auto" style="max-width:560px;">Questions about your profile, verification, or anything else — send us a note and our team will get back to you.</p>
    </div>
</header>

<section class="section">
    <div class="container-narrow">
        <div class="row g-5">
            <div class="col-lg-5 reveal">
                <div class="card-elevated feature-card mb-4" style="height:auto;">
                    <div class="icon-tile"><i class="bi bi-geo-alt"></i></div>
                    <h5>Our Office</h5>
                    <p class="mb-0">Vivaah Circle HQ<br>Residency Road, Jodhpur, Rajasthan, India</p>
                </div>
                <div class="card-elevated feature-card mb-4" style="height:auto;">
                    <div class="icon-tile"><i class="bi bi-envelope"></i></div>
                    <h5>Email Us</h5>
                    <p class="mb-0">support@vivaahcircle.example</p>
                </div>
                <div class="card-elevated feature-card mb-4" style="height:auto;">
                    <div class="icon-tile"><i class="bi bi-telephone"></i></div>
                    <h5>Call Us</h5>
                    <p class="mb-0">+91 98765 43210 &middot; Mon&ndash;Sat, 10am&ndash;6pm</p>
                </div>
                <div class="social-icons" style="margin-top:0;">
                    <a href="#" aria-label="Facebook" style="border-color:var(--color-border);"><i class="bi bi-facebook" style="color:var(--color-secondary);"></i></a>
                    <a href="#" aria-label="Instagram" style="border-color:var(--color-border);"><i class="bi bi-instagram" style="color:var(--color-secondary);"></i></a>
                    <a href="#" aria-label="X (Twitter)" style="border-color:var(--color-border);"><i class="bi bi-twitter-x" style="color:var(--color-secondary);"></i></a>
                </div>
            </div>

            <div class="col-lg-7 reveal">
                <div class="card-elevated p-4 p-md-5">
                    <h4 class="mb-1">Send us a message</h4>
                    <p class="text-muted mb-4">This form is a front-end preview for the project — it doesn't send an email yet.</p>

                    <div id="contactSuccess" class="alert-soft alert-soft-success d-none mb-3" role="status">
                        <i class="bi bi-check-circle-fill"></i>
                        <span>Thanks! Your message has been noted (demo only — no email was actually sent).</span>
                    </div>

                    <form id="contactForm" class="needs-validation" novalidate>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold" for="cName">Full Name</label>
                                <input type="text" class="form-control" id="cName" required>
                                <div class="invalid-feedback">Please tell us your name.</div>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold" for="cEmail">Email</label>
                                <input type="email" class="form-control" id="cEmail" required>
                                <div class="invalid-feedback">Please enter a valid email.</div>
                            </div>
                            <div class="col-12">
                                <label class="form-label fw-semibold" for="cSubject">Subject</label>
                                <input type="text" class="form-control" id="cSubject" required>
                                <div class="invalid-feedback">Please add a short subject.</div>
                            </div>
                            <div class="col-12">
                                <label class="form-label fw-semibold" for="cMessage">Message</label>
                                <textarea class="form-control" id="cMessage" rows="5" required></textarea>
                                <div class="invalid-feedback">Please write your message.</div>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-brand btn-lg">Send Message</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section--tight section--warm">
    <div class="container-narrow reveal">
        <div class="section-heading text-center mx-auto mb-4">
            <span class="eyebrow justify-content-center">Find us</span>
            <h2>Jodhpur, Rajasthan</h2>
        </div>
        <div class="card-elevated d-flex align-items-center justify-content-center" style="height:320px; background:var(--gradient-soft);">
            <div class="text-center text-muted">
                <i class="bi bi-map" style="font-size:2.4rem; color:var(--color-secondary);"></i>
                <p class="mb-0 mt-2">Map placeholder &mdash; UI only, no live map embedded.</p>
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
