<%@page import="java.sql.*;"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
		String uid="null";
		String type="null";
		String logdin="null";
		

	uid=String.valueOf(session.getAttribute("uid"));
	type=String.valueOf(session.getAttribute("type"));
	logdin=String.valueOf(session.getAttribute("logdin"));
	
	if(!(uid.equals("null") && type.equals("null") && logdin.equals("null")))
	{
	%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Messenger</title>
<link href="../../css/te_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="te_wrapper">

	<div id="te_header">
        <div id="site_title">
            <a href="index.html"><img src="../../images/te_logo.png" alt="Messenger" /></a>
        </div> <!-- end of site_title -->
    </div> <!-- end of te_header -->
    <div id="te_main">
	<div id="te_sidebar">
        
                    <div id="te_menu">
                <ul>
					<li><a href="../admin.jsp">Users</a></li>
                    <li><a href="inbox.jsp" class="current">Inbox</a></li>
                    <li><a href="newsms.jsp">Send Message</a></li>
					<li><a href="outbox.jsp" >Outbox</a></li>
                    <li><a href="usersetting.jsp">Settings</a></li>
                    
					<li><a href="logout.jsp">Logout</a></li>
									</ul>
            </div> <!-- end of te_menu -->
            
        </div> <!-- end of te_sidebar -->
   	
        <div id="te_content">
		
		<h2>Inbox</h2>
		<table>
		
		<tr><th>SrNo</th><th style="padding-left:50px;">To</th><th style="padding-left:50px;">Subject</th><th style="padding-left:50px;">Date</th></tr>
		<%
			Connection conn;
			ResultSet rs;
			PreparedStatement pst;
			int count=0;
			int num=0;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
				pst = conn.prepareStatement("select * from message where receiver=? and receiverdelete='no';");
				pst.setString(1,uid);
				rs=pst.executeQuery();
				while(rs.next())
				{
					count++;
					num++;
					int mid=Integer.parseInt(rs.getString("mid"));
				%>
				<tr><td><%=num%></td><td><%=rs.getString("sender")%></td><td><a href="inboxdetails.jsp?mid=<%=mid%>"><%=rs.getString("subject")%></a></td><td><%=(rs.getString("date")).substring(0,9)%></td></tr>
				<%	
				}
				%>
				</table>
				<%
			}catch(Exception e)
			{
				out.println(e);
			}
		
		%>
		
	
		
		</div>
            <div class="cleaner"></div>
    </div> <!-- end of te_main -->
    
    <div id="te_footer">

        Copyright � 2048 <a href="#">GCOEA</a> | 
        Designed by <a href="#" target="_parent">Tushar,Pavan,pankaj</a> | 
    
    </div> 	
    <div class="cleaner"></div>
</div> <!-- end of te_wrapper -->

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
