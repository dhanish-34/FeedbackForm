<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
 <%
String name;
name=request.getParameter("name");
request.setAttribute("name",name);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>STUDENT FEEDBACK</title>
<link
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
	rel="stylesheet" type="text/css" />
<link href="jquery.comiseo.daterangepicker.css" rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.5/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"></script>
<script>
$(document).ready(function() {	
		$("#tname").change(function() {
			$.ajax({
				type : 'GET',
				url : 'giveFeedback/getSubject',
				data : {
					sid : <%=name%>,
					tid : document.getElementById('tname').value,
					year : document.getElementById('year').value,
					section : document.getElementById('section').value,
					branch : document.getElementById('dname').value,
					sem : document.getElementById('sem').value
				},
				success : function(result) {
					$("#sub").html(result)
				}
			});
		});
			$.ajax({
				type : 'GET',
				url : 'giveFeedback/getDepartment',
				data : {
					id : <%=name%>
				},
				success : function(result) {
					$("#dname").html(result)
				}
			});
			$.ajax({
				type : 'GET',
				url : 'giveFeedback/getYear',
				data : {
					id : <%=name%>
				},
				success : function(result) {
					$("#year").html(result)
				}
			});
			$.ajax({
				type : 'GET',
				url : 'giveFeedback/getSection',
				data : {
					id : <%=name%>
				},
				success : function(result) {
					$("#section").html(result)
				}
			});
			$.ajax({
				type : 'GET',
				url : 'giveFeedback/getSem',
				data : {
					id : <%=name%>
				},
				success : function(result) {
					$("#sem").html(result)
				}
			});
			$.ajax({
				type : 'GET',
				url : 'giveFeedback/getTeacher',
				data : {
					id : <%=name%>
				},
				success : function(result) {
					$("#tname").html(result)
				}
			});
			
		});
		/* function sub(){
				alert("in getsub");
			
			}); */

		//}
		</script>
		<!-- <script>
		$(document).ready();
</script> -->
<script language="javascript" >
function fun3()
{
	var dname=document.studentfeedback.dname.value;
	var tname=document.studentfeedback.tname.value;
	var year=document.studentfeedback.year.value;
	var sam=document.studentfeedback.sam.value;
	var sub=document.studentfeedback.sub.value;
	if(dname=="")
	{
		alert("First Department name must be filled");
		return false;
	}
	if(tname=="")
	{
		alert("First Teacher name must be filled");
		return false;
	}
	if(year=="")
	{
		alert("First year must be filled");
		return false;
	}
	if(sam=="")
	{
		alert("First sam must be filled");
		return false;
	}
	if(sub=="")
	{
		alert("First sub must be filled");
		return false;
	}
}
</script>
                <style>
                    .inner{
                        max-width: 1100px;
                        position: relative;
                        display: block;
                        top: 50%;
                        left: 10%;
                        background: rgba(255,255,255,0.7);
                        padding: 30px;
                    }
                </style>
</head>
    <body style="background: url(bg-02.jpg)">
        <form name="studentfeedback" action ="StudentFeedBack?name=<%=name%>" onsubmit="return fun3()" method="post">
            <div class="jumbotron-fluid">
                <center>
                    <img src="logo.jpg">
                </center>
            </div>
            <br>
        <div class="inner"> 
            <center><h2 style="font-family:Arial">STUDENT FEEDBACK</h2></center>
        <br>
<table border="0" cellspacing="0" cellpadding=10 >
<tr>
	<th colspan=2 align=left>Department :</th>
	<th colspan=2 align=left>
            <div class="btn-group">
            <select class="btn btn-secondary btn-sm dropdown-toggle" name="dname" id="dname" size="1" >
		<option value=''>Select</option>
            </select></div></th>
</tr>

<tr>
	<th colspan=2 align=left>Year :</th>
	<th colspan=2 align=left>
            <div class="btn-group">
            <select class="btn btn-secondary btn-sm dropdown-toggle" name="year" id="year" size="1">
		<option value=''>Select</option>
            </select></div></th>
</tr>
<tr>
	<th colspan=2 align=left>Semester :</th>
	<th colspan=2 align=left><select class="btn btn-secondary btn-sm dropdown-toggle" name="sem" id="sem" size="1">
		<option value=''>Select</option>
		</select></th>
</tr>
<tr>
	<th colspan=2 align=left>Section :</th>
	<th colspan=2 align=left><select class="btn btn-secondary btn-sm dropdown-toggle" name="section" id="section" size="1">
		<option value=''>---Select Section---</option>
		</select></th>
</tr>
<tr>
	<th colspan=2 align=left>Name of teacher :</th>
	<th colspan=2 align=left><select class="btn btn-secondary btn-sm dropdown-toggle" name="tname" id="tname" size="1">
		<option value=''>---Select Professor---</option>
		</select></th>
</tr>
<tr>
	<th colspan=2 align=left>Subject :</th>
	<th colspan=2 align=left><select class="btn btn-secondary btn-sm dropdown-toggle"name="sub" id="sub" size="1">
		<option value=''>---Select Subject---</option>
		</select></th>
</tr>
</table>
        <br>
        <label><h3><b>Indicate the perceived performance of the teacher by selecting only one only one of the four radio buttons.</b></h3></label>
<br><br>
<label><b>A. Communication skills (i.e. Teacher's ability to communicate the subject clearly and audibly)</b><br></label>

        <div class="radio">
            <label><input type="radio" name="A" value="1">Excellent</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="A" value="2">Good</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="A" value="3">Average</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="A" value="4">Poor</label>
        </div>
        <br>
        <label><b>B. Ability to explain subject matter and clear doubts</b><br></label>

        <div class="radio">
            <label><input type="radio" name="B" value="1">Excellent</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="B" value="2">Good</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="B" value="3">Average</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="B" value="4">Poor</label>
        </div>
        <br>
        <label><b>C. Presentation (viz. the Blackboard/Power point/OHP whichever used while teaching) is clear, organised and easily readable.</b><br></label>
        <div class="radio">
            <label><input type="radio" name="C" value="1">Excellent</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="C" value="2">Good</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="C" value="3">Average</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="C" value="4">Poor</label>
        </div>
        <br>
        <label><b>D. Teaching Methodology (i.e. teaching pace, examples and illustrations used and handling of topics)</b><br></label>
        <div class="radio">
            <label><input type="radio" name="D" value="1">Excellent</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="D" value="2">Good</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="D" value="3">Average</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="D" value="4">Poor</label>
        </div>
        <br>
        <label><b>E. Overall Interest created in the subject</b><br></label>
        <div class="radio">
            <label><input type="radio" name="E" value="1">Excellent</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="E" value="2">Good</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="E" value="3">Average</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="E" value="4">Poor</label>
        </div>
        <br>
        <label><b>F. Regular and Punctual in conducting classes</b><br></label>
        <div class="radio">
            <label><input type="radio" name="F" value="1">Excellent</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="F" value="2">Good</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="F" value="3">Average</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="F" value="4">Poor</label>
        </div>
        <br>
        <label><b>G. Firm and Maintains class Discipline</b><br></label>
        <div class="radio">
            <label><input type="radio" name="G" value="1">Excellent</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="G" value="2">Good</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="G" value="3">Average</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="G" value="4">Poor</label>
        </div>
        <br>
        <label><b>H. Attitude towards student (i.e. with regards being approachable, providing guidance, advice and counseling)</b><br></label>
        <div class="radio">
            <label><input type="radio" name="H" value="1">Excellent</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="H" value="2">Good</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="H" value="3">Average</label>
        </div>
        <div class="radio">
            <label><input type="radio" name="H" value="4">Poor</label>
        </div>
        <br>
        <div class="row">
            <div class="col-sm">
                <div class="form-group">
                    <button type="reset" value="RESET" class="btn btn-primary btn-block"> RESET  </button>
                </div>
            </div>
            <div class="col-sm">
                <div class="form-group">
                    <button type="submit" value="SUBMIT" class="btn btn-primary btn-block"> SUBMIT  </button>
                </div><!--input type="reset" value="RESET"-->
	<!--input type="SUBMIT" value=SUBMIT></td-->
            </div>
        </div>
</form>
 </div>
            <!--script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" ></script-->
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
            <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" ></script>
            <footer class="page-footer font-white pt-4">
            <div class="footer-copyright text-center py-3" style="color: white"> 2020 Copyright: Dhanish Ahmed
        </div>
        </footer>
</body>
</html>