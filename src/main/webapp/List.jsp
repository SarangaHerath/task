<%@page import="com.Entity.TodoDetls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.TodoDAO"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Todo-List</title>
<%@include file="component/all_css.jsp" %>
</head>
<body>
<%@include file="component/navbar.jsp" %>

 <h1 class="text-center text-success">TODO-APP</h1>
 
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
  <div class="container">
  <table class="table table-striped" border="1px">
  <thead class="bg-success text-white">
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Name</th>
      <th scope="col">ToDo</th>
      <th scope="col">Status</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>
  <%
  if (session.getAttribute("UserName") == null || session.getAttribute("UserName").equals(""))
  {
	  response.sendRedirect("index.jsp");
  }
      TodoDAO dao = new TodoDAO(DBConnect.getConn());
      List<TodoDetls> todo=dao.getTodo();
     for(TodoDetls t : todo){%>
     <tr>
      <th scope="row"><%=t.getId() %></th>
      <th scope="col"><%=t.getName() %></th>
      <td><%=t.getTodo() %></td>
      <td><%=t.getStatus() %></td>
      <td>
        <a href="edit.jsp?id=<%= t.getId()%>" class="btn btn-sm btn-success">Edit</a>
        
        <a href="delete?id=<%= t.getId()%>" class="btn btn-sm btn-danger">Delete</a>
      </td>
    </tr>
     	 
     <%}
  %>
    
   
  </tbody>
</table>
  </div>
</body>
</html>