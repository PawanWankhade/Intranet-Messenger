<%@page import="java.sql.*;"%>
<html>
<body>
<% 
	String uname,uid,pswd1,pswd2,gender,dob,email,mobile,logintype,hintque,ans;
	int age;
	uname=request.getParameter("uname");
	email=request.getParameter("email");
	mobile=request.getParameter("mobile");
	Connection conn;
	PreparedStatement pst;
	Statement st;
	int flag;
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		pst = conn.prepareStatement("update users set uname=? where uid=?);
		pst.setString(1,uname);
		pst.setString(2,uname);
		pst.setString(3,pswd1);
		pst.setString(4,logintype);
		pst.setString(5,"active");
		flag = pst.executeUpdate();
	
		pst	=	conn.prepareStatement("insert into userpersonal values(?,?,?,?,?,?,?,?,?);");
		pst.setString(1,uid);
		pst.setString(2,uname);
		pst.setString(3,dob);
		pst.setString(4,gender);
		pst.setString(5,mobile);
		pst.setInt(6,age);
		pst.setString(7,email);
		pst.setString(8,hintque);
		pst.setString(9,ans);
		pst.executeUpdate();
		%>
		<jsp:include page="../html/header.html" />
		
		<h2 style="margin:20px 50px 150px 120px;float:right;padding-bottom:50px;">Data Entered Successfully</h2>
		<a href="../index.jsp">Login Page</a>
		</div>
		
		<jsp:include page="../html/footer.html" />
		<%
		conn.close();
	}catch(Exception e)
	{
		out.println(e);
	}
	}
	else
	{
		%>
		<h2>Password failed</h2>
		<input type="button" name="btn" onclick="history.back()">
	<%
	}
	%>
</body>
</html>