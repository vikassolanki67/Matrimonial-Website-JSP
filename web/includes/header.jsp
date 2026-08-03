<%--
    Document   : header.jsp
    Shared site header: <head>, page loader, and the sticky navbar.
    Included at runtime with <jsp:include>, NOT <%@ include %>, on purpose:
    a runtime include compiles this file as its own independent servlet, so
    it can never collide with variable names already declared in whichever
    page includes it (several existing pages declare their own `email`,
    `ct`, etc.). It only *reads* the login cookie to decide which nav links
    to show — it never sets/removes a cookie or session attribute, so it
    cannot affect any existing login/session behaviour.
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%
    String navLoggedInEmail = null;
    Cookie[] navCookies = request.getCookies();
    if (navCookies != null) {
        for (int navIdx = 0; navIdx < navCookies.length; navIdx++) {
            if (navCookies[navIdx].getName().equals("email")) {
                navLoggedInEmail = navCookies[navIdx].getValue();
            }
        }
    }
    boolean navIsLoggedIn = (navLoggedInEmail != null && session.getAttribute(navLoggedInEmail) != null);
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title><%= (request.getAttribute("pageTitle") != null) ? request.getAttribute("pageTitle") : "Vivaah Circle — Find Your Forever" %></title>
<meta name="description" content="Vivaah Circle — a premium, privacy-first matrimonial platform to help you find a life partner.">

<!-- Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playfair+Display:ital,wght@0,600;0,700;1,600&family=Outfit:wght@400;500;600;700&display=swap" rel="stylesheet">

<!-- Bootstrap 5 + Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<!-- Site styles (order matters: responsive.css last so it can refine) -->
<link href="assets/css/style.css" rel="stylesheet">
<link href="assets/css/auth.css" rel="stylesheet">
<link href="assets/css/dashboard.css" rel="stylesheet">
<link href="assets/css/profile.css" rel="stylesheet">
<link href="assets/css/people-list.css" rel="stylesheet">
<link href="assets/css/responsive.css" rel="stylesheet">

<link rel="icon" href="assets/images/logo.svg" type="image/svg+xml">
</head>
<body>

<div class="page-loader">
    <div class="loader-ring" role="status" aria-label="Loading"></div>
</div>

<nav class="site-navbar navbar navbar-expand-lg fixed-top">
    <div class="container-narrow d-flex flex-wrap align-items-center justify-content-between w-100">
        <a href="home.jsp" class="brand-mark">
            <svg viewBox="0 0 40 40" xmlns="http://www.w3.org/2000/svg" aria-hidden="true">
                <defs>
                    <linearGradient id="navRingA" x1="0" y1="0" x2="1" y2="1">
                        <stop offset="0%" stop-color="#E91E63"/><stop offset="100%" stop-color="#AD1457"/>
                    </linearGradient>
                    <linearGradient id="navRingB" x1="1" y1="0" x2="0" y2="1">
                        <stop offset="0%" stop-color="#6A1B9A"/><stop offset="100%" stop-color="#4A148C"/>
                    </linearGradient>
                </defs>
                <circle cx="15" cy="20" r="11" fill="none" stroke="url(#navRingA)" stroke-width="2.6"/>
                <circle cx="25" cy="20" r="11" fill="none" stroke="url(#navRingB)" stroke-width="2.6"/>
                <circle cx="20" cy="20" r="2" fill="#C9A227"/>
            </svg>
            <span class="brand-word">Vivaah <em>Circle</em></span>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#siteNavCollapse" aria-controls="siteNavCollapse" 
                aria-expanded="false" aria-label="Toggle navigation">
            <i class="bi bi-list fs-2"></i>
        </button>

        <div class="collapse navbar-collapse flex-grow-0" id="siteNavCollapse">
            <ul class="navbar-nav align-items-lg-center gap-lg-1 mt-3 mt-lg-0">
                <li class="nav-item"><a class="nav-link" data-page="home.jsp" href="home.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" data-page="about.jsp" href="about.jsp">About</a></li>
                <li class="nav-item"><a class="nav-link" data-page="contact.jsp" href="contact.jsp">Contact</a></li>

                <% if (navIsLoggedIn) { %>
                <li class="nav-item"><a class="nav-link" data-page="Dashboard.jsp" href="Dashboard.jsp">Dashboard</a></li>
                <li class="nav-item"><a class="nav-link" href="requests.jsp">Notification</a></li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="messageDropdown" role="button"
                       data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-chat-dots"></i> Message
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="messageDropdown">
                        <li><a class="dropdown-item" href="inbox.jsp"><i class="bi bi-inbox me-2"></i>Inbox</a></li>
                        <li><a class="dropdown-item" href="send.jsp"><i class="bi bi-send me-2"></i>Sent</a></li>
                    </ul>
                </li>
                <% } %>

                <li class="nav-item  ms-lg-2 my-2 my-lg-0">
                    <form class="nav-search" action="search.jsp" method="get" role="search" aria-label="Search member profiles">    
                        <button type="submit" aria-label="Search"><i class="bi bi-search"></i></button>
                    </form>
                </li>

                <li class="nav-divider-mobile d-lg-none"></li>
                <% if (navIsLoggedIn) { %>
                <li class="nav-item ms-lg-2"><a class="btn btn-outline-brand btn-sm-pill" href="logout.jsp">Log Out</a></li>
                <% } 
                else { %>
                <li class="nav-item ms-lg-1"><a class="nav-link" data-page="login.jsp" href="login.jsp">Login</a></li>
                <li class="nav-item ms-lg-1"><a class="btn btn-brand btn-sm-pill" href="register.jsp">Register</a></li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>
