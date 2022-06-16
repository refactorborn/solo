<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">

	<title> Registration </title>
	<link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css">
	<link rel="stylesheet" type="text/css" href="/css/index.css">
</head>
<body class="my-login-page">
	<section class="h-100">
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
			<h1> Welcome back to AnimeWorld! </h1>
				<div class="card-wrapper">
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Register</h4>
							<form:form action="/register" method="post" modelAttribute="newUser">
							 
								<div class="form-group">
									<form:label for="firstName" path="firstName"> First Name:</form:label>
									<form:input id="firstName" path="firstName" type="text" class="form-control" name="firstName"/>
									<form:errors path="firstName"/>
								</div>
								<div class="form-group">
  									<form:label path="lastName" for="lastName">Last Name:</form:label>
		 		   				    <form:input type="text" path="lastName" class="form-control" id="lastName"/>
    							    <form:errors path="lastName"/>
								</div>
								<div class="form-group">
    								<form:label path="userName" for="userName">Enter a Username:</form:label>
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
								<div class="form-group">
									<label>
										<input type="checkbox" name="agree" value="1"> I agree to the Terms and Conditions
									</label>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										Register
									</button>
								</div>
								<div class="margin-top20 text-center">
									Already have an account? <a href="/">Login</a>
								</div>
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

	<script src="js/jquery.min.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
	<script src="js/my-login.js"></script>
</body>
</html>