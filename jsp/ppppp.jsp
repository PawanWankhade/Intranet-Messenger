<%@page import="java.sql.*;"%>
<%
		Connection conn;
		Statement pst;
		try
		{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		pst = conn.createStatement();
		pst.executeUpdate("insert into p values(password(123))");
		}catch(Exception e)
		{
			out.println(e);
		}
		
%>		