<%@page import="java.sql.*;"%>
<html>
<body style="background:#21373d;">
<% 
	String receiver="";
	String subject="";
	String text="";
	String time="";
	String sender="";
	String uname="";
	String attach="";
	
	receiver = request.getParameter("to");
	subject = request.getParameter("subject");
	text = request.getParameter("text");
	time = request.getParameter("msgtime");
	sender = String.valueOf(session.getAttribute("uid"));
	uname = String.valueOf(session.getAttribute("uid"));
	attach=String.valueOf(session.getAttribute("attach"));
	
	Connection conn;
	ResultSet rs;
	PreparedStatement pst;
	int flag=0;
	%>
	<p>Before Send</p>
	<%
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		
		pst = conn.prepareStatement("select * from users where uid=?;");
		pst.setString(1,receiver);
		rs=pst.executeQuery();
		while(rs.next())
		{
			flag++;
			out.println(""+rs.getString("uid"));
		}
		
		if(flag>0)
		{
		
		pst = conn.prepareStatement("insert into message(sender,receiver,subject,date,body,senderdelete,receiverdelete,attach) values(?,?,?,?,?,?,?,?);");
		pst.setString(1,sender);
		pst.setString(2,receiver);
		pst.setString(3,subject);
		pst.setString(4,time);
		pst.setString(5,text);
		pst.setString(6,"no");
		pst.setString(7,"no");
		pst.setString(8,attach);
		flag = pst.executeUpdate();
		
		session.removeAttribute("attach");
		%>
		<script>
			alert('Message sent Successfully..');
			window.location='outbox.jsp';
			</script>
		<%
		}
		else
		{
			%>
			<p>User does not exist....</p>
			<input type="button" value="Retry" onclick=history.back()>
		<%
		}
		conn.close();
		}
		
	
	catch(Exception e)
	{
		out.println(e);
	}

	%>
</body>
</html>