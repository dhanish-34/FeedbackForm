<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
String name,roll;
name=request.getParameter("username");
roll=request.getParameter("name");
request.setAttribute("name",name);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,500');
        body{
            
            background-size: cover;
        }
        .container
        {
            padding-top: 10px;
            padding-left: 65px;
        }
        .card-img-top{
            padding: 15px 15px 15px 15px;
            width: 100%;
            height: 40vh;
            object-fit: cover;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Student Home</title>
</head>
<body style="background-image: url(bg-04.jpg)">
        <div class="jumbotron-fluid">
            <center>
                <img src="logo.jpg">
            </center>
        </div>
    <div class="row" align="center">
        <div class="container" style="font-family: 'Montserrat', sans-serif;">
            <h4>
            Hello! <%=roll%>
        </h4>
    </div>
    </div>
    <div class="container">
        <div class="display-10 text-sm-center m-y-3">
    <div class="row">
        <div class="col-md-6 col-lg-4">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="1.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Profile</h5>
                    <p class="card-text"></p>
                    <a href="#" class="btn btn-primary">Click Here!</a>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-4">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="222.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Give Feedback</h5>
                    <p class="card-text"></p>
                    <a href="studentfeedback.jsp?name=<%=name%>" class="btn btn-primary">Click Here!</a>
                </div>
            </div>
        </div>
        <div class="col-md-6 col-lg-4">
            <div class="card" style="width: 18rem;">
                <img class="card-img-top" src="33.jpg" alt="Card image cap">
                <div class="card-body">
                    <h5 class="card-title">Change Password</h5>
                    <p class="card-text"></p>
                    <a href="changestudentpass.jsp" class="btn btn-primary">Click Here!</a>
                </div>
            </div>
        </div>
    </div>
    </div>
    </div>


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
<footer class="page-footer pt-4 fixed-bottom" style="font-family: 'Red Rose', cursive">
    <div class="footer-copyright text-center py-2" style="color: ">2020 Copyright: Dhanish Ahmed
            </div>
        </footer>
</body>
</html>