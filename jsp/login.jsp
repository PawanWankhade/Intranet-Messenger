<%@page import="java.sql.*"%>
<%@page import="mybeans.*"%>
<html>
<body style="background:#21373d;">
<%
	
	String uid,pswd=null,atype=null,uname=null,loginstatus=null;
	Connection conn;
	PreparedStatement pst;
	ResultSet rs;
	
	int count=0;
	uid = request.getParameter("uid");
	pswd = request.getParameter("pswd");
	out.println(uid);
	out.println(pswd);
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		pst = conn.prepareStatement("select * from users where uid=? and pswd=?;");
		pst.setString(1,uid);	
		pst.setString(2,pswd);		
		rs=pst.executeQuery();
		while(rs.next())
		{
			count++;
			atype=rs.getString("logintype");
			uname=rs.getString("uname");
			uid=rs.getString("uid");
			loginstatus=rs.getString("loginstatus");
		}
		
		if(loginstatus.equals("Inactive"))
		{
			%>
			<script>
			alert("Sorry Your Accout is blocked,contact to Administrator");
			window.location='../index.jsp';
			</script>
			<%
		}
		else
		{
		
		if(count>0 && atype.equals("admin"))
		{
		String login="true";
		session.setAttribute("uid",uid);
		session.setAttribute("type",atype);
		session.setAttribute("logdin",login);	
	%>
		<jsp:forward page="admin.jsp" />
		out.println(uname);		
		<h2><%=uname%></h2>
		<%
		}
		if(count>0 && atype.equals("user"))
		{
		String login="true";
		session.setAttribute("uid",uid);
		session.setAttribute("logdin",login);
		session.setAttribute("type",atype);
	
		%>
		<jsp:forward page="first.jsp"/>
		<%
		}
		else
		{
		%>
			<script>
			<%=uid%>	
			alert('Please check user id or password..');
			window.location='../index.jsp';
			</script>
			<%
		
		}
		}
		conn.close();
		}catch(Exception e)
		{
			%>	<script>
			alert('Please check user id or password..');
			window.location='../index.jsp';
			</script>
			<%
		}
	%>	
</body>
</html>
 