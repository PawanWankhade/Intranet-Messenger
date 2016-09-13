<%@ page import="java.io.*,java.sql.*" %>
<html>
<body style="background-color:#21373d">
<%
String saveFile="";
String contentType = request.getContentType();
try
 {
if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0))
 {
DataInputStream in = new DataInputStream(request.getInputStream());
int formDataLength = request.getContentLength();
byte dataBytes[] = new byte[formDataLength];
int byteRead = 0;
int totalBytesRead = 0;
while (totalBytesRead < formDataLength)
 {
byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
totalBytesRead += byteRead;
}
String file = new String(dataBytes);
saveFile = file.substring(file.indexOf("filename=\"") + 10);
saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
int lastIndex = contentType.lastIndexOf("=");
String boundary = contentType.substring(lastIndex + 1,contentType.length());
int pos;
pos = file.indexOf("filename=\"");
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
pos = file.indexOf("\n", pos) + 1;
int boundaryLocation = file.indexOf(boundary, pos) - 4;
int startPos = ((file.substring(0, pos)).getBytes()).length;
int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;

session.setAttribute("attach",saveFile);

saveFile="G:/Mission java/apache-tomcat-7.0.33/webapps/messenger/UploadedFiles/"+saveFile;
File ff = new File(saveFile);
FileOutputStream fileOut = new FileOutputStream(ff);
fileOut.write(dataBytes, startPos, (endPos - startPos));
fileOut.flush();
fileOut.close();



%>
<script>
alert("Enter the Sender Receiver name now..");
window.location='newsms.jsp';
</script>
<%
}

}catch(Exception e)
{%>
	<script>
	alert("Please select the file");
	window.location='attach.jsp'
	</script>
<%
}

%>
</body>
</html>