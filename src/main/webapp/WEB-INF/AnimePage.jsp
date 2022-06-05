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
<title>Insert title here</title>
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
      </div>
    </div>
  </div>
</nav>
	
	<h2> You picked: <c:out value="${shows.showTitle}"/> </h2>
	<h4>It was written by: <c:out value="${shows.author }"/> </h4>
				


		<c:forEach var="post" items="${posts}">
			<c:if test="${shows.id == post.show.id}">
				<h3> 
					<c:out value="${post.thoughts }"/>
				</h3>
			</c:if>	
		</c:forEach>
	
	</div>
</body>
</html>