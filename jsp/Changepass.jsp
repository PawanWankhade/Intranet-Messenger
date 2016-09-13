
<title>Messenger</title>

<link href="../css/te_style.css" rel="stylesheet" type="text/css" />
</head>

<body>
<%
 String uid=String.valueOf(session.getAttribute("uid"));
%>
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
					<li><a href="first.jsp">Home</a></li>
                    <li><a href="inbox.jsp" >Inbox</a></li>
                    <li><a href="newsms.jsp">Send Message</a></li>
					<li><a href="outbox.jsp" >Outbox</a></li>
                    <li><a href="usersetting.jsp" class="current">Settings</a></li>
                    <li><a href="allusers.jsp">Users Details</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
            </div> <!-- end of te_menu -->
            
            
        </div> <!-- end of te_sidebar -->
        
        <div id="te_content">
		 
					<p><%=uid%>
                    <h2>Change Settings</h2>
					
					<form name="frm1" metho="post" action="Changepass1.jsp">
					<table>
					<tr><td></td><td></td><td></td><td   rowspan="3"><img style="margin-left:20px;" src="" alt="photo" width="80px" height="100px" ></td></tr>
					<tr><td><p>Current Password</p></td><td><input type="password" name="cps" id="crnt" ></td></tr>
					<tr><td><p>New Password </p></td><td><input type="password" name="nps" id="new"></td></tr>
					<tr><td><p>Retype Password </p></td><td><input type="password" name="rps" id="rnew"></td></tr>
					<tr><td><input type="submit" name="savebtn" id="save" value="Save"></td></tr>
					
					</table>
                    </form>
         
     
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