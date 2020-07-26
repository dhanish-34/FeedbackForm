<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*" import="feedback.dao.Classes"
import="feedback.dao.CommonFeedBackDao" import="java.io.PrintWriter" import="java.util.*"
import="feedback.entity.ClassValue"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String tname=null, dname=null, str;
tname = request.getParameter("name");
	System.out.println("Name got"+tname);
	 if(tname != null)
	{
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		String sql = "select * from teacher";
		ResultSet rs=s.executeQuery(sql);
		while(rs.next())
		{
			str=rs.getString("uname");
			if(tname.compareTo(str)==0)
			{
				dname=rs.getString("branch");
				
			}
		}
	}
 	System.out.println(tname+""+dname); 
	List<Classes> handlingClass;
	handlingClass = CommonFeedBackDao.getTeacherAllDetail(tname);
	List<ClassValue> drpdwn = new ArrayList<ClassValue>();
System.out.println("Total classes:" + handlingClass.size());
/* response.setContentType("text/html");
PrintWriter outwrit = response.getWriter();
outwrit.write("<option value=''>---Select department---</option>"); */
for(Classes cl: handlingClass){
	String value = cl.getBranch()+","+cl.getYear()+","+cl.getSem()+","+cl.getSec()+","+cl.getSub();
	String display =cl.getBranch()+" Deartment - "+cl.getYear()+"Year - "
	+cl.getSem()+"Semester - "+cl.getSec()+"Section - "+cl.getSub();
	ClassValue cv = new ClassValue();
	cv.setHandligClass(display);
	cv.setValue(value);
	drpdwn.add(cv);
	System.out.println(value+"====================="+display);
	/* outwrit.write("<option value='" + value + "'>" + display + "</option></c:forEach>"); */
} 
	%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>teacher report</title>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>

<script language="javascript" >
window.onload=function(){
	alert("hi");
	<%-- this.form.elements["sub"].value=<%=drpdwn%>;
	$("#sub").value=<%=drpdwn%>;--%>
};
function fun1()
{
	var sub=document.addteacher.sub.value;
	if(sub=="")
	{
		alert("First Details must be filled");
		return false;
	}
}
</script>
</head>
<body bgcolor="grey">
<form name="teachersub" action="teacherreport1?tname=<%=tname%>" onSubmit="return fun1()" method="post">
<center>
<img src="skcet.png" width="780" height="151" alt="logo">
<marquee bgcolor="white" behavior=alternate direction="right" width="100%">SELECT SUBJECT</marquee>
<br>
<br><br><br>

<table border="0" cellspacing="0" cellpadding=10 >
<tr>
	<th colspan=2 align=left>3. Subject :</th>
	<th colspan=2 align=left><select name="sub" id = "sub" size="1">
		<option value=''>---select Subject---</option>
				<c:forEach items='<%=drpdwn%>' var="i">
				<option value='${i.getValue()}'>${i.getHandligClass()}</option>
				</c:forEach>
		</select></th>
</tr>
<tr>
	<th colspan=2 align=center><input type="RESET" value=RESET></th>
	<th colspan=2 align=center><input type="SUBMIT" value=SUBMIT></th>
</tr>
</table>
</center>
</form>

</body>
</html>