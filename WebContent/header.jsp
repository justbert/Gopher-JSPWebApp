<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" >
	<script src="assets/js/jquery-2.2.0.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.js"></script>
	<link href="assets/css/main-style.css" rel="stylesheet" type="text/css">

	<body>
		<% if(session.getAttribute("userObject") != null) {%>
			<jsp:include page="widget.jsp"/>
		<%} %>
		<nav class="navbar navbar-default navbar-fixed-top nav-margin">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			        	<span class="icon-bar"></span>
			        	<span class="icon-bar"></span>
			       	 	<span class="icon-bar"></span> 
      				</button>
      				<a class="navbar-brand" href="/Gopher/"><img class="img-align" src="assets/img/blocklogo.png"></a>
    			</div>
    		
    			<div class="collapse navbar-collapse" id="myNavbar">	
					<ul class="nav navbar-nav navbar-right">
						<c:choose>
							<c:when test="${loggedIn}">
								<li><a href="/Gopher/dashboard">Welcome, ${userObject.getUsername()}</a></li>
							</c:when>
							<c:otherwise>
							<li><a href="/Gopher/login">Log In</a></li>
							</c:otherwise>
						</c:choose>
			            <li><a href="/Gopher/browse">Browse</a></li>
			            <li><a href="/Gopher/request.jsp">Request</a></li>
			            <c:if test="${loggedIn}">
			            	<li><a href="/Gopher/logout">Logout</a></li>
			            </c:if>
	        		</ul>
    			</div>
  			</div>
		</nav>
		<div class="container">