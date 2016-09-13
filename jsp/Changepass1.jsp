<%@page import="java.sql.*;"%>
<html>
<body style="background:#21373d;">
<% 
	String uid="null";
	String type="null";
	String logdin="null";
	uid=String.valueOf(session.getAttribute("uid"));
	type=String.valueOf(session.getAttribute("type"));
	logdin=String.valueOf(session.getAttribute("logdin"));
	
	if(!(uid.equals("null") && type.equals("null") && logdin.equals("null")))
	{
  
	String cp,np,rp;
	int cnt=0;
	cp=request.getParameter("cps");
	np=request.getParameter("nps");
	rp=request.getParameter("rps");
	if(np.equals(rp))
	{
     Connection con;
     PreparedStatement pst;
     ResultSet rs;
     try
   {
      Class.forName("com.mysql.jdbc.Driver");
	  con = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
	  pst = con.prepareStatement("update users set pswd=? where uid=? and pswd=?;");
	  pst.setString(1,np);
	  pst.setString(2,uid);
	  pst.setString(3,cp);
	  cnt=pst.executeUpdate();
	  if(cnt>0)
	  {
	%>
			<script>
			alert('Password Changed Successfully..');
			window.location='usersetting.jsp';
			</script>
	<%
	      }
      else
      {
%>	    
			<script>
			alert('Current Password not matched..');
			window.location='Changepass.jsp';
			</script>
<%
      }
       con.close();
	   }
      catch(Exception e)
      {
         out.println(e);
      }
  }
	else
    {
%>
    			<script>
			alert('Sorry new password mismatch..');
			window.location='Changepass.jsp';
			
	
			</script>
<%
 }
%>
</body>
</html>
<%
	}
	else
	{
	response.sendRedirect("../index.jsp");
	session.invalidate();
	}
	%>