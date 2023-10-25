<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="sat, 01 Dec 2001 00:00:00 GMT">
<title>EmpApp | home</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<div role="navigation">
<div class="navbar navbar-inverse">
<a class="${mode=='MODE_HOME'?'active':''}" href="/home"
class="navbar-brand">EmpApp</a>
<div class="navbar-collapse collapse">
<ul class="nav navbar-nav">
<li class="${mode=='MODE_LOGIN'?'active':''}"><a
href="/login">Login</a></li>
<li class="${mode=='MODE_REGISTER'?'active':''}"><a
href="/register">New Registration</a></li>
<li class="${mode=='ALL_USERS'?'active':''}"><a
href="/show-users">All Users</a></li>
<li
class="${mode=='MODE_ATTENDANCE'?'active':''}"><a href="/mark-attendance">Mark
Attendance</a></li>
</ul>
</div>
</div>
</div>
<c:choose>
<c:when test="${mode=='MODE_HOME' }">
<div class="container" id="homediv">
<div class="jumbotron text-center">
<h1>Welcome to Employee Management System Webapp!!!</h1>
<h3>This app is designed for easy maintainence of employee data</h3>
</div>
</div>
</c:when>
<c:when test="${mode=='MODE_REGISTER' }">
<div class="container text-center">
<h3>New Registration</h3>
<hr>
<form class="form-horizontal" method="POST"
action="save-user" enctype="multipart/form-data">
<div class="form-group">
<label class="control-label col-md-3">Id</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="id"
value="${user.id }" />
</div>
</div>
<div class="form-group">
<label class="control-label
col-md-3">Username</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="username"
value="${user.username }" />
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3">First
Name</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="fname"
value="${user.fname }" />
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3">Last
Name</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="lname"
value="${user.lname }" />
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3">Age </label>
<div class="col-md-3">
<input type="text" class="form-control"
name="age"
value="${user.age }" />
</div>
</div>
<div class="form-group">
<label class="control-label
col-md-3">Password</label>
<div class="col-md-7">
<input type="password"
class="form-control" name="password"
value="${user.password }" />
</div>
</div>
<div class="form-group">
<label class="control-label
col-md-3">Department</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="dept"
value="${user.dept }" />
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3">Resume</label>
<div class="col-md-7">
<input type="file" class="form-control"
name="resume" />
</div>
</div>
<div class="form-group ">
<input type="submit" class="btn btn-primary"
value="Register" />
</div>
</form>
</div>
</c:when>
<c:when test="${mode=='ALL_USERS' }">
<div class="container text-center" id="tasksDiv">
<h3>All Users</h3>
<hr>
<div class="table-responsive">
<table class="table table-striped table-bordered">
<thead>
<tr>
<th>Id</th>
<th>UserName</th>
<th>First Name</th>
<th>Last Name</th>
<th>Age</th>
<th>Department</th>
<th>Resume</th>
<th>Attendance</th>
<th>Delete</th>
<th>Edit</th>
</tr>
</thead>
<tbody>
<c:forEach var="user" items="${users }">
<tr>
<td>${user.id}</td>
<td>${user.username}</td>
<td>${user.fname}</td>
<td>${user.lname}</td>
<td>${user.age}</td>
<td>${user.dept}</td>
<td>
<c:if test="${not empty
user.resumeFileName}">
<a
href="/download-resume?filename=${user.resumeFileName}">Download</a>
</c:if>
</td>
<td>${user.attendance}</td>
<td><a
href="/delete-user?id=${user.id }"><span
class="glyphicon glyphicon-trash"></span></a></td>
<td><a
href="/edit-user?id=${user.id }"><span
class="glyphicon glyphicon-pencil"></span></a></td>
</tr>
</c:forEach>
</tbody>
</table>
</div>
</div>
</c:when>
<c:when test="${mode=='MODE_UPDATE' }">
<div class="container text-center">
<h3>New Registration</h3>
<hr>
<form class="form-horizontal" method="POST"
action="save-user" enctype="multipart/form-data">
<div class="form-group">
<label class="control-label col-md-3">Id</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="id"
value="${user.id }" />
</div>
</div>
<div class="form-group">
<label class="control-label
col-md-3">Username</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="username"
value="${user.username }" />
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3">First
Name</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="fname"
value="${user.fname }" />
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3">Last
Name</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="lname"
value="${user.lname }" />
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3">Age </label>
<div class="col-md-3">
<input type="text" class="form-control"
name="age"
value="${user.age }" />
</div>
</div>
<div class="form-group">
<label class="control-label
col-md-3">Password</label>
<div class="col-md-7">
<input type="password"
class="form-control" name="password"
value="${user.password }" />
</div>
</div>
<div class="form-group">
<label class="control-label
col-md-3">Department</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="dept"
value="${user.dept }" />
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3">Resume</label>
<div class="col-md-7">
<input type="file" class="form-control"
name="resume" value="${user.resume }" />
</div>
</div>
<div class="form-group ">
<input type="submit" class="btn btn-primary"
value="Register" />
</div>
</form>
</div>
</c:when>
<c:when test="${mode=='MODE_LOGIN'}">
<p>Login page</p>
<div class="container text-center">
<h3>User Login</h3>
<hr>
<form class="form-horizontal" method="GET"
action="/signInServlet">
<c:if test="${not empty error }">
<div class= "alert alert-danger">
<c:out value="${error }"></c:out>
</div>
</c:if>
<div class="form-group">
<label class="control-label
col-md-3">Username</label>
<div class="col-md-7">
<input type="text" class="form-control"
name="username"
value="${user.username }" />
</div>
</div>
<div class="form-group">
<label class="control-label
col-md-3">Password</label>
<div class="col-md-7">
<input type="password"
class="form-control" name="password"
value="${user.password }" />
</div>
</div>
<div class="form-group ">
<input type="submit" class="btn btn-primary"
value="Login" />
</div>
</form>
</div>
</c:when>
<c:when test="${mode=='MODE_ATTENDANCE' }">
<div class="container text-center">
<h3>Mark Attendance</h3>
<hr>
<form class="form-horizontal" method="POST" action="mark-attendance">
<div class="form-group">
<label class="control-label col-md-3">Employee ID</label>
<div class="col-md-7">
<input type="text" class="form-control" name="id" />
</div>
</div>
<div class="form-group">
<label class="control-label col-md-3">Attendance</label>
<div class="col-md-7">
<select class="form-control" name="attendance">
<option value="Present">Present</option>
<option value="Absent">Absent</option>
</select>
</div>
</div>
<div class="form-group">
<input type="submit" class="btn btn-primary" value="Mark Attendance" />
</div>
</form>
</div>
</c:when>
</c:choose>
</body>
</html>