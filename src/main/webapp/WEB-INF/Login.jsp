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
<link rel="stylesheet" href="/css/index.css"/>
<title>Login</title>
</head>
<body class="my-login-page">
	
	<section class="h-100">
	
		<div class="container h-100">
			<div class="row justify-content-md-center h-100">
		<h1> Welcome back to AnimeWorld! </h1>
				<div class="card-wrapper">
					<div class="card fat">
						<div class="card-body">
							<h4 class="card-title">Login</h4>
							<form:form action="/login" method="post" modelAttribute="newLogin">					
								  <div class="form-group">
  									  <form:label for="email" path="email"> Email: </form:label>
								      <form:input type="text" path="email" class="form-control"  aria-describedby="email"/>
    							      <form:errors path="email"/>	
 								 </div>
								<div class="form-group">
									<form:label path="password" for="password">Password</form:label>
									<form:input type="password" path="password" id="password"  class="form-control" name="password" />
									<form:errors path="password"/>
								</div>

								<div class="form-group">
									<label>
										<input type="checkbox" name="remember"> Remember Me
									</label>
								</div>

								<div class="form-group no-margin">
									<button type="submit" class="btn btn-primary btn-block">
										Login
									</button>
								</div>
								<div class="margin-top20 text-center">
									Don't have an account? <a href="/create">Create One</a>
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