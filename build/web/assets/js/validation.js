/* ==========================================================================
   VALIDATION.JS
   Front-end only: password show/hide, image preview, and Bootstrap-style
   validation feedback. This file never changes a form's action, method,
   or any input's name attribute — it only improves feedback around the
   exact same fields, and still lets a genuinely valid form submit to the
   original backend URL untouched.
   ========================================================================== */
(function () {
    "use strict";

    document.addEventListener("DOMContentLoaded", function () {
        initPasswordToggles();
        initBootstrapValidation();
        initPasswordMatchHint();
        initImagePreview();
        initContactFormDemo();
    });

    /* ---- Show / hide password ---- */
    function initPasswordToggles() {
        document.querySelectorAll(".toggle-password").forEach(function (btn) {
            btn.addEventListener("click", function () {
                var targetId = btn.getAttribute("data-target");
                var input = document.getElementById(targetId);
                if (!input) return;
                var showing = input.type === "text";
                input.type = showing ? "password" : "text";
                var icon = btn.querySelector("i");
                if (icon) {
                    icon.classList.toggle("bi-eye", showing);
                    icon.classList.toggle("bi-eye-slash", !showing);
                }
                btn.setAttribute("aria-label", showing ? "Show password" : "Hide password");
            });
        });
    }

    /* ---- Bootstrap 5 "needs-validation" pattern -----------------------------
       Forms opt in with class="needs-validation" + novalidate. We still
       call the browser's own checkValidity(), so every existing `required`
       field is enforced exactly as before — we only add styling + prevent
       submission of invalid forms, same behaviour as native validation. */
    function initBootstrapValidation() {
        var forms = document.querySelectorAll("form.needs-validation");
        forms.forEach(function (form) {
            form.addEventListener("submit", function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                    var firstInvalid = form.querySelector(":invalid");
                    if (firstInvalid) {
                        firstInvalid.focus();
                    }
                }
                form.classList.add("was-validated");
            }, false);
        });
    }

    /* ---- Live "passwords match" hint on the register page -------------------
       Purely informational; the server (register_process.jsp) remains the
       source of truth for the mismatch check. */
    function initPasswordMatchHint() {
        var pass = document.getElementById("regPass");
        var cpass = document.getElementById("regCPass");
        var hint = document.getElementById("passMatchHint");
        if (!pass || !cpass || !hint) return;

        function check() {
            if (!cpass.value) { hint.textContent = ""; return; }
            if (pass.value === cpass.value) {
                hint.textContent = "Passwords match.";
                hint.className = "form-text text-success";
                cpass.setCustomValidity("");
            } else {
                hint.textContent = "Passwords do not match yet.";
                hint.className = "form-text text-danger";
                cpass.setCustomValidity("Passwords do not match");
            }
        }
        pass.addEventListener("input", check);
        cpass.addEventListener("input", check);
    }

    /* ---- Live preview for the profile-photo upload input --------------------
       Works with the existing <input type="file" name="uploadFile"> —
       does not add/remove/rename any input. */
    function initImagePreview() {
        var input = document.querySelector("input[data-preview-target]");
        if (!input) {
            return;
        }
        var targetId = input.getAttribute("data-preview-target");
        var img = document.getElementById(targetId);
        var placeholder = document.getElementById(targetId + "Placeholder");
        var fileName = document.getElementById(targetId + "FileName");

        input.addEventListener("change", function () {
            var file = input.files && input.files[0];
            if (!file) return;
            var reader = new FileReader();
            reader.onload = function (e) {
                if (img) {
                    img.src = e.target.result;
                    img.classList.remove("d-none");
                }
                if (placeholder) placeholder.classList.add("d-none");
            };
            reader.readAsDataURL(file);
            if (fileName) fileName.textContent = file.name;
        });
    }

    /* ---- Contact form: front-end only demo (no server handler exists) ------- */
    function initContactFormDemo() {
        var form = document.getElementById("contactForm");
        if (!form) {
            return;
        }
        var successBox = document.getElementById("contactSuccess");
        form.addEventListener("submit", function (e) {
            if (!form.checkValidity()) {
                form.classList.add("was-validated");
                return; // let the invalid-state styling show, no fake success
            }
            e.preventDefault();
            form.reset();
            form.classList.remove("was-validated");
            if (successBox) {
                successBox.classList.remove("d-none");
                setTimeout(function () {
                    successBox.classList.add("d-none"); 
                }, 5000);
            }
        });
    }
})();
