<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Teacher</title>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link href="jquery.comiseo.daterangepicker.css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script>
	window.onload=function() {
            alert("page loadeds");
			$.ajax({
				type : 'GET',
				url : 'addteacherInfo',
				success : function(result) {
					$("#teacher").html(result)
				}
			});
		};
		$(document).ready(function() {
		$("#teacher").change(function() {
			$.ajax({
				type : 'GET',
				url : 'addteacherInfo/getDepartment',
				data : {
					id : document.getElementById('teacher').value
				},
				success : function(result) {
					$("#branch").html(result)
				}
			});
		});
		$("#branch").change(function() {
			$.ajax({
				type : 'GET',
				url : 'addteacherInfo/getSubject',
				data : {
					id : document.getElementById('branch').value
				},
				success : function(result) {
					$("#sub").html(result)
				}
			});
		});
		});
</script>
<script language="javascript" >
function fun()
{
	
}
</script>
</head>
<body>
<body bgcolor="grey">
<form name="addteacherInfo" action="getInfo" onSubmit="return fun()" method="post" >
<center>
<img src="skcet.png" width="780" height="151" alt="logo"><br><br>
<font color=Black><MARQUEE WIDTH=100% BEHAVIOR=ALTERNATE BGColor=white><u><b>ADD TEACHER INFORMATION</b></u></MARQUEE></font><br><br>
<br><br>
<table width="50%" border="0" align="center" cellpadding="5" cellspacing="5"> 
<tr>
<th align=left>Enter Name :</th><td align=left><select name=teacher id=teacher required>
							<option value=''>---Select teacher---</option>
					</select></td>
</tr>
<tr>
<tr>
<th align=left>Enter Branch :</th><td align=left><select name=branch id=branch required>
							<option value=''>              </option>
					</select></td>
</tr>
<tr>
<th align=left>Year :</th><td align=left><select name="year" size="1" required>
<option value="">select year
		<option value="1">I
		<option value="2">II
		<option value="2">III
		<option value="4">IV
		</select>
		</td>
</tr>
<tr>
<th align=left>Semester :</th><td align=left><select name="sem" size="1" required>
<option value="">select semester
		<option value="1">I
		<option value="2">II
	
		</select></td>
</tr>
<tr>
<th align=left>Section :</th><td align=left><select name="section" size="1" required>
<option value="">select section
		<option value="A">A
		<option value="B">B
		<option value="C">C
		
		</select></td>
</tr>
<tr>
<th align=left>Subject :</th><td align=left><select name="sub" id="sub" size="1" required>
<option value="">select subject </option>
				
		</select></td>
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