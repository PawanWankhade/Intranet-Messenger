<%@page import="java.sql.*;"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Messenger</title>
<link href="../css/te_style.css" rel="stylesheet" type="text/css" />
</head>

<body>
	
    
    <div id="te_wrapper">
		<div id="te_header">
        <div id="site_title">
            <a href="index.html"><img src="../images/te_logo.png" alt="messenger" /><span></span></a>
        </div> <!-- end of site_title -->
    </div> <!-- end of te_header -->

   
 
	<div id="te_main">
    
    	<div id="te_sidebar">
        
            <div id="te_menu">
                <ul>
				   <li><a href="first.jsp">Home</a></li>
                    <li><a href="inbox.jsp" class="current">Inbox</a></li>
                    <li><a href="newsms.jsp">Send Message</a></li>
					<li><a href="outbox.jsp" >Outbox</a></li>
                    <li><a href="usersetting.jsp">Settings</a></li>
                    <li><a href="allusers.jsp">Users Details</a></li>
					<li><a href="logout.jsp">Logout</a></li>
					</ul>
            </div> <!-- end of te_menu -->
            
           
           
        </div> <!-- end of te_sidebar -->
        
    
            
    <%
	String uid=String.valueOf(session.getAttribute("uid"));
	int  mid=Integer.parseInt(request.getParameter("mid"));
	
	Connection conn;
	ResultSet rs;
	PreparedStatement pst;
	int flag=0;
	String sen="";
	String sub="";
	String bod="";
	String msg="";
	String attach="";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		
		pst = conn.prepareStatement("select * from message where mid=? and receiverdelete='no';");
		
		pst.setInt(1,mid);
		rs=pst.executeQuery();
		while(rs.next())
		{
			
			sen=rs.getString("sender");
			sub=rs.getString("subject");
			bod=rs.getString("body");
			attach=rs.getString("attach");
		}
		}
		catch(Exception e)
		{
			out.println(e);
		}
		
	%>
	  <div id="te_content">
         <div id="contact_form">
					<form name="frm1" action="#" method="POST">
										<p><%=uid%></p>
						
						<label for="author">To(user id):</label>
						
						<input type="text" id="author" name="to" class="required input_field" value="<%=sen%>" disabled="disabled">
                        <div class="cleaner_h10"></div>
                        
                        
                        <label for="url">Subject:</label> <input type="text" name="subject" id="subject" class="input_field" value="<%=sub%>" disabled="disabled">
                        <div class="cleaner_h10"></div>
                        
                        <label for="text">Message:</label> <textarea id="text" name="text" rows="0" cols="0" class="required"  disabled="disabled"><%=bod%></textarea>
                       
                        <div class="cleaner_h10"></div>
						<%
						if(!attach.equals("null"))
						{
						%>
						<a href="../UploadedFiles/<%=attach%>" target="_blank"><%=attach%></a>
						<%
						}
						%>
                        <div class="cleaner_h10"></div>
                        
                        
						<a href="inboxdelete.jsp?mid=<%=mid%>">Delete</a>
						<%
							
						%>
						
						
            		
			   </form>
			               </div>         
      </div> <!-- end of te_content -->
    
    	<div class="cleaner"></div>
    </div> <!-- end of te_main -->
    
    <div id="te_footer">

        Copyright © 2048 <a href="#">GCOEA</a> | 
        Designed by <a href="#" target="_parent">Tushar,Pavan,Pankaj</a> | 
       
    </div> <!-- end of te_footer -->
	
    <div class="cleaner"></div>
</div> <!-- end of te_wrapper -->
</body>
</html>
