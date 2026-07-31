/* ==========================================================================
   DASHBOARD.JS — small enhancements scoped to Dashboard.jsp
   Animates the profile-completion meter from 0 to its target width so the
   number feels earned rather than static. Purely cosmetic.
   ========================================================================== */
(function () {
    "use strict";

    document.addEventListener("DOMContentLoaded", function () {
        var bar = document.getElementById("profileCompletionBar");
        if (!bar) return;
        var target = bar.getAttribute("data-target") || "0";
        requestAnimationFrame(function () {
            setTimeout(function () {
                bar.style.width = target + "%";
            }, 200);
        });
    });
})();
