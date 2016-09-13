<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script type="text/javascript">

function showDate()
{
	var t = new Date();
	dt = t.getDate()+"/"+t.getMonth()+"/"+t.getFullYear()+"/"+" "+t.getHours()+":"+t.getMinutes()+":"+t.getSeconds();
	document.frm1.msgtime.value=dt;
	
}


</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Messenger</title>
<link href="../css/te_style.css" rel="stylesheet" type="text/css" />
</head>
 <%
		String uid="null";
		String type="null";
		String logdin="null";
		String atch="null";

	uid=String.valueOf(session.getAttribute("uid"));
	type=String.valueOf(session.getAttribute("type"));
	logdin=String.valueOf(session.getAttribute("logdin"));
	atch=String.valueOf(session.getAttribute("attach"));
	out.println(atch);
	if(!(uid.equals("null") && type.equals("null") && logdin.equals("null")))
	{
	%>
	
<body onLoad="showDate()">
	
    
    <div id="te_wrapper">
		<div id="te_header">
        <div id="site_title">
            <a href="index.html"><img src="../images/te_logo.png" alt="messenger" /></a>
        </div> <!-- end of site_title -->
    </div> <!-- end of te_header -->

   <div id="te_main">
  	<div id="te_sidebar">
        
            <div id="te_menu">
                <ul>
				 <li><a href="first.jsp">Home</a></li>
                    <li><a href="inbox.jsp" >Inbox</a></li>
                    <li><a href="newsms.jsp" class="current">Send Message</a></li>
					<li><a href="outbox.jsp" >Outbox</a></li>
                    <li><a href="usersetting.jsp">Settings</a></li>
                    <li><a href="allusers.jsp">Users Details</a></li>
					<li><a href="logout.jsp">Logout</a></li>
				</ul>
            </div> <!-- end of te_menu -->
            
           

        </div> <!-- end of te_sidebar -->
        
      <div id="te_content">
         <p><%=uid%></p>
		 <div id="contact_form">
            
                    <h2>Send Message</h2>
					
						<form name="frm1" action="sendmessage.jsp" method="POST">
						<label for="author">To(user id):</label>
						<input type="text" id="author"  name="to" class="required input_field" onmouseover=showDate()>
                        <div class="cleaner_h10"></div>
							
						
                  
                    
						
						<label for="url">Subject:</label> <input type="text" name="subject" id="subject" class="input_field">
                        <div class="cleaner_h10"></div>
                        
                        <label for="text">Message:</label> <textarea id="text" name="text" rows="0" cols="0" class="required"></textarea>
                        <input type="hidden" name="msgtime">
                        <div class="cleaner_h10"></div>
						<%
						if(atch.equals("null"))
						{ %>
						<a href="attach.jsp">Attach</a>
						<%
						}
						%>
					
						
                        <div class="cleaner_h10"></div>
                        
                        
						<input style="font-weight: bold;" type="submit" class="submit_btn" name="submit" id="submit" value=" Send ">
						<input style="font-weight: bold;" type="reset" class="submit_btn" name="reset" id="reset" value=" Reset ">
						
            		
			   </form>
			
						<label name="tt" for="author"></label>
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
	<%
	}
	else
	{
	response.sendRedirect("../index.jsp");
	session.invalidate();
	}
	%>
	
