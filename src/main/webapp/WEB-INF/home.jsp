<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<script src="/webjars/jquery/jquery.min.js"></script>
<script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
<title>Anime World</title>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Anime World</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
      <div class="navbar-nav">
        <a class="nav-link active" aria-current="page" href="/create/post">Create a Post!</a>
        <c:if test="${user.id==1}">
        <a class="nav-link" href="/show">Create a Show</a>
        </c:if>
         <a class="nav-link" href="/profile">Profile</a>
         <a class="nav-link" href="/logout">Logout</a>
        
      </div>
    </div>
  </div>
</nav>
	<h2> Welcome to Anime World, <c:out value="${user.userName}"/>!</h2>
	<h1> Which anime would you like to see posts about?</h1>
	
<c:forEach var="show" items="${shows}">
<div class="d-flex justify-content-between">
	<div class="card" class="d-flex justify-content-between" style="width: 18rem;">
	<c:if test="${show.id ==1 }">
  	<img src="/images/431.jpg" class="card-img-top" alt="...">
	</c:if> 
	<c:if test="${show.id ==2 }">
  	<img src="/images/4269799.jpg" class="card-img-top" alt="...">
	</c:if>
	<c:if test="${show.id ==3 }">
  	<img src="/images/3415908.png" class="card-img-top" alt="...">
	</c:if>
	<c:if test="${show.id ==4 }">
	  <img src="/images/1206753.png" class="card-img-top" alt="...">
	</c:if>
	  <div class="card-body">
	    <h5 class="card-title"> 
	    	<a href='/shows/${show.id}'>
    			 <c:out value="${show.showTitle }"/> 
    		</a>
   	 </h5>

    	<p class="card-text"> <c:out value="${show.author }"/> </p>
    	<p class="card-text"> <c:out value="${show.description }"/> </p>
  	</div>

	</div >
</div>	
</c:forEach>


</body>
</html>