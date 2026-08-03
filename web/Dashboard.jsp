<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
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
    else{
        // Display-only greeting derived from the already-known email — no
        // new DB query, no change to any existing session/cookie logic.
        String greetName = email;
        int atIdx = email.indexOf("@");
        if(atIdx > 0){
            greetName = email.substring(0, atIdx);
        }
   %>
<% request.setAttribute("pageTitle", "Dashboard — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="dash-hero">
    <div class="container-narrow">
        <div class="row align-items-center gy-4">
            <div class="col-lg-7">
                <span class="welcome-eyebrow">Welcome back</span>
                <h1>Hi, <%= greetName %> 👋</h1>
                <p>Signed in as <%= email %>. Here's what you can do next.</p>
            </div>
            <div class="col-lg-5">
                <div class="completion-widget reveal">
                    <div class="completion-top">
                        <span>Profile strength</span>
                        <span><i class="bi bi-lightning-charge-fill"></i> Boost it</span>
                    </div>
                    <div class="progress">
                        <div class="progress-bar" id="profileCompletionBar" data-target="65" role="progressbar" style="width:0%;"></div>
                    </div>
                    <p class="small mb-0 mt-2" style="color:rgba(255,255,255,0.85);">Add a photo and fill in every section to stand out to better matches.</p>
                </div>
            </div>
        </div>
    </div>
</header>

<section class="dash-body">
    <div class="container-narrow">
        <div class="quick-actions">
            <a href="profile.jsp" class="action-tile reveal">
                <div class="icon-tile mx-auto"><i class="bi bi-file-earmark-person"></i></div>
                <h5>Create Profile</h5>
                <p>Fill in your details for the first time</p>
            </a>
            <a href="view_profile.jsp" class="action-tile reveal">
                <div class="icon-tile mx-auto"><i class="bi bi-person-badge"></i></div>
                <h5>View Profile</h5>
                <p>See exactly what other members see</p>
            </a>
            <a href="edit.jsp" class="action-tile reveal">
                <div class="icon-tile mx-auto"><i class="bi bi-pencil-square"></i></div>
                <h5>Edit Profile</h5>
                <p>Update your details any time</p>
            </a>
            <a href="save_profile.jsp" class="action-tile reveal">
                <div class="icon-tile mx-auto"><i class="bi bi-bookmark-heart"></i></div>
                <h5>Saved Profiles</h5>
                <p>Revisit profiles you bookmarked</p>
            </a>
            <a href="Friends.jsp" class="action-tile reveal">
                <div class="icon-tile mx-auto"><i class="bi bi-heart"></i></div>
                <h5>Friends</h5>
                <p>See everyone you're connected with</p>
            </a>
            <a href="search.jsp" class="action-tile reveal">
                <div class="icon-tile mx-auto"><i class="bi bi-search-heart"></i></div>
                <h5>Search Members</h5>
                <p>Find profiles by gender, caste &amp; religion</p>
            </a>
        </div>

        <div class="dash-stats reveal">
            <div class="dash-stat-card">
                <div class="icon-tile mb-0"><i class="bi bi-eye"></i></div>
                <div><strong>&mdash;</strong><span>Profile views (insights coming soon)</span></div>
            </div>
        </div>

        <div class="dash-tip-card reveal">
            <i class="bi bi-lightbulb"></i>
            <div>
                <h5>Tip: complete profiles get noticed first</h5>
                <p>Members with a photo and a fully filled-in profile receive significantly more responses. It only takes a few minutes.</p>
            </div>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
<%
 }

 %>
