<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.User" %>
<%@page import="entities.Errand" %>
<%@ taglib  prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>	

<% // Store logged in user data %>
<% User user = (User) request.getAttribute("user"); %>

	<style>
		.profile-header {
			padding-top: 50px;
			padding-bottom: 50px;
			background-color: #c7eaee;
		}
		
		.profile-header-img {
			margin-top: 20px;
		}
	
		.img-circle {
			border-radius: 50%;
			border: 3px solid white;
		}
		
		.dashboard-nav a, a:hover {
			padding: 10px 15px;
			font-size: 16px;
			color: #555;
		}
		.dashboard-nav{
				background-color:ghostwhite;
		}
		
		.dashboard-content {
			border-style: solid;
			border-color: #ddd;
			border-width: 0px 1px 1px 1px;
			border-radius: 0px 0px 10px 10px;
			background-color: white;
			margin: 0px;
			padding: 20px;
			min-height: 500px;
		}
		
		table {
			table-layout: fixed;
			/*width: 100%;*/
			/*cell-padding: 20px;*/
		}
		
		.table-title {
			display: inline-flex;
			padding: 0px 10px 10px 0px;
		}
		
		tr {
			/*margin: 5px;*/
		}
		
		.edit-btns {
			float: right;
		}
		
		.tab-icon {
			padding-right: 10px;
		}
	</style>
	
	<!-- ****************END STYLE BLOCK******************* -->
	
	
	<!-- User dashboard header -->
    <div class="container-fluid profile-header text-center">
    	<div class="profile-header-img">
    	
    		<!-- Hack for demo to show profile pic for Skye only -->
    		<c:if test="${userObject.getId() == 102}">
    			<img class="img-circle" src="assets/img/profile_img.jpg" >
    		</c:if>
    		<c:if test="${userObject.getId() != 102}">
    			<img class="img-circle" src="assets/img/cute_gopher.png" >
    		</c:if>		
    		
		</div>
		<h1><c:out value="${userObject.getUsername()}" /> </h1>
	</div>
	
	<!-- Tab navigation for dashboard content -->
	
	<div>
		<div class="dashboard-nav">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#profile">Profile</a></li>
				<li><a data-toggle="tab" href="#alerts">Notifications</a></li>
				<li><a data-toggle="tab" href="#active-errands">Active Errands</a></li>
				<li><a data-toggle="tab" href="#past-errands">Past Errands</a></li>
			</ul>
		</div>
		
		<!-- This section holds dashboard content for the selected tab -->
		<div class="tab-content dashboard-content">
			
			<!-- Profile info, displayed by default -->
			<div id="profile" class="tab-pane fade in active table-responsive">
				<h3 class="table-title"><span class="glyphicon glyphicon-user tab-icon"></span>
					My Account
				</h3>
				<div class="btn-group edit-btns" role="group">
					<button type="button" class="btn btn-default btn-sm" aria-label="Edit Profile">
						<span class="glyphicon glyphicon-pencil" data-toggle="tooltip" title="Edit Profile"></span>
					</button>
					<button type="button" class="btn btn-default btn-sm" aria-label="Change Photo">
						<span class="glyphicon glyphicon-camera" data-toggle="tooltip" title="Change Photo"></span>
					</button>
					<button type="button" class="btn btn-default btn-sm" aria-label="Setting">
						<span class="glyphicon glyphicon-cog" data-toggle="tooltip" title="Settings"></span>
					</button>
				</div>
				<table class="table">
					<tr>
						<th>Username:</th>
						<td>${userObject.getUsername()}
					<tr>
						<th>Email:</th>
						<td>${userObject.getEmail()}</td>
					</tr>
					<tr>
						<th>Gopher Rating:</th>
						<td>
							<img class="img-circle" src="assets/img/rating.png" >
							<img class="img-circle" src="assets/img/rating.png" >
							<img class="img-circle" src="assets/img/rating.png" >
						</td>
					</tr>
					<tr>
						<th>Customer Rating:</th>
						<td>
							<img class="img-circle" src="assets/img/rating.png" >
							<img class="img-circle" src="assets/img/rating.png" >
							<img class="img-circle" src="assets/img/rating.png" >
						</td>
					</tr>
				</table>
			</div>
			
			<!--  Notifications tab -->
			<div id="alerts" class="tab-pane fade table-responsive">
				<h3 class="table-title"><span class="glyphicon glyphicon-bell tab-icon"></span>
					My Notifications
				</h3>
				<table class="table">
					<tr>
						<td>No notifications to show</td>
					</tr>
				</table>
			</div>
			
			<!--  Current errands - requesting or to-do -->
			<div id="active-errands" class="tab-pane fade table-responsive">
				<h3 class="table-title"><span class="glyphicon glyphicon-exclamation-sign tab-icon"></span>
					Your Errands to Gopher
				</h3>
				<table class="table">					
						<tr>
							<th>Errand</th>
							<th>Reward</th>
							<th>Deadline</th>
						</tr>
						
						<!-- List all errands for which this customer is registered as a Gopher -->
						<c:forEach items="${errandsGopher}" var="errand">
							<tr>
								<td><a href="/Gopher/errand?id=${errand.getId() }" >${errand.getName()}</a></td>
								<td>$ ${errand.getRewardId().getRewardValue() }</td>
								<td>${errand.getDeadline() }</td>
							</tr>
						</c:forEach>
				</table>
				<h3 class="table-title"><span class="glyphicon glyphicon-hourglass tab-icon"></span>
					Your Errand Requests
				</h3>
				<table class="table">
					<tr>
						<th>Errand</th>
						<th>Reward</th>
						<th>Date Requested</th>
					</tr>
					
					<!-- List all errands for which this customer is registered as a Customer -->
					<c:forEach items="${errandsCustomer}" var="errand">
					<tr>
						<td><a href="/Gopher/errand?id=${errand.getId() }" >${errand.getName()}</a></td>
						<td>$ ${errand.getRewardId().getRewardValue() }</td>
						<td>${errand.getDateCreated() }</td>
					</tr>
					</c:forEach>
				</table>
			</div>
			
			<!-- Past errands completed or requested by user -->
			<div id="past-errands" class="tab-pane fade table-responsive">
				<h3 class="table-title"><span class="glyphicon glyphicon-star tab-icon"></span>
					Gophered Errands
					</h3>
				<table class="table">
					<tr>
						<th>Errand</th>
						<th>Reward</th>
						<th>Date Completed</th>
					</tr>
<!-- 					<tr> -->
<!-- 						<td>Get me a popsicle</td> -->
<!-- 						<td>One hug</td> -->
<!-- 						<td>01/03/2016</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td>Get my groceries</td> -->
<!-- 						<td>$10 gift card</td> -->
<!-- 						<td>01/17/2016</td> -->
<!-- 					</tr> -->
				</table>
				<h3 class="table-title"><span class="glyphicon glyphicon-list-alt tab-icon"></span>
					Requested Errands
				</h3>
				<table class="table">
					<tr>
						<th>Errand</th>
						<th>Reward</th>
						<th>Date Completed</th>
					</tr>
<!-- 					<tr> -->
<!-- 						<td>Deliver my medicine</td> -->
<!-- 						<td>Free pizza</td> -->
<!-- 						<td>01/05/2016</td> -->
<!-- 					</tr> -->
<!-- 					<tr> -->
<!-- 						<td>Pick up my laundry</td> -->
<!-- 						<td>$10.00</td> -->
<!-- 						<td>01/03/2016</td> -->
<!-- 					</tr> -->
				</table>
			</div>
					
		</div>
	</div>
<jsp:include page="footer.jsp"/>