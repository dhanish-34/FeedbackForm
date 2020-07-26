<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <%
try
{
	String str1, str2;
	str1=request.getParameter("tname");
	
	if( str1 != null)
	{	
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "delete from student where roll='"+str1+"'";
		System.out.println(sql);
		s.execute(sql);
		%><jsp:forward page="adminhome.html"/> <%
	}
	
}catch(Exception e ){}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Remove A Teacher</title>
<script language="javascript" >
function fun()
{
	var name=document.removeteacher.tname.value;
	
	if(name=="" )
	{
		alert("First Details must be filled");
		return false;
	}
}
</script>
</head>
<body>
<body bgcolor="grey">
<form name="removeteacher" onsubmit="return fun()" >
<center>
<img src="skcet.png" width="780" height="151" alt="logo"><br><br>
<font color=Black><MARQUEE WIDTH=100% BEHAVIOR=ALTERNATE BGColor=white><u><b>REMOVE A STUDENT</b></u></MARQUEE></font><br><br>
<br><br>
<table width="50%" border="0" align="center" cellpadding="5" cellspacing="5"> 
<tr>
<th align=left>Roll No :</th><td align=left><input type=text name=tname size="30" ></td>
</tr>

<tr>
	<th colspan=0 align=right><input type="RESET" value=RESET></th>
	<th colspan=0 align=left><input type="SUBMIT" value=SUBMIT></th>
</tr>
</table>
</center>
</form>

</body>
</html>