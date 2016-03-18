<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.jumbotron h1 {
  		font-size: 36px !important;
	}
	.jumbotron  {
  		font-size: 14px !important;
	}
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
	.map {
		height:300px;
		width:300px;
	}

</style>
<head>
	<title>Request an Errand</title>
	<meta name="viewport" content="initial-scale=1.0">
</head>
<jsp:include page="header.jsp"/>
	<div class="row pad-nav-bar bg-teal jumbotron">
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
		<div class="col-md-6" id="mapTest">
<!-- 			<script src='https://maps.googleapis.com/maps/api/js?v=3.exp'></script><div style='overflow:hidden;height:400px;width:520px;'><div id='gmap_canvas' style='height:400px;width:520px;'></div><style>#gmap_canvas img{max-width:none!important;background:none!important}</style></div> <a href='https://embedmap.org/'>google map wordpress widget</a> <script type='text/javascript' src='https://embedmaps.com/google-maps-authorization/script.js?id=e417dc20894e022e40790fc64a1a2ec49ff41b31'></script><script type='text/javascript'>function init_map(){var myOptions = {zoom:12,center:new google.maps.LatLng(45.29364945583902,-75.74120339660647),mapTypeId: google.maps.MapTypeId.ROADMAP};map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);marker = new google.maps.Marker({map: map,position: new google.maps.LatLng(45.29364945583902,-75.74120339660647)});infowindow = new google.maps.InfoWindow({content:'<strong></strong><br><br>K2G Ottawa<br>'});google.maps.event.addListener(marker, 'click', function(){infowindow.open(map,marker);});infowindow.open(map,marker);}google.maps.event.addDomListener(window, 'load', init_map);</script>	         -->
		 </div>
	</div>
	<div class="row bg-white">
		<div id="tasks-container">
	        <div class="row" id="subtasks">
	        	<div class="col-md-3"><button id="remove-task" onclick="removeTaskTab()">Remove the last Subtask</button></div>
	        	<div class="col-md-3 col-md-offset-2"><button id="add-task" onclick="addTaskTab()">Add Another Task</button></div>
	        </div>
	        <div class="row">
		        <div class="col-md-3">
		        	<ul class="nav nav-pills nav-stacked" id="tasks-list">
						<li class="active" id="task1li"><a data-toggle="tab" href="#task1div">Task 1</a></li>
					</ul>
				</div>
	        	<div class="col-md-9">
	        		<div id="tasks-div" class="tab-content dashboard-content">
		        		<div id="task1div" class="tab-pane fade in active table-responsive">
							<!-- <h3 class="table-title"><span class="glyphicon glyphicon-star tab-icon"></span>
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
							</table> -->
							<div class="map" id="map1"></div>
						</div>
						
		        	</div>
		        </div>
	        </div>
        </div>
	</div>
    <!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCpiQxT9pbyX3_zs4M1CTRCZFprNwOw7Gg&callback=initMap"async defer></script> -->
	<script src="https://maps.googleapis.com/maps/api/js?&callback=addMap&key=AIzaSyCpiQxT9pbyX3_zs4M1CTRCZFprNwOw7Gg" async defer></script>
	<script type="text/javascript">
	//Global Variables
	var numTasks = 1;
	var startPos;
	var mapArray = new Array(100);
	
	window.onload = function() {
		  startPos;
		  var geoSuccess = function(position) {
		    startPos = position;
		  };
		  
		  var geoFailure = function(position) {
			startPos = {coords: {latitude: 45.4165703, longitude:-75.7047006}};
		  }
		  navigator.geolocation.getCurrentPosition(geoSuccess, geoFailure);
		  
		  mapArray[0] = addMap("map1");
		  
	};
	
	function addTaskTab() {
		numTasks++;
		
		/* var tasksList = document.getElementById("tasks-list");
		var newLI = document.createElement("li");
		var anchor = document.createElement("a");
		anchor.setAttribute("data-toggle", "tab");
		andhor.setAttribute("") */
		
	    $("#tasks-list").append("<li id=\"task"+ numTasks +"li\"><a data-toggle=\"tab\" href=\"#task" + numTasks + "div\">Task "+ numTasks+"</a></li>");     // Append new elements
		$("#tasks-div").append("<div id=\"task"+numTasks+"div\" class=\"tab-pane fade table-responsive\"><div class=\"map\" id=\"map" + numTasks +"\"></div></div>");
	    mapArray[numTasks] = addMap('map'+numTasks);
	}
	
	function removeTaskTab() {
		if(numTasks > 1) {
			$("#task" + numTasks + "li").remove();
			$("#task" + numTasks + "div").remove();
			
			mapArray[numTasks] = null;
			
			numTasks--;
		}
	}
	
	function addMap(mapElement) {
		//var geocoder = new google.maps.Geocoder();
		
		var map = new google.maps.Map(document.getElementById(mapElement), {
			center: {lat: 45.4165703, lng: -75.7047006},
			zoom: 15,
		});
		
		return map;
		/* geocoder.geocode({ 'address': address }, function (results, status) {
		    if (status == google.maps.GeocoderStatus.OK) {
		        var mapOptions = {
		            zoom: 14,
		            center: results[0].geometry.location,
		            disableDefaultUI: true
		        };
		        var map = new google.maps.Map(document.getElementById("mapTest"), mapOptions);
		        var marker = new google.maps.Marker({
		            map: map,
		            position: results[0].geometry.location
		        });
		    } else {
		        alert("Geocode was not successful for the following reason: " + status);
		    }
		}); */
	}
	
	
	
	</script>
	
<jsp:include page="footer.jsp"/>
