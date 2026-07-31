<%--
    Document   : home.jsp
    Public marketing homepage. This is a NEW page (not part of the
    original backend) — it carries no session/DB logic of its own.

    Note on index.jsp: in the original project, index.jsp is not a public
    homepage — it is a session-gated "upload your profile photo" step that
    redirects straight to login.jsp if there is no active session, and its
    form/action/logic have been kept 100% unchanged (see index.jsp). Since
    the brief also asks for a full marketing homepage (hero, how it works,
    testimonials, stats) that anonymous visitors can browse, that content
    lives here instead, and the navbar's "Home" link points to this page.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<% request.setAttribute("pageTitle", "Vivaah Circle — Find Your Forever"); %>
<jsp:include page="includes/header.jsp" />

<!-- ================= HERO ================= -->
<section class="hero">
    <div class="container-narrow">
        <div class="row align-items-center gy-5">
            <div class="col-lg-6">
                <span class="eyebrow">Matrimony, done thoughtfully</span>
                <h1>A quieter way to find <em>the one</em> who's actually right for you.</h1>
                <p class="lead-text">Verified profiles, privacy you control, and matches built around what genuinely matters to your family — not a swipe deck. Vivaah Circle is matchmaking for people who want to get it right, once.</p>
                <div class="hero-cta">
                    <a href="register.jsp" class="btn btn-brand btn-lg">Create Your Free Profile</a>
                    <a href="about.jsp" class="btn btn-outline-brand btn-lg">How It Works</a>
                </div>
                <div class="hero-stats">
                    <div><strong>12,400+</strong><span>Verified members</span></div>
                    <div><strong>3,150+</strong><span>Success stories</span></div>
                    <div><strong>4.8/5</strong><span>Average rating</span></div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="hero-art reveal">
                    <img src="assets/images/rings-motif.svg" alt="Two interlocking rings, illustrating a union" width="420" height="420">
                    <div class="floating-card card-a">
                        <i class="bi bi-patch-check-fill"></i>
                        <div><strong>ID Verified</strong><span>Every member, checked</span></div>
                    </div>
                    <div class="floating-card card-b">
                        <i class="bi bi-shield-lock-fill"></i>
                        <div><strong>Private by default</strong><span>You choose who sees what</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ================= HOW IT WORKS ================= -->
<section class="section" id="how-it-works">
    <div class="container-narrow">
        <div class="section-heading text-center mx-auto">
            <span class="eyebrow justify-content-center">How it works</span>
            <h2>Three steps, at your own pace</h2>
            <p class="mx-auto">No forced timelines and no pressure — build your profile as completely as you're comfortable with, then let good matches come to you.</p>
        </div>
        <div class="row g-4">
            <div class="col-md-4 reveal">
                <div class="card-elevated step-card">
                    <span class="step-index">01</span>
                    <div class="icon-tile"><i class="bi bi-person-plus"></i></div>
                    <h5>Create your account</h5>
                    <p class="text-muted mb-0">Register with your name and email in under a minute — no long forms up front.</p>
                </div>
            </div>
            <div class="col-md-4 reveal">
                <div class="card-elevated step-card">
                    <span class="step-index">02</span>
                    <div class="icon-tile"><i class="bi bi-card-heading"></i></div>
                    <h5>Build your profile</h5>
                    <p class="text-muted mb-0">Add your details, preferences, and a photo — you're always in control of what's shared.</p>
                </div>
            </div>
            <div class="col-md-4 reveal">
                <div class="card-elevated step-card">
                    <span class="step-index">03</span>
                    <div class="icon-tile"><i class="bi bi-people"></i></div>
                    <h5>Connect with matches</h5>
                    <p class="text-muted mb-0">Browse profiles that fit what you're looking for, and reach out when you're ready.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ================= WHY CHOOSE US ================= -->
<section class="section section--warm" id="why-us">
    <div class="container-narrow">
        <div class="section-heading text-center mx-auto">
            <span class="eyebrow justify-content-center">Why Vivaah Circle</span>
            <h2>Built around trust, not just matches</h2>
        </div>
        <div class="row g-4">
            <div class="col-md-6 col-lg-3 reveal">
                <div class="card-elevated feature-card">
                    <div class="icon-tile"><i class="bi bi-patch-check"></i></div>
                    <h5>Verified profiles</h5>
                    <p>Every account is checked before it's visible to other members.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 reveal">
                <div class="card-elevated feature-card">
                    <div class="icon-tile"><i class="bi bi-eye-slash"></i></div>
                    <h5>Privacy first</h5>
                    <p>Your contact details stay hidden until you decide to share them.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 reveal">
                <div class="card-elevated feature-card">
                    <div class="icon-tile"><i class="bi bi-sliders"></i></div>
                    <h5>Real preferences</h5>
                    <p>Filter by the things that matter to you and your family, not just a photo.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 reveal">
                <div class="card-elevated feature-card">
                    <div class="icon-tile"><i class="bi bi-headset"></i></div>
                    <h5>Real support</h5>
                    <p>A support team you can actually reach if something doesn't feel right.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ================= SUCCESS STORIES ================= -->
<section class="section" id="stories">
    <div class="container-narrow">
        <div class="section-heading text-center mx-auto">
            <span class="eyebrow justify-content-center">Success stories</span>
            <h2>Happy couples who started here</h2>
            <p class="mx-auto">A few words from members who found their match. Names are shortened for privacy.</p>
        </div>
        <div class="row g-4">
            <div class="col-md-4 reveal">
                <div class="card-elevated testimonial-card">
                    <span class="quote-mark">&rdquo;</span>
                    <p class="quote">We were both tired of endless swiping. Here, everyone had actually filled in their profile properly — it made the first conversation so much easier.</p>
                    <div class="testimonial-person">
                        <div class="avatar-initials">R&nbsp;S</div>
                        <div><strong>R. &amp; S.</strong><span>Married, Jodhpur</span></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 reveal">
                <div class="card-elevated testimonial-card">
                    <span class="quote-mark">&rdquo;</span>
                    <p class="quote">My parents were nervous about an online platform. The verification badges and privacy controls won them over within a week.</p>
                    <div class="testimonial-person">
                        <div class="avatar-initials">P&nbsp;K</div>
                        <div><strong>P. &amp; K.</strong><span>Engaged, Jaipur</span></div>
                    </div>
                </div>
            </div>
            <div class="col-md-4 reveal">
                <div class="card-elevated testimonial-card">
                    <span class="quote-mark">&rdquo;</span>
                    <p class="quote">The partner-preference section meant I only heard from people who actually matched what I was looking for. That saved me months.</p>
                    <div class="testimonial-person">
                        <div class="avatar-initials">A&nbsp;N</div>
                        <div><strong>A. &amp; N.</strong><span>Married, Ajmer</span></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- ================= STATS BAND ================= -->
<section class="section--tight section--brand">
    <div class="container-narrow">
        <div class="stat-band">
            <div class="reveal"><strong>12,400+</strong><span>Verified members</span></div>
            <div class="reveal"><strong>3,150+</strong><span>Success stories</span></div>
            <div class="reveal"><strong>48</strong><span>Cities represented</span></div>
            <div class="reveal"><strong>4.8/5</strong><span>Average member rating</span></div>
        </div>
    </div>
</section>

<!-- ================= CTA ================= -->
<section class="section">
    <div class="container-narrow">
        <div class="cta-banner reveal">
            <div class="row align-items-center g-4">
                <div class="col-lg-8">
                    <h3>Your profile takes five minutes. Finding the right match can take a lifetime — start today.</h3>
                    <p>Free to join. You control what's shared and with whom.</p>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a href="register.jsp" class="btn btn-light-pill">Get Started — It's Free</a>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
