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
<link rel="stylesheet" href="/css/viewPost.css"/>
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Insert title here</title>
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


	<h2> Check out your post! </h2>

	
	<div class="card text-center" style="width: 18rem;">
		<div class="card-body">
			<h5 class="card-title"><c:out value="${onePost.postTitle}"/></h5>
			<p class="card-text"> <c:out value="${onePost.thoughts}"/> </p>
			<a href="/profile" class="btn btn-primary">Go back</a>
		</div>
	</div>

</body>
</html>