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
		<img class="img-circle" src="assets/img/profile_img.jpg" >
		<h2>Skye Turriff</h2>
	</div>
	
	<!-- Tab navigation for dashboard content -->
	<div class="dashboard-nav">
		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#profile">Profile</a></li>
			<li><a data-toggle="tab" href="#active-errands">Active Errands</a></li>
			<li><a data-toggle="tab" href="#past-errands">Past Errands</a></li>
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
				<tr>
					<td>Gopher Rating:</td>
					<td><img class="img-circle" src="assets/img/rating.png" ><img class="img-circle" src="assets/img/rating.png" ><img class="img-circle" src="assets/img/rating.png" ></td>
				</tr>
				<tr>
					<td>Customer Rating:</td>
					<td><img class="img-circle" src="assets/img/rating.png" ><img class="img-circle" src="assets/img/rating.png" ></td>
				</tr>
			</table>
		</div>
		
		<!--  Current errands - requesting or to-do -->
		<div id="active-errands" class="tab-pane fade tale-responsive">
			<h1>Accepted Errands To Be Completed</h1>
			<table class="table">
				<tr>
					<td>Errand</td>
					<td>Reward Offered</td>
					<td>Date Accepted</td>
				</tr>
				<tr>
					<td>Walk my dog</td>
					<td>$5.00</td>
					<td>01/30/2016</td>
				</tr>
				<tr>
					<td>Set up my internet</td>
					<td>$20.00</td>
					<td>02/01/2016</td>
				</tr>
			</table>
			<h1>Errand Requests</h1>
			<table class="table">
				<tr>
					<td>Errand</td>
					<td>Reward</td>
					<td>Date Completed</td>
				</tr>
				<tr>
					<td>Pick up my kids from daycare</td>
					<td>$10.00</td>
					<td>02/03/2016</td>
				</tr>
			</table>
		</div>
		
		<!-- Past errands completed or requested by user -->
		<div id="past-errands" class="tab-pane fade table-responsive">
			<h1>Gophered Errands</h1>
			<table class="table">
				<tr>
					<td>Errand</td>
					<td>Reward</td>
					<td>Date Completed</td>
				</tr>
				<tr>
					<td>Get me a popsicle</td>
					<td>One hug</td>
					<td>01/03/2016</td>
				</tr>
				<tr>
					<td>Get my groceries</td>
					<td>$10 gift card</td>
					<td>01/17/2016</td>
				</tr>
			</table>
			<h1>Requested Errands</h1>
			<table class="table">
				<tr>
					<td>Errand</td>
					<td>Reward</td>
					<td>Date Completed</td>
				</tr>
				<tr>
					<td>Deliver my medicine</td>
					<td>Free pizza</td>
					<td>01/05/2016</td>
				</tr>
				<tr>
					<td>Pick up my laundry</td>
					<td>$10.00</td>
					<td>01/03/2016</td>
				</tr>
			</table>
		</div>
				
	</div>
	
    </jsp:body>
</t:main>