<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.js"></script>
	<link href="assets/css/main-style.css" rel="stylesheet" type="text/css">

	<body>
		<% if(session.getAttribute("userObject") != null) {%>
			<jsp:include page="/widget.jsp"/>
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
			            <li><a href="/Gopher/login.jsp">Log In</a></li>
			            <li><a href="/Gopher/browse">Browse</a></li>
			            <li><a href="/Gopher/request.jsp">Request</a></li>
			            <li><a href="/Gopher/dashboard.jsp">Profile</a></li>
	        		</ul>
    			</div>
  			</div>
		</nav>
		<div class="container">