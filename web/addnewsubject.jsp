<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  import = "java.sql.*"%>
    <%

	int x, t=0, flag=0;
    int rn=0;
	String sql;
	String sub, subq, branchq;
	String branch;
	sub=request.getParameter("sub");
	branch=request.getParameter("branch");
	if( sub != null || branch != null)
	{	
		System.out.println("In====================");
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		sql = "select sub from subject where branch='"+branch+"'";
		ResultSet rs=s.executeQuery(sql);
		while(rs.next())
		{
			subq = rs.getString("sub");
			
			
				
			if(sub.equals(subq))
			{
				out.println("student roll number you entered is already present");
				flag=1;
				break;
			}
		}
		if(flag==0)
		{
			sql = "insert into subject values ('"+branch+"','"+sub+"')";
			//insert into tab_nm values(1,'123','1');
                        //test
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
<body bgcolor="grey">
<form name="addsubject" onsubmit="return fun()" >
<center>
<img src="skcet.png" width="780" height="151" alt="logo"><br><br>
<font color=Black><MARQUEE WIDTH=100% BEHAVIOR=ALTERNATE BGColor=white><u><b>ADD NEW SUBJECT</b></u></MARQUEE></font><br><br>
<br><br>
<table width="50%" border="0" align="center" cellpadding="5" cellspacing="5" > 

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
<th align=left>Subject :</th><td align=left><input type=text name=sub size="30" required placeholder="Subject"></td>
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