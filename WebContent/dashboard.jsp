<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
	<jsp:body>
	
	<style>
		.profile-header {
			padding-top: 50px;
			padding-bottom: 50px;
			background-color: #c7eaee;
		}
	
		.img-circle {
			border-radius: 50%;
		}
		
		.dashboard-nav a, a:hover {
			padding: 10px 15px;
			font-size: 16px;
		}
		
		.dashboard-content {
			border-color: white;
			border-width: 10px;
			border-radius: 0px 0px 10px 10px;
			background-color: white;
			margin: 0px;
			padding: 20px;
		}
		
		table {
			width: 100%;
			cell-padding: 20px;
		}
		
		tr {
			margin: 5px;
		}
	</style>
	
	<!-- ****************END STYLE BLOCK******************* -->
	
	<!-- User dashboard header -->
    <div class="container-fluid profile-header text-center">
		<img class="img-circle" src="img/profile_img.jpg" >
		<h2>Skye Turriff</h2>
	</div>
	
	<!-- Tab navigation for dashboard content -->
	<div class="dashboard-nav">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#profile">Profile</a></li>
			<li><a data-toggle="tab" href="#errands">Errands</a></li>
		</ul>
	</div>
	
	<!-- This section holds dashboard content for the selected tab -->
	<div class="tab-content dashboard-content">
		
		<!-- Profile info, displayed by default -->
		<div id="profile" class="tab-pane fade in active table-responsive">
			<h1>My profile info goes here</h1>
			<table class="table">
				<tr>
					<td>Username:</td>
					<td>Skye Turriff</td>
				</tr>
				<tr>
					<td>Email:</td>
					<td>turriff.skye@gmail.com</td>
				</tr>
			</table>
		</div>
		
		<!-- Errands -->
		<div id="errands" class="tab-pane fade">
			<h1>My errand info goes here</h1>
			<p>Content</p>
		</div>
		
	</div>
	
    </jsp:body>
</t:main>