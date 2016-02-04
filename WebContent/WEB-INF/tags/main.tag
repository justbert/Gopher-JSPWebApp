<!DOCTYPE html>
<%@tag description="Main Template Wrapper" pageEncoding="UTF-8"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Login</title>
		<link href="${pageContext.request.contextPath}/assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" >
		<link href="${pageContext.request.contextPath}/assets/css/main-style.css" rel="stylesheet" type="text/css" >
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		<script src="${pageContext.request.contextPath}/assets/bootstrap/js/bootstrap.js"></script>
	</head>
	<body>
		<div id="wrapper">
			<div id="sidebar-navigator">
				<ul class="sidebar-nav">
		            <li class="sidebar-brand"><a href="#">Gopher</a></li>
		            <li><a href="#">Browse</a></li>
		            <li><a href="#">Request</a></li>
		            <li><a href="dashboard.jsp">Profile</a></li>
        		</ul>
			</div>
			<div class="content">
				<div class="container-fluid">
					<jsp:doBody/>
				</div>
			</div>
		</div>
	</body>
</html>