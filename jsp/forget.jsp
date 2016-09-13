
<title>Messenger</title>

<link href="../css/te_style.css" rel="stylesheet" type="text/css" />
<head>
<script language="javascript">
function showDate()
{
	var t = new Date();
	dt = t.getMinutes()+":"+t.getSeconds();
	document.frm1.crnttime.value=dt;
	
}

</script>
</head>


<body onload="showDate()">
<%
	String uid="null";
	String logdin="null";
	String tt="null";

	logdin=String.valueOf(session.getAttribute("logdin"));
	if(!logdin.equals("null"))
	{
		response.sendRedirect("../index.jsp");
	}
	else
	{
	%>
<div id="te_wrapper">

	<div id="te_header">
        <div id="site_title">
            <a href="../index.html"><img src="../images/te_logo.png" alt="Messenger" /></a>
        </div> <!-- end of site_title -->
    </div> <!-- end of te_header -->
    
    <div id="te_main">
    
        <div id="te_content">
		 		<div id="tablecontainer">
		<div id="fieldset1">

					
	<fieldset>
	<table>
	<form name="frm1" action="forgetpass.jsp" method="POST">
	<tr>
	<td><p>User Name</p></td>
	<td><input type="text" name="uname"></td></tr>

<tr>
<td><p>User Id</p>
<td><input type="text" name="uid"></td></tr>

<tr>
<td><p>Date of birth</p>
<td><input type="date" name="dob"></td></tr>

<tr>
<td><p>Email</p>
<td><input type="text" name="email"></td></tr>
<input type="hidden" name = "crnttime">

<tr>
<td><p>Hint Que</p>
<td><select name="hintque">
<option value="What is your Birth Place">What is your Birth Place?</option>
<option value="Who is your Idol">Who is your Idol?</option>
</select></tr>

<tr>
<td><p>Ans</p>
<td><input type="text" name="ans"></tr>

<tr>
<td colspan="2"><input type="submit" value="Submit"></tr>


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
	<%
	}
	%>
	
