<%@page import="java.sql.*;"%>
<title>Messenger</title>

<link href="../../css/te_style.css" rel="stylesheet" type="text/css" />
<head>
<script >
function setResult(pp)
{
document.getElementById(pp).readOnly=false;
activeButton();
}
function activeButton()
{
	document.getElementById("save").disabled=false;
}
</script>
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
	Connection conn;
	ResultSet rs;
	PreparedStatement pst;
	int count=0;
	int num=0;
	String uname="",email="",mobile="",userid="";
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/messenger?user=root&password=pawansql");
		pst = conn.prepareStatement("select * from userpersonal where uid=?;");
		pst.setString(1,uid);
		rs=pst.executeQuery();
		while(rs.next())
		{
			uname  = rs.getString("uname");
			email = rs.getString("email");
			mobile = rs.getString("mobile");
			userid = rs.getString("uid");
		}
		conn.close();
	}catch(Exception e)
	{
		out.println(e);
	}
		

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
					<li><a href="../admin.jsp">Users</a></li>
                    <li><a href="inbox.jsp" >Inbox</a></li>
                    <li><a href="newsms.jsp">Send Message</a></li>
					<li><a href="outbox.jsp" >Outbox</a></li>
                    <li><a href="usersetting.jsp" class="current">Settings</a></li>
                    
					<li><a href="logout.jsp">Logout</a></li>
								</ul>
            </div> <!-- end of te_menu -->
            
            
        </div> <!-- end of te_sidebar -->
        
        <div id="te_content">
		 
					<p><%=uid%>
                    <h2>Change Settings</h2>
					
					<form name="frm1" metho="post" action="saveChanges.jsp">
					<table>
					<tr><td></td><td></td><td></td><td   rowspan="3"><img style="margin-left:20px;" src="" alt="photo" width="80px" height="100px" ></td></tr>
					<tr><td><p>User Id :</p></td><td><input type="text" name="txt1" readonly id="uid" value="<%=uid%>"></td></tr>
					<tr><td><p>Name :</p></td><td><input type="text" name="uname" id="uname" readonly value="<%=uname%>"></td><td><input style="width:50px;" type="button" value="Edit" type="button" onclick="setResult('uname')"></td></tr>
					<tr><td><p>Email :</p></td><td><input type="text" name="email" id="email" readonly  value="<%=email%>"</td><td><input style="width:50px;" type="button" value="Edit" type="button" onclick="setResult('email')"></td></tr>
					<tr><td><p>Mobile :</p></td><td><input type="text" name="mobile" id="mobile" readonly  value="<%=mobile%>"</td><td><input style="width:50px;" type="button" value="Edit" type="button" onclick="setResult('mobile')"></td></tr>
					<tr><td><p>Password:</p></td><td><a href="Changepass.jsp">Change</a></td></tr>
					<tr><td  colspan="2"><input type="submit" name="savebtn" id="save" value="Save" disabled="true" onclick="savesettings.jsp"></td></tr>
					</table>
                    </form>
         
     
	  </div>		
            <div class="cleaner"></div>
  
	</div> <!-- end of te_main -->
    
    <div id="te_footer">

        Copyright © 2048 <a href="#">GCOEA</a> | 
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