<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.User" %>
<%@page import="entities.Errand" %>
<%@ taglib  prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>	


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
    			<img class="img-circle" src="assets/img/cute_gopher.png" >	  		
		</div>
		<h1><c:out value="${viewUser.getUsername()}" /> </h1>
	</div>
	
	<!-- Tab navigation for dashboard content -->
	
	<div>
		<div class="dashboard-nav">
			<ul class="nav nav-tabs">
				<li class="active"><a data-toggle="tab" href="#profile">Profile</a></li>
				<li><a data-toggle="tab" href="#active-errands">Active Errands</a></li>
				<li><a data-toggle="tab" href="#past-errands">Past Errands</a></li>
				<li><a data-toggle="tab" href="#ratings">Ratings</a></li>
			</ul>
		</div>
		
		<!-- This section holds dashboard content for the selected tab -->
		<div class="tab-content dashboard-content">
			
			<!-- Profile info, displayed by default -->
			<div id="profile" class="tab-pane fade in active table-responsive">
				<h3 class="table-title"><span class="glyphicon glyphicon-user tab-icon"></span>
					Basic Info
				</h3>
				<table class="table">
					<tr>
						<th>Username:</th>
						<td>${viewUser.getUsername()}
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
			
			<!--  Current errands - requesting or to-do -->
			<div id="active-errands" class="tab-pane fade table-responsive">
				<h3 class="table-title"><span class="glyphicon glyphicon-exclamation-sign tab-icon"></span>
					Errands Being Gophered
				</h3>
				<table class="table">					
						<tr>
							<th>Errand</th>
							<th>Reward</th>
							<th>Deadline</th>
						</tr>
						
						<!-- List all errands for which this user is registered as a Gopher -->
						<c:forEach items="${errandsGopher}" var="errand">
							<tr>
								<td><a href="/Gopher/errand?id=${errand.getId() }" >${errand.getName()}</a></td>
								<td>$ ${errand.getRewardId().getRewardValue() }</td>
								<td>${errand.getDeadline() }</td>
							</tr>
						</c:forEach>
				</table>
				<h3 class="table-title"><span class="glyphicon glyphicon-hourglass tab-icon"></span>
					Errands Requested
				</h3>
				<table class="table">
					<tr>
						<th>Errand</th>
						<th>Reward</th>
						<th>Date Requested</th>
					</tr>
					
					<!-- List all errands for which this user is registered as a Customer -->
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
					Past Errands Gophered
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
					Past Errand Requests
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
			
			<!--  Ratings tab -->
			<div id="ratings" class="tab-pane fade table-responsive">
				<h3 class="table-title"><span class="glyphicon glyphicon-heart tab-icon"></span>
					${viewUser.getUsername()}'s Ratings as a Customer:
				</h3>
				<table class="table">
					<tr>
						<td>Rating</td>
						<td>Comments</td>
						<td>Date</td>
						<td>By</td>
						<td>Errand<td>
					</tr>
					
					<!-- List all ratings for which this user was registered as a customer -->
						<c:forEach items="${ratingsCustomer}" var="rating">
							<tr>
								<td>${rating.getRatingValue()}</td>
								<td>${rating.getComments()}</td>
								<td>${rating.getCreationDate()}</td>
								<td>${rating.getUserIdRater().getUsername()}
								<td>${rating.getErrandId().getName()}
							</tr>
						</c:forEach>
				</table>
			</div>
					
		</div>
	</div>
<jsp:include page="footer.jsp"/>