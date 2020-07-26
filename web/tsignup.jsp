<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <%
        
        String t2="";
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
                                t2="Teacher name you entered is already present";
				flag=1;
				break;
			}else if(str3.equals(str5))
			{
				t2="User name you entered is already present please select diferent user name";
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
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Login V18</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="signupcss.css">
	<link rel="stylesheet" type="text/css" href="signupcss.css">
<!--===============================================================================================-->
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
<body style="background-color: #666666;">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" name="addteacher" onsubmit="return fun()">
					<span class="login100-form-title p-b-43">
						Sign up to continue
					</span>
                                        <div class="form-group">
                                            <label style="font-family:'Poppins', sans-serif">Name</label>
                                                <input name="tname" class="form-control" placeholder="" value="" type=text>
                                        </div>
                                    <div class="form-group">
                                            <label style="font-family:'Poppins', sans-serif">Username</label>
                                                <input name="username" class="form-control" placeholder="" value="" type=text>
                                        </div>
                                    <div class="form-group">
                                            <label style="font-family:'Poppins', sans-serif">Password</label>
                                                <input name="passwd" class="form-control" placeholder="" value="" type=password>
                                        </div>
                                    <div class="form-group">
                                            <label style="font-family:'Poppins', sans-serif">Confirm Password</label>
                                                <input name="cpasswd" class="form-control" placeholder="" value="" type=password>
                                        </div>
                                    
                                    
                                        <div class="wrap" style="font-family: 'Poppins', sans-serif">
                                        <select class="btn btn-md dropdown-toggle" name="dname" size="1" >
                                            <option value="">Select Department
                                            <option value="CSE">Computers 
                                            <option value="MECH">Mechanical
                                            <option value="IT">Information Technology
                                            <option value="EEE">Electrical and Electronics
                                            <option value="ECE">Electrical & Communication
                                            <option value="FT">Fashion Technology
                                        </select>
                                        </div>
					
			
                                    <br>
                                    
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							SIGN UP
						</button>
					</div>
                                    <br>
                                    <div class="alertname">
                                        <h4 style="color: red"><%=t2 %></h4>
                                    </div>
                                        

					
				</form>
                            
				<div class="login100-more" style="background-image: url('tsignup.jpg');">
				</div>
			</div>
		</div>
	</div>
	
	

	
	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<footer class="page-footer pt-4 fixed-bottom" style="font-family: 'Red Rose', cursive">
    <div class="footer-copyright text-center py-4" style="color: ">2020 Copyright: Dhanish Ahmed
            </div>
        </footer>
</body>
</html>