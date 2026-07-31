<%-- 
    Document   : update
    Updated for matrimonial DB (profile_table).
    Decides INSERT vs UPDATE depending on whether a profile row already
    exists for this user_id.
--%>
<%@page contentType="text/html" import="java.sql.*" pageEncoding="UTF-8"%>
<%
    Cookie ct[] = request.getCookies();
    String email = null;
    if (ct != null) {
        for (int i = 0; i < ct.length; i++) {
            if (ct[i].getName().equals("email")) {
                email = ct[i].getValue();
            }
        }
    }
    if (email == null || session.getAttribute(email) == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        String full_name = request.getParameter("full_name");
        String gender = request.getParameter("gender");
        String dob = request.getParameter("dob"); // yyyy-MM-dd from <input type=date>
        String height = request.getParameter("height");
        String marital_status = request.getParameter("marital_status");
        String religion = request.getParameter("religion");
        String caste = request.getParameter("caste");
        String mother_tongue = request.getParameter("mother_tongue");
        String country = request.getParameter("country");
        String state = request.getParameter("state");
        String city = request.getParameter("city");
        String education = request.getParameter("education");
        String profession = request.getParameter("profession");
        String company = request.getParameter("company");
        String income = request.getParameter("income");
        String bio = request.getParameter("bio");
        String father_occupation = request.getParameter("father_occupation");
        String mother_occupation = request.getParameter("mother_occupation");
        int siblings = parseIntSafe(request.getParameter("siblings"));
        int partner_age_min = parseIntSafe(request.getParameter("partner_age_min"));
        int partner_age_max = parseIntSafe(request.getParameter("partner_age_max"));
        String preferred_religion = request.getParameter("preferred_religion");
        String preferred_location = request.getParameter("preferred_location");
        String preferred_education = request.getParameter("preferred_education");
        String smoking = request.getParameter("smoking");
        String drinking = request.getParameter("drinking");
        String diet = request.getParameter("diet");
        String phone = request.getParameter("phone");
        String contact_email = request.getParameter("contact_email");
 
        Class.forName("com.mysql.jdbc.Driver");
        Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");

        // Find this user's user_id from registration_table
        Statement St = cn.createStatement();
        ResultSet Rs = St.executeQuery("select * from registration_table where email='"+email+"'");
        String usercode = null;
        if (!Rs.next()) {
            out.println("Could not find your account.");
            return;
        }
        else{
            usercode = Rs.getString("usercode");
        }

        Statement St2 = cn.createStatement();
        ResultSet Rs2 = St2.executeQuery("select profile_id from profile_table where contact_email='"+ email+"'");

        boolean exists = Rs2.next();
        PreparedStatement ps;

        if (exists) {
            ps = cn.prepareStatement(
                "UPDATE profile_table SET full_name=?, gender=?, dob=?, height=?, marital_status=?, " +
                "religion=?, caste=?, mother_tongue=?, country=?, state=?, city=?, education=?, " +
                "profession=?, company=?, income=?, bio=?, father_occupation=?, mother_occupation=?, " +
                "siblings=?, partner_age_min=?, partner_age_max=?, preferred_religion=?, " +
                "preferred_location=?, preferred_education=?,smoking=?, " +
                "drinking=?, diet=?, phone=? WHERE contact_email=? ");
        } else {
            ps = cn.prepareStatement(
                "INSERT INTO profile_table (full_name, gender, dob, height, marital_status, religion, " +
                "caste, mother_tongue, country, state, city, education, profession, company, income, " +
                "bio, father_occupation, mother_occupation, siblings, partner_age_min, partner_age_max, " +
                "preferred_religion, preferred_location, preferred_education, " +
                "smoking, drinking, diet, phone, contact_email) VALUES " +
                "(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        }

        int i = 1;
        ps.setString(i++, full_name);
        ps.setString(i++, gender);
        if (dob != null && !dob.trim().isEmpty()){
            ps.setDate(i++, Date.valueOf(dob));
        }
        else {
            ps.setNull(i++, Types.DATE);
        }
        ps.setString(i++, height);
        ps.setString(i++, marital_status);
        ps.setString(i++, religion);
        ps.setString(i++, caste);
        ps.setString(i++, mother_tongue);
        ps.setString(i++, country);
        ps.setString(i++, state);
        ps.setString(i++, city);
        ps.setString(i++, education);
        ps.setString(i++, profession);
        ps.setString(i++, company);
        ps.setString(i++, income);
        ps.setString(i++, bio);
        ps.setString(i++, father_occupation);
        ps.setString(i++, mother_occupation);
        ps.setInt(i++, siblings);
        ps.setInt(i++, partner_age_min);
        ps.setInt(i++, partner_age_max);
        ps.setString(i++, preferred_religion);
        ps.setString(i++, preferred_location);
        ps.setString(i++, preferred_education);
        ps.setString(i++, smoking);
        ps.setString(i++, drinking);
        ps.setString(i++, diet);
        ps.setString(i++, phone);
        ps.setString(i++, contact_email);
        
        if (ps.executeUpdate() > 0) {
            response.sendRedirect("view_profile.jsp");
        } else {
            out.println("Update failed.");
        }
     cn.close();
    } 
    catch (Exception er) {
        out.println("Update error: " + er.getMessage());
    }
%>
<%!
    public int parseIntSafe(String v) {
        try { 
            return Integer.parseInt(v.trim());
        } 
        catch (Exception e) { 
            return 0; 
        }
    }
%>
