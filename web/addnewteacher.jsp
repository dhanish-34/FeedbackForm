<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <%

	int x, t=0, flag=0;
    int rn=0;
	String sql,password,branch,year,sem,section,name,namereq;
	String str1, str2, str3, str4, str5, str6;
	str1=request.getParameter("tname");
	branch=request.getParameter("dname");
	str3=request.getParameter("username");

	password=request.getParameter("passwd");
	
	/* year=request.getParameter("year");
	sem=request.getParameter("sem");
	section=request.getParameter("section"); */
	if( str1 != null || str3 != null || password != null|| branch != null)
	{	
		System.out.println("In====================");
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		sql = "select * from teacher";
		ResultSet rs=s.executeQuery(sql);
		while(rs.next())
		{
			rn = rs.getInt("sno") +1;
			
			str5=rs.getString("uname");
			name=rs.getString("tname");
			str6=rs.getString("branch");	
			if(str1.equals(name)&& branch.equals(str6))
			{
				out.println("Teacher name you entered is already present");
				flag=1;
				break;
			}else if(str3.equals(str5))
			{
				out.println("User name you entered is already present please select diferent user name");
				flag=1;
				break;
			}
			
		}
		if(flag==0)
		{
			/*uname VARCHAR(100) NOT NULL,
   name VARCHAR(100),
   passwd VARCHAR(100),
   branch VARCHAR(100),*/
			System.out.println("In====================");
			sql = "insert into teacher (sno,uname,tname,passwd,branch) values ("+rn+",'"+str3+"','"+str1+"','"+password+"','"+branch+"')";
			System.out.println(sql);
			s.execute(sql);
			%><jsp:forward page="adminhome.html"/> <%
		}
	}	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add New Teacher</title>
<script language="javascript" >
function fun()
{
	var name=document.removeteacher.tname.value;
	var dname=document.removeteacher.dname.value;
	var uname=document.removeteacher.username.value;
	var pass=document.removeteacher.passwd.value;
	if(name=="" || dname=="")
	{
		alert("First Details must be filled");
		return false;
	}
	if(uname=="" || pass=="")
	{
		alert("First Details must be filled");
		return false;
	}
}
</script>
</head>
<body>
<body bgcolor="grey">
<form name="addteacher" onsubmit="return fun()" >
<center>
<img src="skcet.png" width="780" height="151" alt="logo"><br><br>
<font color=Black><MARQUEE WIDTH=100% BEHAVIOR=ALTERNATE BGColor=white><u><b>ADD NEW TEACHER</b></u></MARQUEE></font><br><br>
<br><br>
<table width="50%" border="0" align="center" cellpadding="5" cellspacing="5"> 
<tr>
<th align=left>Enter Name :</th><td align=left><input type=text name=tname size="30" required placeholder="NAME"></td>
</tr>
<tr>
<tr>
<th align=left>Enter UserName :</th><td align=left><input type=text name=username size="20" required></td>
</tr>
<tr>
	<th align=left>Password :</th>
	<td align=left><input name="passwd" type=password size="20" required placeholder="PASSWORD"><br></td>
</tr>
<tr>
<th align=left>Enter Branch :</th><td align=left><select name="dname" size="1">
		<option value="">select department
		<option value="CSE">Computers 
		<option value="MECH">Mechanical
		<option value="IT">Information Technology
		<option value="EEE">Electrical and Electronics
		<option value="ECE">Electrical & Communication
		<option value="FT">Fashion Technology
		</select></td>
</tr>
<!-- <tr>
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
</tr> -->

<tr>
	<th colspan=0 align=right><input type="RESET" value=RESET></th>
	<th colspan=0 align=left><input type="SUBMIT" value=SUBMIT></th>
</tr>
</table>
</center>
</form>

</body>
</html>