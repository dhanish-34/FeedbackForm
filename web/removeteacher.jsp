<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
    <%
try
{
	String str1, str2;
	str1=request.getParameter("tname");
	str2=request.getParameter("dname");
	if( str1 != null || str2 != null)
	{	
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "delete from teacher where sno="+str1;
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
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link href="jquery.comiseo.daterangepicker.css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script>
$(document).ready(function() {	
	alert("in remove");
		$("#dname").change(function() {
			$.ajax({
				type : 'GET',
				url : 'giveFeedback/getTeachers',
				data : {
					id : document.getElementById('dname').value
				},
				success : function(result) {
					$("#tname").html(result)
				}
			});
		});
});
</script>
<script language="javascript" >
function fun()
{
	var name=document.removeteacher.tname.value;
	var dname=document.removeteacher.dname.value;
	if(name=="" || dname=="")
	{
		alert("First Details must be filled");
		return false;
	}
}
</script>
</head>
<body>
<body bgcolor="grey">
<form name="removeteacher"  onsubmit="return fun()" method="post" >
<center>
<img src="skcet.png" width="780" height="151" alt="logo"><br><br>
<font color=Black><MARQUEE WIDTH=100% BEHAVIOR=ALTERNATE BGColor=white><u><b>REMOVE A TEACHER</b></u></MARQUEE></font><br><br>
<br><br>
<table width="50%" border="0" align="center" cellpadding="5" cellspacing="5"> 
<tr>
<th align=left>Enter Branch :</th><td align=left><select name="dname" id="dname" size="1">
		<option value="">
		<option value="CSE">Computers
		<option value="MECH">Mechanical
		<option value="IT">Information Technology
		<option value="EEE">Electrical and Electronics
		<option value="ECE">Electrical & Communication
		<option value="FT">Fashion Technology
		</select></td>
</tr>
<tr>
<th align=left>Enter Name :</th>
<th align=left><select name="tname" id="tname" size="1">
		<option value="">
		
		</select></th>
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