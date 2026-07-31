<%-- 
    Document   : profile_retreview
    Created on : 18 Jul, 2026, 2:49:07 PM
    Author     : LENOVO
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<%
    if(request.getParameter("name").trim().length()==0||
            request.getParameter("gender").trim().length()==0||
            request.getParameter("dob").trim().length()==0||
            request.getParameter("religion").trim().length()==0)
    {
        response.sendRedirect("profile.jsp?empty=1");
                
                
     }
    else{
        
        try{
             // retreview the id from the session
            String name = request.getParameter("name");
            String gender = request.getParameter("gender");
            String dob = request.getParameter("dob");
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
            String siblings = request.getParameter("siblings");
            String partner_age_min = request.getParameter("partner_age_min");
            String partner_age_max = request.getParameter("partner_age_max");
            String preferred_religion= request.getParameter("preferred_religion");
            String preferred_location= request.getParameter("preferred_location");
            String preferred_education= request.getParameter("preferred_education");
            String smoking= request.getParameter("smoking");
            String drinking= request.getParameter("drinking");
            String diet= request.getParameter("diet");
            String phone= request.getParameter("phone");
            String contact_email= request.getParameter("contact_email");

           // Now we have to insert these values into the database
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");
            Statement st = cn.createStatement();
            String sql = "Insert into profile_table(full_name,gender,dob,height,marital_status,religion,"
                    + "caste,mother_tongue,country,state,city,education,profession,company,income,"
                    + "bio,father_occupation,mother_occupation,siblings,partner_age_min,partner_age_max,"
                    + "preferred_religion,preferred_location,preferred_education,smoking,drinking,diet,phone,contact_email)"

                    + "VALUES('"+name+"','"+gender+"','"+dob+"','"+height+"','"+marital_status+"','"+religion+"',"
                    + "'"+caste+"','"+mother_tongue+"','"+country+"','"+state+"','"+city+"','"+education+"',"
                    + "'"+profession+"','"+company+"','"+income+"','"+bio+"','"+father_occupation+"','"+mother_occupation+"',"
                    + "'"+siblings+"','"+partner_age_min+"','"+partner_age_max+"','"+preferred_religion+"','"+preferred_location+"',"
                    + "'"+preferred_education+"','"+smoking+"','"+drinking+"','"+diet+"','"+phone+"','"+contact_email+"')";

            int row = st.executeUpdate(sql);

            if(row>0){
                response.sendRedirect("view_profile.jsp");

            }
            else{
                 response.sendRedirect("profile.jsp?fail=1");

            }
        }
        
        catch (Exception er) {
            out.println("Update error: " + er.getMessage());
        }
       
    }
        
        
    %>

