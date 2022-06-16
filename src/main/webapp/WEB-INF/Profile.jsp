<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isErrorPage="true"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/navbar.css"/>
<link rel="stylesheet" href="/css/profile.css"/>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Profile</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light" class="navbar">
	<div class="container-fluid" class="container" >
    	<a class="navbar-brand" href="#">AnimeWorld</a>
    	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      		<span class="navbar-toggler-icon"></span>
    	</button>
    	<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      		<div class="navbar-nav" class="navigation">
      			<a class="nav-link active" href="/dashboard">Home</a>
        		<a class="nav-link active" aria-current="page" href="/create/post">Create a Post!</a>
        		<c:if test="${user.id==1}">
        			<a class="nav-link active" href="/show">Create a Show</a>
        		</c:if>
        		<a class="nav-link active" href="/profile">Profile</a>
         		<a class="nav-link active" href="/logout">Logout</a>
      		</div>
    	</div>
  	</div>
</nav>
<h1> Welcome to AnimeWorld, <c:out value="${user.userName}"/>!</h1>

<h2> Your information </h2>

<div class="userTable">
	<div>
		<table>
			<thead>
				<tr>  
			    	<th>First Name</th>
			    	<th>Last Name</th>
			      	<th>Username</th>
			      	<th>Email</th>
			    </tr>
			</thead>
			<tbody>
				<tr>
			    	<td><c:out value="${user.firstName }"/></td>
			      	<td><c:out value="${user.lastName }"/> </td>
			      	<td> <c:out value="${user.userName }"/> </td>
			      	<td> <c:out value="${user.email }"/></td>
			    </tr>
			</tbody>
		</table>	
	</div>
</div>

<div class="postTable">		
	<table>
		<thead>
	    	<tr>
	    		<th>Post Title</th>
	    		<th>Anime</th>
	    		<th>Actions</th>
	  		</tr>
	  	</thead>
	  	<tbody>
	  		<c:forEach var="show" items="${shows}">
			<c:if test="${show.posts.size()>0}">
			<c:forEach var="p" items="${show.posts }"> 
			<c:if test="${p.user.id == sessionScope.userId}">
		    	<tr>
		      		<td>
		      			<a href="/posts/${p.id}">
							<c:out value="${p.postTitle}"></c:out> 
						</a>
		      		</td>
		      		<td>
		      			<c:out value="${show.showTitle}"></c:out>
		      		</td>
					<td>
						<a href="/post/edit/${p.id}"> Edit </a> 
						<a href="/delete/${p.id}"> Delete </a>
					</td>
		    	</tr>
	  		</c:if>
			</c:forEach>	
			</c:if>
			</c:forEach>
		</tbody>
	</table>
</div>		
		
	
		
		
	
</body>
</html>