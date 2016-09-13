<%@page import="java.sql.*;"%>
<html>
<body>
<% 
	String uname,uid1;
	int age;
	uid1=request.getParameter("uid3");
	Connection conn;
	PreparedStatement pst;
	
	int flag;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		pst = conn.prepareStatement("update users set loginstatus=? where uid=?");
		pst.setString(1,"Inactive");
		pst.setString(2,uid1);
		flag = pst.executeUpdate();
		if(flag>0)
		{
		%>
		<jsp:include page="../html/header.html" />
		
		<h2 style="margin:20px 50px 150px 120px;float:right;padding-bottom:50px;">Data Entered Successfully</h2>
		<input type="button" value="Back" onclick="history.back()">
		</div>
		
		<jsp:include page="../html/footer.html" />
		<%
		}
		else
		{
			%>
			<h2>Sorry operation failed..</h2>
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