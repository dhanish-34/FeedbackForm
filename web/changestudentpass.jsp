 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <%
try{
        String t2="success";
	String str,str1,str2,str3,str4,str5,sql;
	int flag=0, flag1=0;
	str1=request.getParameter("Name");
	str2=request.getParameter("passwd");
	str3=request.getParameter("passwd2");
	str4=request.getParameter("passwd1");
	System.out.println( "1: "+str1+" 2: "+str2 +" p1: "+str3+" p2: "+str4);
	System.out.println(str3.equals(str4));
	if(str3.equals(str4))
	{
		Class.forName("org.apache.derby.jdbc.ClientDriver");
		Connection c=DriverManager.getConnection("jdbc:derby://localhost:1527/OnlineForm","root","root");
		Statement s =c.createStatement();
		sql = "select * from student";
		ResultSet rs=s.executeQuery(sql);
		while(rs.next())
		{
			str=rs.getString("roll");	
			str5=rs.getString("passwd");
			System.out.println("0: "+str+" 1: "+str1+" 2: "+str2+" 5: "+str5);
			if(str1.compareTo(str)==0)
			{
				flag=1;
				if(str2.compareTo(str5)==0)
				{
					flag1=1;
				}
				break;
			}
		}
		if(flag==1 && flag1==1)
		{
			sql = "update student set passwd='"+str3+"' where roll="+str1;
			System.out.println(sql);
			s.execute(sql);
			response.sendRedirect("studenthome.jsp?username="+str1);
		}
		else if(flag==0)
		{
			t2="No Entry Found For This Roll number";
		}
		else if(flag1==0)
		{
			t2="Roll no and password didnot match";
		}
	}
	else
	{
		t2="New Password Doesn't Match With Confirmation password";
	}
}catch(Exception e ){}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Change Teacher Pass</title>
<script language="javascript" >
function fun3()
{
	var name=document.changepasst.Name.value;
	var pass=document.changepasst.passwd.value;
	var pass2=document.changepasst.passwd2.value;
	var pass1=document.changepasst.passwd1.value;
	if(name =="" || pass == "" || pass1 == "" || pass2 == "")
	{
			alert("Enter the Details First");
			document.changepasst.Name.focus();
			return false;
	}
}

</script>
 
<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,500');
        body{
            background-size: cover;
        }
        .container
        {
            top:100px;
            left:20px;
            padding-left: 65px;
        }
        </style>
</head>
<body style="background-image: url(bg-04.jpg)">
        <div class="jumbotron-fluid">
            <center>
                <img src="logo.jpg">
            </center>
        </div>
    <br><br>
    <div class="container">
            <form name="changepasst" onsubmit="return fun3()">
                <table width="50%" border="0" align="center" cellpadding="5" cellspacing="5"> 
                    <tr>
                        <th align=left>ROLL NO :</th><td align=left><input class="form-control" type=text name=Name size=30></td>
                    </tr>
                    <tr>
                        <th align=left>Old Password :</th><td align=left><input class="form-control" type=password name=passwd size=30></td>
                    </tr>
                    <tr>
                        <th align=left>Password :</th><td align=left><input class="form-control" type=password name=passwd2 size=30></td>
                    </tr>
                    <tr>
                        <th align=left>Confirm Password :</th><td align=left><input class="form-control" type=password name=passwd1 size=30></td>
                    </tr>
                    <tr>
                        <th colspan=0 align=right><button type="reset" value="RESET" class="btn btn-primary btn-block"> RESET  </button></th>
                        <th colspan=0 align=left><button type="submit" value="SUBMIT" class="btn btn-primary btn-block"> SUBMIT  </button></th>
                    </tr>
                    <tr>
                    
                    </tr>
                </table>
            </form>
        </div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<footer class="page-footer pt-4 fixed-bottom" style="font-family: 'Red Rose', cursive">
    <div class="footer-copyright text-center py-3" style="color: ">2020 Copyright: Dhanish Ahmed
            </div>
        </footer>
</body>
</html>