<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
    
<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <title>Hello, world!</title>
  </head>
  <body>
    <main class="container">
    
    	<div class="row">
    		<div class="col">
    			<c:if test="${not empty message }">
    				<div class="alert alert-success">${message}</div>
    			</c:if>
    			
    			<c:if test="${not empty error }">
    				<div class="alert alert-danger">${error}</div>
    			</c:if>
    		</div>
    	</div>
    	
    	<div class="row">
    		<div class="col">
    			<form action="UserServlet" method="post">
    				<div class="form_group">
    					<label for="userId"> User ID </label>
    					<input type="text" name="userId" class="form-control" value="${user.userId }" />
    				</div> 
    				
    				<div class="from-group">
    					<label for="password"> Password</label>
    					<input type="password" class="form-control" name="password" id="password" />
    				</div>
    				
    				<div class="form-group">
    					<label for="fullname"> Fullname</label>
    					<input type="text" class="form-control" name="fullname" id="fullname" value="${user.fullname }" />
    					
    				</div>
    				
    				
    				<div class="form-group">
    					<label for="email"> Email</label>
    					<input type="text" class="form-control" name="email" id="email" value="${user.email }" />
    					
    				</div>
    				
    				<div class="form-check form-check-inline">
    					<label>Role: </label>
    					<label class="ml-2" > <input type="radio" class="form-check-input" id="admin" name="admin" value="true" ${ user.admin? 'checked':'' } />Admin</label>
    					<label class="ml-2" > <input type="radio" class="form-check-input" id="user" name="admin"  value="false"  ${! user.admin? 'checked':'' }/> User</label>
    				</div>
    				
    				<div class="form-group">
    					<button class="btn btn-primary " formaction="UserServlet/create">Create</button>
    					<button class="btn btn-warning " formaction="UserServlet/update">Update</button>
    					<button class="btn btn-danger " formaction="UserServlet/delete">Delete</button>
    					<button class="btn btn-info " formaction="UserServlet/reset">Reset</button>
    				</div>
    				
    			
    				<div class= "row">
    					<div class="col">
    						<table class="table table-stripe">
    							<tr >
    								<td>User ID</td>
    								<td>Fullname</td>
    								<td>Password</td>
    								<td>Role</td>
    								<td>&nbsp;</td>
    							</tr>
    							<c:forEach var="item" items="${users }">
    							<tr>
    								<td>${item.userId}</td>
    								<td>${item.fullname}</td>
    								<td>${item.email}</td>
    								<td>${item.admin? 'Admin':'User' }</td>
    								<td>
    									<a href="UserServlet/edit?userId=${item.userId }">Edit</a>
    									<a href="UserServlet/delete?userId=${item.userId }">Delete</a>
    								</td>
    							</tr>
    							</c:forEach>
    							
    						</table>
    					</div>
    				</div>
    			
    			</form>
    		</div>
    	
    	
    	</div>
    
    </main>

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    
  </body>
</html>