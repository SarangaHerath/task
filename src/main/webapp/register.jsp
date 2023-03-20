<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script>
$(document).ready(function(){
	
  $("#confirmpassword").focusout(function(){
	  
	  var pass=$("#password").val();
	  var confpass=$("#confirmpassword").val();
	  if (pass != confpass)
	  {
		  
		  $("#buttonAlert").addClass('show');
	  } 
  });
  
  
  
});
</script>

<head>
<meta charset="ISO-8859-1">
<title>Register</title>
</head>

<%@include file="component/all_css.jsp"%>
<body>
	<%@include file="component/navbar.jsp"%>
	 <div class="alert alert-danger alert-dismissible fade" role="alert" id="buttonAlert">
          <strong>Mismatch confirm Password</strong> You just showed an alert.
          <button type="button" class="close" data-dismiss="alert" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
   </div>
	<div class="container">
   <div class="row p-5">
      <div class="col-md-6 offset-md-3">
      <div class="card">
      <div class="card-body">
      <h1 class="text-center text-success">Register</h1>
           	<form action="register" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">User Name</label>
    <input type="text" class="form-control" id="username" name="username" aria-describedby="emailHelp" placeholder="Enter username">
    <small id="emailHelp" class="form-text text-muted">.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password"  class="form-control" id="password" name="password"  placeholder="Password">
  </div>
  
  <div class="form-group">
    <label for="exampleInputPassword1">Confirm Password</label>
    <input type="password" class="form-control" id="confirmpassword" name="confirmpassword" placeholder="Comform Password">
  </div>
  <div class="form-group">
    <label for="exampleInputEmail1">Mobile Number</label>
    <input type="text" class="form-control" id="mobile" name="mobile" aria-describedby="emailHelp" placeholder="Enter Mobile Number">
    <small id="emailHelp" class="form-text text-muted">.</small>
  </div>
  <div class ="row">
      <div class ="col-md-3">
      <button type="submit" class="btn btn-success">Register</button>
      </div>
             
  </div>
  
</form>
      
      </div>
      </div>
      </div>
      </div>
      </div>
		
	


</body>
</html>