<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.io.*,java.sql.*" %>
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
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/matrimonial","root","");
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery("select * from registration_table where email='"+email +"'");    
            String code = null;
            if(rs.next()){
                out.println(code);
               code =  rs.getString("usercode");
            }
             if(code == null){
            response.sendRedirect("login.jsp");
            }
            else{

                
                Statement st2 = cn.createStatement();
                String sql2 = "SELECT MAX(sn) as maxsn FROM gallery WHERE usercode = '" + code + "'";
                ResultSet rs2 = st2.executeQuery(sql2);

                int sn = 1;
                if(rs2.next()){
                    int maxsn = rs2.getInt("maxsn"); 
                    sn = maxsn + 1;
                }
                String saveFile = sn + ".jpg";
                String imageSave = null;

                String contentType = request.getContentType();
                if((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)){

                    // -- yahi tarika FileUploadProcess.jsp me bhi use hua hai --
                    DataInputStream in = new DataInputStream(request.getInputStream());
                    int formDataLength = request.getContentLength();
                    byte dataBytes[] = new byte[formDataLength];
                    int byteRead = 0;
                    int totalBytesRead = 0;
                    while(totalBytesRead < formDataLength){
                        byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
                        totalBytesRead += byteRead;
                    }

                    String file = new String(dataBytes);
                    int lastIndex = contentType.lastIndexOf("=");
                    String boundary = contentType.substring(lastIndex + 1, contentType.length());

                    int pos;
                    pos = file.indexOf("filename=\"");
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    pos = file.indexOf("\n", pos) + 1;
                    int boundaryLocation = file.indexOf(boundary, pos) - 4;
                    int startPos = ((file.substring(0, pos)).getBytes()).length;
                    int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

                    try{
                        // request.getRealPath() + "/gallery/" + code   (jaisa register_retreview.jsp me bana tha)
                        File dir = new File(request.getRealPath("/") + "/gallery/" + code);
                        if(!dir.exists()){
                            dir.mkdirs();
                        }

                        FileOutputStream fileOut = new FileOutputStream(dir.getPath() + "/" + saveFile);
                        fileOut.write(dataBytes, startPos, (endPos - startPos));
                        fileOut.flush();
                        fileOut.close();
                        imageSave = "Success";
                    }catch (Exception e){
                        imageSave = "Failure";
                    }

                    if("Success".equals(imageSave)){
                        // gallery table me entry daalo: sn + usercode
                        Statement st3 = cn.createStatement();
                        String sql3 = "INSERT INTO gallery(sn, usercode) VALUES(" + sn + ", '" + code + "')";
                        st3.executeUpdate(sql3);

                        response.sendRedirect("upload_multiple.jsp?success=1");
                    }
                    else{
                        response.sendRedirect("upload_multiple.jsp?fail=1");
                    }
                }
             }
            cn.close();
        }


        catch (Exception er) {
            out.println("Update error: " + er.getMessage());
        }
    }
%>
