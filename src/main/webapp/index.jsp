<%
  if (session.getAttribute("UserName") != null && !session.getAttribute("UserName").equals(""))
  {
	  response.sendRedirect("List.jsp");
  }
  %>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<%@include file="component/all_css.jsp"%>
<body>
	<%@include file="component/navbar.jsp"%>
	<div class="container">
   <div class="row p-5">
      <div class="col-md-6 offset-md-3">
      <div class="card">
      <div class="card-body">
      <h1 class="text-center text-success">Login</h1>
      
      
       <%
    String sucmsg=(String)session.getAttribute("sucmsg");
 if(sucmsg!=null){
	 %>
	   <div class="alert alert-success" role="alert"><%=sucmsg %>
</div>
	 <%
	 session.removeAttribute("sucmsg");
 }
 %>
 
 <%
    String failedmsg=(String)session.getAttribute("failedmsg");
 if(failedmsg!=null){
	 %>
	   <div class="alert alert-danger" role="alert"><%=sucmsg %>
</div>
	 <%
	 session.removeAttribute("failedmsg");
 }
 %>
      
      
      
           	<form action="index" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">User Name</label>
    <input type="text" class="form-control" id="username" aria-describedby="emailHelp" placeholder="Enter username" name="username">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="password" name="password" placeholder="Password">
  </div>
  <div class ="row">
      <div class ="col-md-3">
      <button type="submit" class="btn btn-primary">Login</button>
      </div>
      <div class ="col-md-3">
      <a href="register.jsp" class="btn btn-success">
    Register
  </a>
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