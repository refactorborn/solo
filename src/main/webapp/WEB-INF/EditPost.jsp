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
<link rel="stylesheet" href="/css/post.css"/>
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

<h1> Welcome to Anime World, <c:out value="${user.userName}"/>!</h1>
<h2> Did you want to change your post?</h2>

<body class="my-post-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
				<div class="card-wrapper">
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Post Time</h4>			
								<form:form action="/post/edited/${id}" method="post" modelAttribute="editPost">		
										<form:input type="hidden" value="${user.id}" path="user"/>
										<form:errors path="user"/>
										<form:input type="hidden" value="${show.id}" path="show"/>
										<form:errors path="show"/>
										
									<div class="form-group">
								    	<form:label for="postTitle" path="postTitle">Edit Post Title:</form:label>
								    	<form:input type="text" path="postTitle" class="form-control"  aria-describedby="postTitle"/>
								    	<form:errors path="postTitle"/>
								  	</div>		
									<div class="form-group">
								    	<form:label path="thoughts" for="thoughts">Edit your post thoughts:</form:label>
								    	<form:input type="text" path="thoughts" class="form-control" id="thoughts"/>
								    	<form:errors path="thoughts"/>
								  	</div>
								  	<button type="submit" class="btn btn-primary"> Edit your Post!</button>
								</form:form>
								</div>
					</div>
					<div class="footer">
						Copyright &copy; AnimeWorld 2022
					</div>
				</div>
			</div>
		</div>
	</section>
										
</body>
</html>