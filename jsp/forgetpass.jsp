<%@page import="java.sql.*"%>
<html>
<body style="background:#21373d;">
<%
	
	Connection conn;
	PreparedStatement pst;
	ResultSet rs;
	String uname,uid,dob,email,ans,que,time;
	int count=0;
	boolean flag=false;
	int count1=0;
	uname=request.getParameter("uname");
	uid=request.getParameter("uid");
	dob=request.getParameter("dob");
	email=request.getParameter("email");
	que=request.getParameter("que");
	ans=request.getParameter("ans");
	time=request.getParameter("crnttime");
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		pst=conn.prepareStatement("select * from users where uname=? and uid=?;");
		pst.setString(1,uname);	
		pst.setString(2,uid);
		rs=pst.executeQuery();
		while(rs.next())
		{
			count++;
		}
		if(count>0)
		{
			
			pst=conn.prepareStatement("select * from  userpersonal where dob=? and email=? and ans=?;");
			pst.setString(1,dob);
			pst.setString(2,email);
			pst.setString(3,ans);
			rs=pst.executeQuery();
			while(rs.next())
			{
				count1++;
			}
			if(count1>0)
			{
			out.println("\nSecond Authentication verified");
			flag=true;
			}
			else
			{
			%>
			<h3>Sorry Authentication Failed</h3>
			
			<%	
			}
		
		}
		else
		{ %>
			<h2>Sorry Record Not Found</h2>
			<%	
		}
		if(flag)
		{
		String newpass;
		String char1="!@#$%^&*()_+";
		String da;
		da=dob.substring(0,2);
		int da1=(Integer.parseInt(da))%4;
		newpass=ans.substring(2,3);
		newpass=newpass.concat(char1.substring(da1,(da1+1)));
		newpass=newpass.concat(dob.substring(1,2));
		newpass=newpass.concat(email.substring(2,4));
		newpass=newpass.concat(ans.substring(1,3));
		newpass=newpass.concat(char1.substring(da1+2,(da1+3)));
		
		pst=conn.prepareStatement("update users set pswd=? where uid=?;");
		pst.setString(1,newpass);
		pst.setString(2,uid);
		pst.executeUpdate();
		
	
		%>
		
		<script>
			alert('New Password is <%=newpass%>');
			window.location='usersetting.jsp';
			</script>
		
		
		<h3>New Password :<%=newpass%></h3>
		<a href="../index.jsp">Login</a>
		
		<%
		}
	
	}catch(Exception e)
	{
		out.println(e);
	}

	%>
</body>
</html>