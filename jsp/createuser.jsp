<%@page import="java.sql.*;"%>
<html>
<body>
<% 
	String uname,uid,pswd1,pswd2,gender,dob,email,mobile,logintype,hintque,ans;
	int age;
	uname=request.getParameter("uname");
	uid=request.getParameter("uid");
	pswd1=request.getParameter("pswd1");
	pswd2=request.getParameter("pswd2");
	gender=request.getParameter("gender");
	dob=request.getParameter("dob");
	email=request.getParameter("email");
	mobile=request.getParameter("mobile");
	age=Integer.parseInt(request.getParameter("age"));
	hintque=request.getParameter("hintque");
	ans=request.getParameter("ans");
	logintype="user";
	Connection conn;
	PreparedStatement pst;
	Statement st;
	int flag;
	if(pswd1.equals(pswd2))
	{
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		
		
		pst = conn.prepareStatement("insert into users values(?,?,?,?,?);");
		pst.setString(1,uid);
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
		<title>Messenger</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="../css/te_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="te_wrapper">

	<div id="te_header">
        <div id="site_title">
            <a href="index.html"><img src="../images/te_logo.png" alt="Messenger" /></a>
        </div> <!-- end of site_title -->
    </div> <!-- end of templatemo_header -->
    
    <div id="te_main">
		<div id="te_content">
		<h2 style="margin:20px 50px 150px 120px;float:right;padding-bottom:50px;">Data Entered Successfully</h2>
		<a href="../index.jsp">Login Page</a>
		</div>
		</div>
		<div id="te_footer">

        Copyright © 2048 <a href="#">GCOEA</a> | 
        Designed by <a href="#" target="_parent">Tushar,Pavan,Pankaj</a> | 
    
    </div> 	
    <div class="cleaner"></div>
</div> <!-- end of te_wrapper -->
<%
		conn.close();
	}catch(Exception e)
	{
		%>
		<script>
	alert("Sorry user exist,Please enter another user id");
	window.location='newuser.jsp';
	</script>
	<%
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