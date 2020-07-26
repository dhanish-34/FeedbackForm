<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
<%
String str, str1, name=null, password,dis="";
String t2=new String();
String t=request.getParameter("t");
if(t.equals("1"))
{
	name=request.getParameter("ROLLNO");
	password=request.getParameter("PASSWORD");
	Class.forName("org.apache.derby.jdbc.ClientDriver");
	Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
	Statement s =c.createStatement();
	String sql = "select roll,name from student where roll="+name+"and passwd='"+password+"'";
	ResultSet rs=s.executeQuery(sql);
        String res="home.html";
	while(rs.next())
	{
                
		str=rs.getString("roll");	
                dis=rs.getString("name");
		
                        res="studenthome.jsp?username="+name+"&name="+dis;
       //response.sendRedirect(res);
	}
        RequestDispatcher dd=request.getRequestDispatcher(res);
        
        
      
            dd.forward(request, response);
       
        response.getOutputStream().flush();
        response.getOutputStream().close();
}
%>
