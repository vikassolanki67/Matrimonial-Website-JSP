<%-- 
    Document   : updateprofilephoto
    Created on : 24 Jul, 2026, 12:45:03 PM
    Author     : LENOVO
--%>

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
%>
<%
    // usercode aayega registration ke baad URL me (index.jsp?id=xxxxxxxx)
    String id = request.getParameter("id");
    if(id == null || id.trim().length() == 0){
        id = "";
    }
%>
<% request.setAttribute("pageTitle", "Upload Your  profile Photo Vivaah Circle"); %>
<jsp:include page="includes/header.jsp" />

<header class="profile-page-header">
    <div class="container-narrow text-center">
        <span class="eyebrow justify-content-center">Almost there</span>
        <h1>Upload Your Profile Photo</h1>
        <p class="mx-auto" style="max-width:520px;">A clear photo helps other members recognize a genuine profile. You can always change it later from Edit Profile.</p>
    </div>
</header>

<section class="profile-form-wrap">
    <div class="container-narrow" style="max-width:560px;">
        <% if(request.getParameter("fail")!=null){ %>
            <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>Image upload failed, please try again.</span></div>
        <% } %>
        <% if(request.getParameter("no")!=null){ %>
            <div class="alert-soft alert-soft-danger mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>No image uploaded yet — please upload one to view your profile properly.</span></div>
        <% } %>
        <% if(request.getParameter("success")!=null){ %>
            <div class="alert-soft alert-soft-success mb-3"><i class="bi bi-exclamation-circle-fill"></i><span>image uploaded </span></div>
        <% } %>

        <div class="form-section reveal">
            <form method="post" ACTION="profilephotoupdateProcess.jsp?id=<%=id%>" name="uploadForm" ENCTYPE='multipart/form-data'>
                <label for="uploadFileInput" class="photo-drop d-block mb-3">
                    <img id="uploadPreviewImg" src="" alt="Selected photo preview" class="preview-avatar d-none">
                    <span id="uploadPreviewImgPlaceholder">
                        <i class="bi bi-cloud-arrow-up upload-icon"></i>
                        <strong>Click to choose a photo</strong>
                        <div class="text-muted small mt-1">JPG recommended &middot; square photos look best</div>
                    </span>
                    <input type="file" name="uploadFile" id="uploadFileInput" data-preview-target="uploadPreviewImg" accept="image/*">
                </label>
                <div class="text-center text-muted small mb-3" id="uploadPreviewImgFileName"></div>

                <div class="d-flex gap-2 justify-content-center">
                    <input type="submit" name="Submit" value="Submit" class="btn btn-brand">
                    <input type="reset" name="Reset" value="Reset" class="btn btn-outline-brand">
                </div>
                 <div class="text-center">
                    <a href="edit.jsp" class="profile-gallery-link"><i class="bi bi-arrow-left"></i> Back </a>
                </div>
            </form>
        </div>
    </div>
</section>

<jsp:include page="includes/footer.jsp" />

