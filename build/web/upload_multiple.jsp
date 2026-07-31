<%-- 
    Document   : upload_multiple
    Created on : 23 Jul, 2026, 12:25:23 PM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%  Cookie ct[] = request.getCookies();
    String email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) {
                email = ct[i].getValue();
            }
        }
    }
    if(email == null || session.getAttribute(email)== null){
       response.sendRedirect("login.jsp");

    }
    else{
%>
<% request.setAttribute("pageTitle", "Add Photos — Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow text-center">
        <span class="eyebrow justify-content-center">Gallery</span>
        <h1>Add More Photos</h1>
        <p class="mx-auto" style="max-width:520px;">Upload one photo at a time — you can come back and add as many as you like.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow" style="max-width:560px;">
        <% if(request.getParameter("success")!=null){ %>
            <div class="alert-soft alert-soft-success mb-3"><i class="bi bi-check-circle-fill"></i><span>Photo uploaded to your gallery! You can upload another one below.</span></div>
        <% } %>
        <% if(request.getParameter("fail")!=null){ %>
            <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Image upload failed, please try again.</span></div>
        <% } %>

        <div class="form-section reveal">
            <form method="post" ACTION="upload_gallery_image.jsp" ENCTYPE='multipart/form-data'>
                <label for="galleryFileInput" class="photo-drop d-block mb-3">
                    <img id="galleryPreviewImg" src="" alt="Selected photo preview" class="preview-avatar d-none">
                    <span id="galleryPreviewImgPlaceholder">
                        <i class="bi bi-cloud-arrow-up upload-icon"></i>
                        <strong>Click to choose a photo</strong>
                        <div class="text-muted small mt-1">JPG recommended</div>
                    </span>
                    <input type="file" name="uploadFile" id="galleryFileInput" data-preview-target="galleryPreviewImg" accept="image/*">
                </label>
                <div class="text-center text-muted small mb-3" id="galleryPreviewImgFileName"></div>

                <div class="d-flex gap-2 justify-content-center">
                    <input type="submit" name="Submit" value="Submit" class="btn btn-brand">
                    <input type="reset" name="Reset" value="Reset" class="btn btn-outline-brand">
                </div>
            </form>
        </div>

        <div class="text-center">
            <a href="profile.jsp" class="profile-gallery-link"><i class="bi bi-arrow-left"></i> Back to my profile</a>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />
<%
    }
%>