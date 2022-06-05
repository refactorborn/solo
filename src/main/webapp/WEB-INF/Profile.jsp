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
<title>Profile</title>
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
        <c:if test="${user.id==1}">
        <a class="nav-link" href="/show">Create a Show</a>
        </c:if>
         <a class="nav-link" href="/profile">Profile</a>
         <a class="nav-link" href="/logout">Logout</a>
        <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">Disabled</a>
      </div>
    </div>
  </div>
</nav>
<h2> Welcome to Anime World, <c:out value="${user.userName}"/>!</h2>

<h2> Your information </h2>
<table class="table">
  <thead>
    <tr>
      
      <th scope="col">First Name:</th>
      <th scope="col">Last Name:</th>
      <th scope="col">Username:</th>
      <th scope="col">Email</th>
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
		
		<table class="table">
  <thead>
    <tr>
      <th scope="col">Post Title</th>
      <th scope="col">Anime</th>
      <th scope="col"> Actions</th>
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
		
		
	
		
		
	
</body>
</html>