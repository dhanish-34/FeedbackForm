<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <%

	int x, t=0, flag=0;
    int rn=0;
	String sql;
	String Roll, str2, str3, password, str5, str6;
	String branch,year,section,sem;
	Roll=request.getParameter("tname");

	password=request.getParameter("passwd");
	branch=request.getParameter("branch");
	year=request.getParameter("year");
	sem=request.getParameter("sem");
	section=request.getParameter("section");
	if( Roll != null || password != null|| sem != null|| section != null|| year != null|| branch != null)
	{	
		System.out.println("In====================");
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		sql = "select * from student";
		ResultSet rs=s.executeQuery(sql);
		while(rs.next())
		{
			rn = rs.getInt("roll");
			
			str5=rs.getString("passwd");
				
			if(Roll.equals(Integer.toString(rn)))
			{
				out.println("student roll number you entered is already present");
				flag=1;
				break;
			}
		}
		if(flag==0)
		{
			sql = "insert into student values ("+Integer.parseInt(Roll)+",'"+password+"','"+branch+"','"+year+ "','"+sem+ "','"+section +"')";
			//insert into tab_nm values(1,'123','1');
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
	/* var name=document.removeteacher.tname.value;
	var pass=document.removeteacher.passwd.value;
	
	if(name=="" || pass=="")
	{
		alert("First Details must be filled");
		return false;
	} */
}
</script>
</head>
<body>
<body bgcolor="grey">
<form name="addteacher" onsubmit="return fun()" >
<center>
<img src="skcet.png" width="780" height="151" alt="logo"><br><br>
<font color=Black><MARQUEE WIDTH=100% BEHAVIOR=ALTERNATE BGColor=white><u><b>ADD NEW STUDENT</b></u></MARQUEE></font><br><br>
<br><br>
<table width="50%" border="0" align="center" cellpadding="5" cellspacing="5" > 
<tr>
<th align=left>Roll No :</th><td align=left><input type=text name=tname size="30" required placeholder="roll number"></td>
</tr>
<tr>
<tr>
<th align=left>Department :</th><td align=left><select name="branch" size="1" required>
		<option value="">select department
		<option value="CSE">Computers
		<option value="MECH">Mechanical
		<option value="IT">Information Technology
		<option value="EEE">Electrical and Electronics
		<option value="ECE">Electrical & Communication
		<option value="FT">Fashion Technology
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
	<th align=left>Password :</th>
	<td align=left><input name="passwd" type=password size="20" required  ></>
		</select><br></td>
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