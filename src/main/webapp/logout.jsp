<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signed Out</title>
<%@include file="component/all_css.jsp"%>
</head>
<body>
<%@include file="component/navbar.jsp"%>
<div>
<h4 class="text-center text-success">You've successfully singed out.See you soon!</h4>
</div>


<div class="container">
  <div class="row">
    <form action="logout" method="post">
    <div class="col text-center">
      <button type="submit" class="btn btn-default text-primary">Back to login</button>
    </div>
    </form>
    
  </div>
</div>
</body>
</html>