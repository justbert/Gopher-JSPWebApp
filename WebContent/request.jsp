<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<style>
	.input-container{
		padding:20px;
		margin:20px;
	}
	.input-container input{
		margin-left:15px;
	}
	.input-container textarea{
		height:120px;
	}
	#tasks-container{
		background-color:white;
		border-radius:20px;
		padding:20px;
		
	}
</style>
<jsp:include page="/header.jsp"/>
	<div class="row pad-nav-bar bg-teal">
	 	<div class="col-md-6">
	 		<h1>Request an Errand</h1>
		 	<div class="input-container">
			  	<label>Title</label>
			  	<input style="width:50%;" type="text"></input>
			</div>
			<div class="input-container">
				<label>Description</label>
				<textarea style='box-sizing: border-box;width:100%;' name='description'></textarea>
			</div>
		</div>
		<div class="col-md-6">
			<script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script><div style='overflow:hidden;height:400px;width:520px;'><div id='gmap_canvas' style='height:400px;width:520px;'></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div> <a href='https://embedmap.org/'>google map wordpress widget</a> <script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=e417dc20894e022e40790fc64a1a2ec49ff41b31'></script><script type='text/javascript'>function init_map(){var myOptions = {zoom:12,center:new google.maps.LatLng(45.29364945583902,-75.74120339660647),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(45.29364945583902,-75.74120339660647)});infowindow = new google.maps.InfoWindow({content:'<strong></strong><br><br>K2G Ottawa<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>	        
		 </div>
	</div>
	<div class="row bg-white">
		<div id="tasks-container">
	        <div class="row" id="subtasks">
	        	<div class="col-md-3"><h4>Remove the last Subtask</h4></div>
	        	<div class="col-md-3 col-md-offset-2"><h4>Add another Subtask</h4></div>
	        </div>
	        <div class="row">
		        <div class="col-md-3">
		        	<ul class="nav nav-pills nav-stacked">
						<li class="active"><a data-toggle="tab" href="#task1">Task 1</a></li>
						<li><a data-toggle="tab" href="#task2">Task 2</a></li>
						<li><a data-toggle="tab" href="#task3">Task 3</a></li>
						<li><a data-toggle="tab" href="#task4">Task 4</a></li>
					</ul>
				</div>
	        	<div class="col-md-9">
	        		<div class="tab-content dashboard-content">
		        		<div id="task1" class="tab-pane fade in active table-responsive">
							<h3 class="table-title"><span class="glyphicon glyphicon-star tab-icon"></span>
								Gophered Errands
								</h3>
							<table class="table">
								<tr>
									<th>Errand</th>
									<th>Reward</th>
									<th>Date Completed</th>
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
							<h3 class="table-title"><span class="glyphicon glyphicon-list-alt tab-icon"></span>
								Requested Errands
							</h3>
							<table class="table">
								<tr>
									<th>Errand</th>
									<th>Reward</th>
									<th>Date Completed</th>
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
						<div id="task2" class="tab-pane fade table-responsive">Here be Dragons</div>
						<div id="task3" class="tab-pane fade table-responsive">Don't click the next one.</div>
						<div id="task4" class="tab-pane fade table-responsive">God damnit.</div>
		        	</div>
		        </div>
	        </div>
        </div>
	</div>
<jsp:include page="/footer.jsp"/>
