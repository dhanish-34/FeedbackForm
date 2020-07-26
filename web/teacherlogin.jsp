<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
String str, str1, name, password;
String t2=new String();
String t=request.getParameter("t");
if(t.equals("2"))
{
	name=request.getParameter("Name");
	password=request.getParameter("PASSWORD");
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
	
	Statement s =c.createStatement();
	String sql = "select * from teacher";
	ResultSet rs=s.executeQuery(sql);
	while(rs.next())
	{
		str=rs.getString("uname");	
		str1=rs.getString("passwd");
		if(name.compareTo(str)==0 && password.compareTo(str1)==0)
		{
			response.sendRedirect("teacherhome.jsp?username="+name);
		}
		else
		{
			t2="User Name and password incorrect";		
		}
	}
}
%>