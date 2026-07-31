/* ==========================================================================
   SCRIPT.JS — shared site-wide behaviour
   Vanilla JS only. Nothing here touches form actions, input names or any
   backend logic — purely presentational (navbar state, reveal-on-scroll,
   back-to-top, active-menu highlighting, page loader, disabled search box).
   ========================================================================== */
(function () {
    "use strict";

    document.addEventListener("DOMContentLoaded", function () {
        initPageLoader();
        initNavbarScrollState();
        initNavTogglerIcon();
        initActiveMenu();
        initScrollReveal();
        initBackToTop();
        initDisabledSearch();
    });

    /* ---- Page loader: fade out once the DOM is ready ---- */
    function initPageLoader() {
        var loader = document.querySelector(".page-loader");
        if (!loader) {
            return;
        }
        window.addEventListener("load", function () {
            setTimeout(function () {
                loader.classList.add("is-hidden");
            }, 250);
        });
        // Safety net in case 'load' already fired
        setTimeout(function () { 
            loader.classList.add("is-hidden");
        }, 1500);
    }
    /* ---- Swap hamburger <-> close icon when the mobile menu opens ---- */
    function initNavTogglerIcon() {
        var toggler = document.querySelector(".navbar-toggler");
        var collapseEl = document.getElementById("siteNavCollapse");
        if (!toggler || !collapseEl){
            return;
        }
        var icon = toggler.querySelector("i");
        collapseEl.addEventListener("shown.bs.collapse", function () {
            icon.classList.remove("bi-list");
            icon.classList.add("bi-x-lg");
        });
        collapseEl.addEventListener("hidden.bs.collapse", function () {
            icon.classList.remove("bi-x-lg");
            icon.classList.add("bi-list");
        });
    }

    /* ---- Navbar: add a compact/shadow state once the page scrolls ---- */
    function initNavbarScrollState() {
        var nav = document.querySelector(".site-navbar");
        if (!nav){
            return;
        }
        var onScroll = function () {
            if (window.scrollY > 12) {
                nav.classList.add("is-scrolled");
            } else {
                nav.classList.remove("is-scrolled");
            }
        };
        onScroll();
        window.addEventListener("scroll", onScroll, { passive: true });
    }

    /* ---- Highlight the current page's link in the nav ---- */
    function initActiveMenu() {
        var links = document.querySelectorAll(".site-navbar .nav-link[data-page]");
        var current = (window.location.pathname.split("/").pop() || "home.jsp").toLowerCase();
        links.forEach(function (link) {
            var page = (link.getAttribute("data-page") || "").toLowerCase();
            if (page === current) {
                link.classList.add("active");
                link.setAttribute("aria-current", "page");
            }
        });
    }

    /* ---- Fade + rise elements into view as the user scrolls ---- */
    function initScrollReveal() {
        var items = document.querySelectorAll(".reveal");
        if (!items.length) return;

        if (!("IntersectionObserver" in window)) {
            items.forEach(function (el) { el.classList.add("is-visible"); });
            return;
        }

        var observer = new IntersectionObserver(function (entries) {
            entries.forEach(function (entry) {
                if (entry.isIntersecting) {
                    entry.target.classList.add("is-visible");
                    observer.unobserve(entry.target);
                }
            });
        }, { threshold: 0.15 });

        items.forEach(function (el) { observer.observe(el); });
    }

    /* ---- Back-to-top button ---- */
    function initBackToTop() {
        var btn = document.querySelector(".back-to-top");
        if (!btn) return;
        window.addEventListener("scroll", function () {
            if (window.scrollY > 420) {
                btn.classList.add("is-visible");
            } else {
                btn.classList.remove("is-visible");
            }
        }, { passive: true });

        btn.addEventListener("click", function () {
            window.scrollTo({ top: 0, behavior: "smooth" });
        });
    }

    /* ---- Nav search box: intentionally decorative only (per project brief) ---- */
    function initDisabledSearch() {
        var searchForms = document.querySelectorAll("[data-role='ui-only-search']");
        searchForms.forEach(function (form) {
            form.addEventListener("submit", function (e) {
                e.preventDefault();
            });
        });
    }
})();
