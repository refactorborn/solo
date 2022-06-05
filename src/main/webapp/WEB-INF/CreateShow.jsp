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
<title>Show Creation</title>
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
        <a class="nav-link active" aria-current="page" href="/dashboard">Home</a>
        <a class="nav-link active" aria-current="page" href="/create/post">Create a Post!</a>
         <a class="nav-link" href="/profile">Profile</a>
         <a class="nav-link" href="/logout">Logout</a>
      </div>
    </div>
  </div>
</nav>
	<form:form action="/show/new" method="post" modelAttribute="newShow">
		<form:label path="showTitle"> Anime Title:</form:label>
		<form:errors path="showTitle"/>
		<form:input path="showTitle" type="text"/> 		
		
		<form:label path="author"> Author:</form:label>
		<form:errors path="author"/>
		<form:input path="author" type="text"/>
		
		<form:label path="description"> Description of Anime:</form:label>
		<form:errors path="description"/>
		<form:input path="description" type="text"/>
		
		<input type="submit" value="Create Show">
	</form:form>
</body>
</html>