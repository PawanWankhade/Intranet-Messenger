<%@page import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Messenger</title>
<link href="/messenger/css/te_style.css" rel="stylesheet" type="text/css" />
</head>
        <%
			String uid="null";
			String type="null";
			String logdin="null";
			
			uid=String.valueOf(session.getAttribute("uid"));
			type=String.valueOf(session.getAttribute("type"));
			logdin=String.valueOf(session.getAttribute("logdin"));
	
			if(!(uid.equals("null") && type.equals("null") && logdin.equals("null")))
			{
				if(!(type.equals("admin")))
				{
					response.sendRedirect("../../html/errorpage.html");
					session.invalidate();
				}
				else
				{
				%>
<body>
<div id="te_wrapper">

	<div id="te_header">
        <div id="site_title">
            <a href="index.html"><img src="../images/te_logo.png" alt="Messenger" /></a>
        </div> <!-- end of site_title -->
    </div> <!-- end of te_header -->
    
    <div id="te_main">
    
    	<div id="te_sidebar">
        
            <div id="te_menu">
                <ul>
   				    <li><a href="admin.jsp" class="current">Users</a></li>
                    <li><a href="admin/inbox.jsp">Inbox</a></li>
                    <li><a href="admin/newsms.jsp">Send Message</a></li>
					<li><a href="admin/outbox.jsp" >Outbox</a></li>
                    <li><a href="admin/usersetting.jsp">Settings</a></li>
                    <li><a href="../logout.jsp">Logout</a></li>
           </ul>
            </div> <!-- end of te_menu -->
            
            
        </div> <!-- end of te_sidebar -->
        <div id="te_content">
		
		
		<p style="float:right;"><%=uid%></p>
		
		
		<h2>Users</h2>
		<table>
		
		<tr><th>SrNo</th><th style="padding-left:30px;">User Name</th><th style="padding-left:30px;">User Id</th><th style="padding-left:30px;">Login Status</th></tr>
		<%
			Connection conn;
			ResultSet rs;
			Statement st;
			int count=0;
			int num=0;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
				st = conn.createStatement();
				rs=st.executeQuery("select * from users;");
				while(rs.next())
				{
					count++;
					num++;
					
				
				%>
				<tr><td><%=num%></td><td>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("uname")%></td><td><a href='userdetails.jsp?uid2=<%=rs.getString("uid")%>'><%=rs.getString("uid")%></a></td><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=(rs.getString("loginstatus"))%></td></tr>
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
        Designed by <a href="#" target="_parent">Tushar,Pavan,Pankaj</a> | 
    
    </div> 
	
    <div class="cleaner"></div>
</div> <!-- end of te_wrapper -->

</body>
</html>
<%
	}
	}
	else
	{
	response.sendRedirect("../index.jsp");
	session.invalidate();
	}
	%>
	