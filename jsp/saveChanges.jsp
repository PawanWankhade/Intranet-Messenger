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

	
	String uname,email,mobile;
	int age;
	uname=request.getParameter("uname");
	email=request.getParameter("email");
	mobile=request.getParameter("mobile");
	Connection conn;
	PreparedStatement pst;
	Statement st;
	int flag=0;
	int flag2=0;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		pst = conn.prepareStatement("update users set uname=? where uid=?");
		pst.setString(1,uname);
		pst.setString(2,uid);
		flag = pst.executeUpdate();
	
		pst	=	conn.prepareStatement("update userpersonal set uname=?, mobile=?, email=?  where uid=?");
		pst.setString(1,uname);
		pst.setString(2,mobile);
		pst.setString(3,email);
		pst.setString(4,uid);
		flag2=pst.executeUpdate();
		if(flag==1 & flag2==1)
		{
		%>
			<script>
			alert('Account updated successfully..');
			window.location='usersetting.jsp';
			</script>
	
		<%
		}
		else
		{
		%>
			<script>
			alert('Please Enter  data correctly ..');
			window.location='usersetting.jsp';
			</script>
	
		<%
		}
		conn.close();
	}catch(Exception e)
	{
		out.println(e);
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