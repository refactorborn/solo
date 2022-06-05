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
<link rel="stylesheet" href="/css/main.css"/>
<title>Login and Registration</title>
</head>
<body>

	<h1> Welcome to Anime World!</h1>

<form:form action="/register" method="post" modelAttribute="newUser">
	<h2> Register a user</h2>
  <div class="form-group">
    <form:label for="firstName" path="firstName"> First Name:</form:label>
    <form:input type="text" path="firstName" class="form-control"  aria-describedby="firstName"/>
    <form:errors path="firstName"/>
  </div>
  <div class="form-group">
    <form:label path="lastName" for="lastName">Last Name:</form:label>
    <form:input type="text" path="lastName" class="form-control" id="lastName"/>
    <form:errors path="lastName"/>
  </div>
  <div class="form-group">
    <form:label path="userName" for="userName">Enter an Username:</form:label>
    <form:input type="text" path="userName" class="form-control" id="userName"/>
    <form:errors path="userName"/>
  </div>
  <div class="form-group">
    <form:label path="email" for="email">Enter an Email:</form:label>
    <form:input type="text" path="email" class="form-control" id="email"/>
    <form:errors path="email"/>
  </div>
  <div class="form-group">
    <form:label path="password" for="password">Enter a Password:</form:label>
    <form:input type="password" path="password" class="form-control" id="password"/>
    <form:errors path="password"/>
  </div>
  <div class="form-group">
    <form:label path="confirm" for="confirm">Confirm Password:</form:label>
    <form:input type="password" path="confirm" class="form-control" id="confirm"/>
    <form:errors path="confirm"/>
  </div>

  <button type="submit" class="btn btn-primary"> Register a User!</button>
</form:form>


<form:form action="/login" method="post" modelAttribute="newLogin">

	<h2> Login to your account! </h2>		
	
  <div class="form-group">
    <form:label for="email" path="email"> Email: </form:label>
    <form:input type="text" path="email" class="form-control"  aria-describedby="email"/>
    <form:errors path="email"/>
  </div>
  <div class="form-group">
    <form:label path="password" for="password">Password:</form:label>
    <form:input type="text" path="password" class="form-control" id="password"/>
    <form:errors path="password"/>
  </div>

  <button type="submit" class="btn btn-primary"> Login</button>
</form:form>
	

</body>
</html>