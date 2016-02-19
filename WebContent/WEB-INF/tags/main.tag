<!DOCTYPE html>
<%@tag description="Main Template Wrapper" pageEncoding="UTF-8"%>
<html>
	<link href="assets/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css" >
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.js"></script>
	<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  	<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
	<link href="assets/css/main-style.css" rel="stylesheet" type="text/css">

	<script>
	  $(function() {
	    $( ".draggable" ).draggable();
	  });
  	</script>

	<body>
		<div id="profile-widget" class="text-center draggable">
			<img class="img-circle profile-img" src="assets/img/profile_img.jpg" height="100" width="100" >
			<div class="btn-group" id="profile-wdiget-button-container" role="group">
				<button type="button" class="btn btn-default btn-xs" aria-label="Settings">
					<span class="glyphicon glyphicon-cog" data-toggle="tooltip" title="Settings"></span>
				</button>
				<button type="button" class="btn btn-default btn-xs" aria-label="Notifications">
					<span class="glyphicon glyphicon-bell" data-toggle="tooltip" title="Alerts"></span>
				</button>
				<button type="button" class="btn btn-default btn-xs" aria-label="Notifications">
					<span class="glyphicon glyphicon-heart" data-toggle="tooltip" title="Endorsements"></span>
				</button>
				<button type="button" class="btn btn-default btn-xs" aria-label="Notifications">
					<span class="glyphicon glyphicon-inbox" data-toggle="tooltip" title="Messages"></span>
				</button>
			</div>
		</div>
		<nav class="navbar navbar-default navbar-fixed-top nav-margin">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
			        	<span class="icon-bar"></span>
			        	<span class="icon-bar"></span>
			       	 	<span class="icon-bar"></span> 
      				</button>
      				<a class="navbar-brand" href="/Gopher/index.jsp"><img class="img-align" src="assets/img/blocklogo.png"></a>
    			</div>
    		
    			<div class="collapse navbar-collapse" id="myNavbar">	
					<ul class="nav navbar-nav navbar-right">
			            <li><a href="/Gopher/login.jsp">Log In</a></li>
			            <li><a href="/Gopher/browse.jsp">Browse</a></li>
			            <li><a href="/Gopher/request.jsp">Request</a></li>
			            <li><a href="/Gopher/dashboard.jsp">Profile</a></li>
	        		</ul>
    			</div>
  			</div>
		</nav>
		<div id="wrapper">
			<jsp:doBody/>
		</div>
	</body>
</html>