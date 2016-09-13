<%@page import="java.sql.*;"%>
<html>
<body style="background:#21373d;">


<%	
	Connection conn;
	ResultSet rs;
	PreparedStatement pst;
	int flag=0;
	int  mid=Integer.parseInt(request.getParameter("mid"));
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		pst = conn.prepareStatement("update message set receiverdelete='yes' where mid=?");
		pst.setInt(1,mid);
		flag=pst.executeUpdate();
		if(flag>0)
		{
			%>
			<script>
			alert('Message Deleted Successfully..');
			window.location='inbox.jsp';
			</script>
	<%
	}
	}catch(Exception e)
	{
		out.println(e);
	}	
%>		

</body>
</html>