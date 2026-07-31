<%-- 
    Document   : profilephotoupdateProcess
    Created on : 24 Jul, 2026, 12:50:24 PM
    Author     : LENOVO
--%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="java.io.*" %>
<%
String contentType = request.getContentType();

String imageSave=null;
byte dataBytes[]=null;
String saveFile=null;
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
{
    
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
dataBytes = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength)
{
byteRead = in.read(dataBytes, totalBytesRead, formDataLength);
totalBytesRead += byteRead;
}
// id URL ke query string se aa raha hai (index.jsp se FileUploadProcess.jsp?id=xxxx),
// isiliye multipart form hone par bhi getParameter yaha kaam karega.
String code = request.getParameter("id");
if(code == null || code.trim().length() == 0){
    code = "ytjiuf56_1";
}
String file = new String(dataBytes);
/*saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1, saveFile.indexOf("\""));*/
 saveFile = code+".jpg";
// out.print(dataBytes);
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1, contentType.length());
// out.println(boundary);
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
try
{
FileOutputStream fileOut = new FileOutputStream(request.getRealPath("/")+"/upload/"+saveFile);
out.println(request.getRealPath("/"));


// fileOut.write(dataBytes);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();
imageSave="Success";
}catch (Exception e)
{

imageSave="Failure";
}

if("Success".equals(imageSave)){
    response.sendRedirect("updateprofilephoto.jsp?success=1");
}
else{
    response.sendRedirect("index.jsp?id="+code+"&fail=1");
}
 
}
%>
