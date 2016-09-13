

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Messenger</title>
<link href="css/te_style.css" rel="stylesheet" type="text/css" />
</head>


<body onload="document.frm.uid.focus()">






<div id="te_wrapper">

	<div id="te_header">
        <div id="site_title">
            <a href="index.html"><img src="images/te_logo.png" alt="messenger" /><span></span></a>
        </div> <!-- end of site_title -->
    </div> <!-- end of te_header -->
    
    <div id="te_main">
    
        
        <div id="te_content">
        
            <h3 style="margin-left:175px">Welcome to the Messenger</h3>
         
		 
           <form style="margin-left:140px " id="form-1" name="frm" method="post" action="/messenger/jsp/login.jsp">
			
			User Id
			<input type="text" name="uid">
			Password
			<input type="password" name="pswd">
			<input type="submit" value="Submit">
			<a style="margin-left:90px;" href="/messenger/jsp/forget.jsp">Forget Password</a>
			
			<a style="margin-left:155px;"href="/messenger/jsp/newuser.jsp">Register</a>
			
			</form>
                   
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