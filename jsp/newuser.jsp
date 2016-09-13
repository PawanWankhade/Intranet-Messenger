
<title>Messenger</title>
<link href="../css/te_style.css" rel="stylesheet" type="text/css" />
<head>	
<script type="text/javascript">
<!--
// Form validation code will come here.
function validate()
{
 
   if( document.myForm.uname.value == "" )
   {
     alert( "Please provide your name!" );
     document.myForm.uname.focus() ;
     return false;
   }
   if( document.myForm.email.value == "" )
   {
     alert( "Please provide your Email!" );
     document.myForm.email.focus() ;
     return false;
   }
   if( document.myForm.uid.value == "")
   {
     alert( "Please provide a user id" );
     document.myForm.uid.focus() ;
     return false;
   }
   if( document.myForm.mobile.value == "-1" )
   {
     alert( "Please provide your mobile!" );
     document.myForm.mobile.focus() 
	 return false;
   }
   return( true );
	if( document.myForm.ans.value == "-1" )
   {
     alert( "Please provide your answer!" );
		document.myForm.ans.focus() 
     return false;
	 }
     if( document.myForm.age.value == "-1" )
   {
     alert( "Please provide your age!" );
     document.myForm.age.focus() 
	 return false;
   }
   return( true );

   
   return( true );

   }
//-->
</script>
</head>

<body>
<div id="te_wrapper">

	<div id="te_header">
        <div id="site_title">
            <a href="index.html"><img src="../images/te_logo.png" alt="Messenger" /><span></span></a>
        </div> <!-- end of site_title -->
    </div> <!-- end of te_header -->
    
    <div id="te_main">
    
    	
        <div id="te_content">
        <h2>Create New Account</h2>
		<form name="myForm" action="createuser.jsp" method="post"  onsubmit="return(validate());">
		<div id="tablecontainer">
		<div id="fieldset1">
		
		<fieldset>
		
		<table>
		<tr><td>User Name</td>
		<td><input type="text"  style="width:200px;" name="uname" value='' onblur="javascript: if(this.value==''){this.value='A new value';}" /></td></tr>
		<tr><td>User ID</td>
		<td><input type="text" style="width:200px;" name="uid" value="" ></td></tr>
		<tr><td>Age</td>
		<td><input type="text"  style="width:200px;" name="age" ></td></tr>
		<tr><td>Create a password</td>
		<td><input type="password" style="width:200px;" name="pswd1" value="" ></td></tr>
		<tr><td>Confirm your password</td>
		<td><input type="password" style="width:200px;" name="pswd2" value="" ></td></tr>
		<tr><td>Gender</td>
		<td><select style="margin-top:15px;margin-bottom:15px;width:200px;" name="gender" style="width:200px;">
		<option value="male">Male</option>
		<option value="female">Female</option>
		<option value="other">Other</option></td></tr>
		<tr><td>Birthday</td>
		<td><input type="date"  style="width:150px;" name="dob" ></td></tr>
		<tr><td>Mobile phone</td>
		<td><input type="text" style="width:200px;" name="mobile" value="" ></td></tr>
		<tr class="trc"><td>Email address</td>
		<td><input type="text" style="width:200px;" name="email" value="" ></td></tr>
		
		<tr><td>Security Question</td>
		<td><select style="margin-top:15px;margin-bottom:15px;width:200px;" name="hintque" style="width:200px;">
		<option value="What is your birth place">What is your birth place?</option>
		<option value="Which is your favourite colour">Which is your favourite colour?</option>
		<option value="other">Other</option></td></tr>
		
		<tr><td>Answer</td>
		<td><input type="text" style="width:200px;" name="ans" ></td></tr>
		
		
		<tr><td colspan="2"><input type="submit" value="Submit"></tr>
		</table>
		</fieldset>
		</div>
		</div>
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
