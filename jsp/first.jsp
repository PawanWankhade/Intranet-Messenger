<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Messenger</title>
<link href="../css/te_style.css" rel="stylesheet" type="text/css" />
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
				    <li><a href="first.jsp" class="current">Home</a></li>
                    <li><a href="inbox.jsp" >Inbox</a></li>
                    <li><a href="newsms.jsp">Send Message</a></li>
					<li><a href="outbox.jsp?message=" >Outbox</a></li>
                    <li><a href="usersetting.jsp">Settings</a></li>
                    <li><a href="allusers.jsp">Users Details</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
            </div> <!-- end of te_menu -->
            
        </div> <!-- end of te_sidebar -->
   	
        <div id="te_content">
		<p style="float:right;"><%=uid%></p>
        <div id="te_content">
        
            <h1>Introducing Messenger</h1>
          <h3><a href="#">Intranet Messenger,is a instant messaging program designed for use within</a></h3>
		  <h3><a href="#">single Local Area Network.</a></h3>
		  <h4><a href="#">Send Messages Securily,Strictly Within Your Local Network</a></h4>
          <h4><a href="#">Improve Office Communications Between Employees in the Company</a></h4>
			<h4><a href="#"> No Internet Connection Required</a></h4>
			<h4><a href="#">Send Immediate Announcements to Employees</a></h4>
		 <h4><a href="#">Easy Learning Curve</a></h4>
		 <div class="cleaner_h40"></div>
            
			</div>





		</div>
            <div class="cleaner"></div>
    </div> <!-- end of te_main -->
    
    <div id="te_footer">

        Copyright © 2048 <a href="#">GCOEA</a> | 
        Designed by <a href="#" target="_parent">Tushar,Pavan,Pankaj</a> | 
    
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
	