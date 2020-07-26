<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import = "java.sql.*"%>
    <%
        String t2="";
	int x, t=0, flag=0;
    int rn=0;
	String sql;
	String Roll, str2, str3, password, str5, str6,name;
	String branch,year,section,sem;
        name=request.getParameter("sname");
	Roll=request.getParameter("tname");
	password=request.getParameter("passwd");
	branch=request.getParameter("dname");
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
				t2="Student roll number you entered is already present";
				flag=1;
				break;
			}
		}
		if(flag==0)
		{
			sql = "insert into student values ("+Integer.parseInt(Roll)+",'"+password+"','"+branch+"','"+year+ "','"+sem+ "','"+section +"','"+name+"')";
			//insert into tab_nm values(1,'123','1');
			System.out.println(sql);
			s.execute(sql);
			response.sendRedirect("studenthome.jsp?username="+Roll+"&name="+name);
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
	
}
</script>
<style>
    .downtext{
        position: absolute;
        bottom: 0px;
        left:300px;
        font-weight: 500;
        font-family: 'Poppins', sans-serif;
    }
</style>
</head>
<body style="background-color: #666666;">
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form class="login100-form validate-form" name="addstudent" onsubmit="return fun()">
					<span class="login100-form-title p-b-43">
						Sign up to continue
					</span>
                                        <div class="form-group">
                                            <label style="font-family:'Poppins', sans-serif">Name</label>
                                                <input name="sname" class="form-control" placeholder="" value="" type=text>
                                        </div>
                                        <div class="form-group">
                                            <label style="font-family:'Poppins', sans-serif">Roll No</label>
                                                <input name="tname" class="form-control" placeholder="" value="" type=text>
                                        </div>
                                    <div class="form-group">
                                            <label style="font-family:'Poppins', sans-serif">Password</label>
                                                <input name="passwd" class="form-control" placeholder="" value="" type=password>
                                        </div>
                                    <!--div class="form-group">
                                            <label style="font-family:'Poppins', sans-serif">Confirm Password</label>
                                                <input name="cpasswd" class="form-control" placeholder="" value="" type=password>
                                        </div-->
                                    
                                    
                                        <div class="dropdown" style="font-family: 'Poppins', sans-serif">
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
                                    
                                    <div class="dropdown" style="font-family: 'Poppins', sans-serif">
                                        <select class="btn btn-md dropdown-toggle" name="year" size="1" >
                                            <option value="">Select Year
                                            <option value="1">I
                                            <option value="2">II
                                            <option value="2">III
                                            <option value="4">IV
                                        </select>
                                        </div>
                                    <br>
                                    
                                    <div class="dropdown" style="font-family: 'Poppins', sans-serif">
                                        <select class="btn btn-md dropdown-toggle" name="sem" size="1" >
                                            <option value="">Select Semester
                                            <option value="1">I
                                            <option value="2">II
                                        </select>
                                        </div>
                                    <br>
                                    
                                    <div class="dropdown" style="font-family: 'Poppins', sans-serif">
                                        <select class="btn btn-md dropdown-toggle" name="section" size="1" >
                                            <option value="">Select Section
                                            <option value="A">A
                                            <option value="B">B
                                            <option value="C">C
                                        </select>
                                        </div>
                                    <br>
                                    
					<div class="container-login100-form-btn">
						<button class="login100-form-btn">
							SIGN UP
						</button>
					</div><br>
                                  <div class="alertname">
                                        <h4 style="color: red"><%=t2 %></h4>
                                    </div>
                                    
                                        

					
				</form>
                            
				<div class="login100-more" style="background-image: url('bg-03.jpg');">
                                   
            <div class="downtext" style="color: tomato">2020 Copyright: Dhanish Ahmed
            </div>
        
				</div>
			</div>
		</div>
	</div>
	
	

	
	
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>

</body>
</html>