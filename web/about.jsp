<%--
    Document   : about.jsp
    New static informational page (no backend logic — nothing to preserve).
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<% request.setAttribute("pageTitle", "About Us — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="page-header">
    <div class="container-narrow">
        <span class="eyebrow justify-content-center">About Vivaah Circle</span>
        <h1>Matchmaking built like it should have been from the start</h1>
        <p class="mx-auto" style="max-width:640px;">We started Vivaah Circle because finding a life partner deserves better than a swipe deck — it deserves care, verification, and a bit of patience.</p>
    </div>
</header>

<section class="section">
    <div class="container-narrow">
        <div class="row g-4">
            <div class="col-md-6 reveal">
                <div class="card-elevated feature-card h-100">
                    <div class="icon-tile"><i class="bi bi-bullseye"></i></div>
                    <h5>Our Mission</h5>
                    <p>To help people find a compatible life partner through verified profiles, thoughtful preference-matching, and complete control over their own privacy — without the noise of a typical dating app.</p>
                </div>
            </div>
            <div class="col-md-6 reveal">
                <div class="card-elevated feature-card h-100">
                    <div class="icon-tile"><i class="bi bi-stars"></i></div>
                    <h5>Our Vision</h5>
                    <p>A matrimonial platform families can trust as much as the individuals using it — where every profile is genuine, and every conversation starts from real compatibility.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section section--warm">
    <div class="container-narrow">
        <div class="row align-items-center g-5">
            <div class="col-lg-6 reveal">
                <span class="eyebrow">Our story</span>
                <h2 class="mt-2">Why we built this</h2>
                <p class="text-muted">Vivaah Circle began as a small college project born out of a simple frustration: most matrimonial sites felt either impersonal or overloaded with unverified profiles. We set out to build something calmer — a platform where every member's basic details are confirmed, preferences are taken seriously, and the whole experience feels closer to being introduced by someone who actually knows you.</p>
                <p class="text-muted mb-0">What began as a class assignment grew into a full working platform: registration, secure login, detailed profiles, and photo uploads, all wrapped in an interface we're proud to show off.</p>
            </div>
            <div class="col-lg-6 reveal">
                <div class="divider-motif">
                    <svg viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                        <circle cx="15" cy="20" r="11" fill="none" stroke="currentColor" stroke-width="2.2"/>
                        <circle cx="25" cy="20" r="11" fill="none" stroke="currentColor" stroke-width="2.2"/>
                    </svg>
                </div>
                <div class="row g-3 text-center">
                    <div class="col-6">
                        <div class="card-elevated p-4">
                            <div class="icon-tile mx-auto"><i class="bi bi-patch-check"></i></div>
                            <h5 class="mb-0">Verified</h5>
                            <span class="text-muted small">profiles only</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card-elevated p-4">
                            <div class="icon-tile mx-auto"><i class="bi bi-lock"></i></div>
                            <h5 class="mb-0">Private</h5>
                            <span class="text-muted small">by design</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card-elevated p-4">
                            <div class="icon-tile mx-auto"><i class="bi bi-heart"></i></div>
                            <h5 class="mb-0">Genuine</h5>
                            <span class="text-muted small">compatibility</span>
                        </div>
                    </div>
                    <div class="col-6">
                        <div class="card-elevated p-4">
                            <div class="icon-tile mx-auto"><i class="bi bi-chat-heart"></i></div>
                            <h5 class="mb-0">Supported</h5>
                            <span class="text-muted small">every step</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section" id="why-choose-us">
    <div class="container-narrow">
        <div class="section-heading text-center mx-auto">
            <span class="eyebrow justify-content-center">Why choose us</span>
            <h2>What we take seriously</h2>
        </div>
        <div class="row g-4">
            <div class="col-md-6 col-lg-3 reveal">
                <div class="card-elevated feature-card">
                    <div class="icon-tile"><i class="bi bi-shield-check"></i></div>
                    <h5>Data handled carefully</h5>
                    <p>Your details are never sold or shared with outside advertisers.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 reveal">
                <div class="card-elevated feature-card">
                    <div class="icon-tile"><i class="bi bi-clock-history"></i></div>
                    <h5>No rushed decisions</h5>
                    <p>Take your time — there's no countdown timer on finding the right person.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 reveal">
                <div class="card-elevated feature-card">
                    <div class="icon-tile"><i class="bi bi-people"></i></div>
                    <h5>Family-friendly</h5>
                    <p>Profiles are detailed enough for families to feel comfortable being involved.</p>
                </div>
            </div>
            <div class="col-md-6 col-lg-3 reveal">
                <div class="card-elevated feature-card">
                    <div class="icon-tile"><i class="bi bi-emoji-smile"></i></div>
                    <h5>Genuinely simple</h5>
                    <p>A clean, uncluttered experience from registration to your first conversation.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<section class="section section--warm" id="team">
    <div class="container-narrow">
        <div class="section-heading text-center mx-auto">
            <span class="eyebrow justify-content-center">The team</span>
            <h2>Built by a small, hands-on team</h2>
            <p class="mx-auto">A student project team handling everything from database design to the interface you're using right now.</p>
        </div>
        <div class="row g-4">
            <div class="col-sm-6 col-lg-3 reveal">
                <div class="card-elevated feature-card text-center">
                    <div class="avatar-initials mx-auto mb-3" style="width:64px;height:64px;font-size:1.2rem;">VS</div>
                    <h5 class="mb-0">Vikas Solanki</h5>
                    <span class="text-muted small">Backend &amp; Database</span>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3 reveal">
                <div class="card-elevated feature-card text-center">
                    <div class="avatar-initials mx-auto mb-3" style="width:64px;height:64px;font-size:1.2rem;">TS</div>
                    <h5 class="mb-0">Tamanna Solanki</h5>
                    <span class="text-muted small">UI &amp; Design</span>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3 reveal">
                <div class="card-elevated feature-card text-center">
                    <div class="avatar-initials mx-auto mb-3" style="width:64px;height:64px;font-size:1.2rem;">RS</div>
                    <h5 class="mb-0">Ruhi Solanki</h5>
                    <span class="text-muted small"> Frontend &amp;Profile System</span>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3 reveal">
                <div class="card-elevated feature-card text-center">
                    <div class="avatar-initials mx-auto mb-3" style="width:64px;height:64px;font-size:1.2rem;">TS</div>
                    <h5 class="mb-0">Tamvik Solanki</h5>
                    <span class="text-muted small">Quality &amp; Testing</span>
                </div>
            </div>
            
        </div>
    </div>
</section>

<section class="section">
    <div class="container-narrow">
        <div class="cta-banner reveal">
            <div class="row align-items-center g-4">
                <div class="col-lg-8">
                    <h3>Ready to see what a thoughtful match feels like?</h3>
                    <p>Join in a few minutes — it's completely free to create your profile.</p>
                </div>
                <div class="col-lg-4 text-lg-end">
                    <a href="register.jsp" class="btn btn-light-pill">Create Your Profile</a>
                </div>
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
