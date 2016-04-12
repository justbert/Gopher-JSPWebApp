<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.io.*, java.net.*, java.util.*" %>

<%-- Language Declaration and Resource Bundle --%>
<% 
String lang = request.getParameter( "lang" );
  if ( lang == null){ lang = "en";}
  ResourceBundle RB = ResourceBundle.getBundle("com.lang.i18n.text", new Locale(lang));
%> 

<%-- Variable Declarations --%>
<%! String requestErrand, description, title, reqErrand, gopheredErrands; %>

<%-- Variable Initializations --%>
<% 
  requestErrand = RB.getString("requestErrand"); 
  description = RB.getString("description"); 
  title = RB.getString("title"); 
  reqErrand = RB.getString("reqErrand"); 
  gopheredErrands = RB.getString("gopheredErrands");
%>

<style>
	.jumbotron h1 {
  		font-size: 36px !important;
	}
	
	.jumbotron  {
  		font-size: 14px !important;
  		margin-bottom: 0px !important;
	}
	
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
	
	.request-nav a, a:hover {
		padding: 10px 15px;
		font-size: 16px;
		color: #555;
	}
		
	.request-nav {
		background-color:ghostwhite;
	}
	
	.request-content {
		border-style: solid;
		border-color: #ddd;
		border-width: 1px 1px 1px 1px;
		border-radius: 10px 10px 10px 10px;
		background-color: white;
		margin: 0px;
		padding: 20px;
		min-height: 400px;
	}
	
	.clearfix:after {
		visibility: hidden;
		display: block;
		font-size: 0;
		content: " ";
		clear: both;
		height: 0;
	}
	
	#tasks-container {
		padding: 10px;
	}
	
	#tasks-div {
		padding: 10px;
	}
	
	form h4 {
		margin-bottom: 20px;
		margin-top: 20px;
	}
	
	#tasks-div h5 {
		padding: 15px;
	}
	
	input, textarea {
		display: block;
		width: 50%;
		border: 2px solid #c7eaee;
		border-radius: 5px;
		margin: 8px 0 !important;
	}
	
	select {
		display: block;
		border: 2px solid #c7eaee;
		border-radius: 5px;
		margin: 8px 0 !important;
	}
	
	#subtasks button {
		background-color: white;
    	color: black;
    	border: 2px solid #c7eaee;
    	border-radius: 5px;
    	margin: 2px;
    	padding: 5px;
	}
	
	#subtasks button:hover {
    	background-color: #c7eaee;
    	color: white;
	}
	
	.map {
		height:300px;
		width:100%;
		margin: auto;
		padding: 20px;
	}
	
	.submitBtn {
		background-color: #c7eaee;
		width: 20%;
		padding: 10px;
		border: none;
		border-radius: 5px;
		margin-left: 35%;
    	margin-top: 20px;
	}
	

</style>
<head>
	<title>Request an Errand</title>
	<meta name="viewport" content="initial-scale=1.0">
</head>
<jsp:include page="header.jsp"/>
	
	<!-- Header -->
	<div class="container-fluid profile-header text-center jumbotron bg-teal">
	 	<div class="profile-header-img">
	 		<img class="img-circle" src="assets/img/cute_gopher.png" >		
		</div>
		<h1>Request an Errand </h1>
	</div>
	
	<!-- Begin form to add errand request -->
	<div class="request-content">
	
		<form id="addErrandForm" action="request" method="post">
			<h4>Enter Errand Information:</h4>
			<label class="col-md-3">Title:</label>
			<input type="text" name="errandName" placeholder="Title of your errand">
			<label class="col-md-3">Description:</label>
			<textarea rows="4" cols="50" name="errandDescription" placeholder="Enter a description of your errand."></textarea>
			<label class="col-md-3">Deadline:</label>
			<input type="datetime-local" name="deadline">
			<label class="col-md-3">Importance:</label>
			<select form="addErrandForm" name="importance">
  				<option value="1">Very Low</option>
  				<option value="2">Low</option>
  				<option value="3" selected>Normal</option>
  				<option value="4">High</option>
  				<option value="5">Very High</option>
			</select>
			<h4>Enter Reward Information:</h4>
			<label class="col-md-3">Reward</label>
			<input type="text" name="rewardName" placeholder="Name of the reward">
			<label class="col-md-3">Description</label>
			<textarea rows="4" cols="50" name="rewardDescription" placeholder="Enter a decription of the reward"></textarea>
			<label class="col-md-3">Reward Value ($)</label>
			<input type="text" name="rewardValue" placeholder="Estimate the value of the reward">
			<input type="hidden" name="numTasks" value="1">			
		
			<!-- Section to add task(s) -->
			<h4>Enter Task(s) Information:</h4>
			<div id="tasks-container" class="clearfix">
				<div class="col-md-3">
					<ul class="nav nav-pills nav-stacked" id="tasks-list">
						<li class="active" id="task1li"><a data-toggle="tab" href="#task1div">Task 1</a></li>
					</ul>
					<div id="subtasks">
				        <div><button type="button" id="add-task" onclick="addTaskTab()">Add Task</button></div>
				        <div><button type="button" id="remove-task" onclick="removeTaskTab()">Remove Last Task</button></div>	        	
				       </div>
				</div>
	        	<div class="col-md-9">
	        		<div id="tasks-div" class="tab-content">
		        		<div id="task1div" class="tab-pane fade in active table-responsive">
			        		<label class="col-md-3">Title:</label>
							<input type="text" name="taskName1" placeholder="Title of your task">
							<label class="col-md-3">Description:</label>
							<textarea rows="4" cols="50" name="taskDescription1" placeholder="Enter a description of your task."></textarea>
							<h5>Enter a location for this task:</h5>
							<label class="col-md-3">Address Line 1:</label>
							<input type="text" name="addressLine1Task1">
							<label class="col-md-3">Address Line 2:</label>
							<input type="text" name="addressLine2Task1">
							<label class="col-md-3">City:</label>
							<input type="text" name="cityTask1">
							<label class="col-md-3">Province:</label>
							<input type="text" name="provinceTask1">
							<label class="col-md-3">Country:</label>
							<input type="text" name="countryTask1">
							<label class="col-md-3">Postal Code:</label>
							<input type="text" name="zipTask1">
							<input type="hidden" name="longitudeTask1">
							<input type="hidden" name="latitudeTask1">
							<div class="map" id="map1"></div>
						</div>
		        	</div>
		        </div>
	        </div>
	        
	        <button class="submitBtn" type="submit">Request Errand!</button>
	        
        </form>
	</div>
	
	
    
	<script src="https://maps.googleapis.com/maps/api/js?&callback=addMap&key=AIzaSyCpiQxT9pbyX3_zs4M1CTRCZFprNwOw7Gg" async defer></script>
	<script type="text/javascript">
	//Global Variables
	var numTasks = 1;
	var startPos = {coords: {latitude: 45.4165703, longitude: -75.7047006}};
	var mapArray = new Array(100);
	var markerArray = new Array(100);
	
	//Object creation function
	if(typeof Object.create !== 'function') {
		Object.create = function(o) {
			var F = function(o) {};
			F.prototype = o;
			return new F();
		};
	}
	
	var MapCanvas = {
		map: null,
		marker: null,
		name: null,
		
		setName: function(n) {
			this.name = n;
		},
		
		setMap: function(m) {
			this.map = m;
		}, 
		
		setMarkerLocation: function(position) {
			
			if(this.marker === null) {
				this.marker = new google.maps.Marker({
					position: position,
				    map: this.map,
				    draggable: false,
				});
			} else {
				this.marker.setPosition(position);
			}
			this.map.panTo(position);
		},
	};
	
	window.onload = function() {
		  
		  var geoSuccess = function(position) {
		    startPos = position;
		    addMap("map1");
		  };
		  
		  var geoFailure = function() {
			startPos = {coords: {latitude: 45.4165703, longitude: -75.7047006}};
			addMap("map1");
		  }
		  
		  navigator.geolocation.getCurrentPosition(geoSuccess, geoFailure);
	};
	
	function addTaskTab() {
		numTasks++;

	    $("#tasks-list").append('<li id="task'+ numTasks +'li"><a data-toggle="tab" href="#task' + numTasks + 'div">Task '+ numTasks+'</a></li>');     // Append new elements
		$("#tasks-div").append(
				'<div id="task' + numTasks + 'div" class="tab-pane fade table-responsive">' +
				'<label class="col-md-3">Title:</label>' +
				'<input type="text" name="taskName'+numTasks+'" placeholder="Title of your task">'+
				'<label class="col-md-3">Description:</label>'+
				'<textarea rows="4" cols="50" name="taskDescription'+numTasks+'" placeholder="Enter a description of your task."></textarea>'+
				'<h5>Enter a location for this task:</h5>'+
				'<label class="col-md-3">Address Line 1:</label>'+
				'<input type="text" name="addressLine1Task'+numTasks+'">'+
				'<label class="col-md-3">Address Line 2:</label>'+
				'<input type="text" name="addressLine2Task'+numTasks+'">'+
				'<label class="col-md-3">City:</label>'+
				'<input type="text" name="cityTask'+numTasks+'">'+
				'<label class="col-md-3">Province:</label>'+
				'<input type="text" name="provinceTask'+numTasks+'">'+
				'<label class="col-md-3">Country:</label>'+
				'<input type="text" name="countryTask'+numTasks+'">'+
				'<label class="col-md-3">Postal Code:</label>'+
				'<input type="text" name="zipTask'+numTasks+'">'+
				'<input type="hidden" name="longitudeTask'+numTasks+'">'+
				'<input type="hidden" name="latitudeTask'+numTasks+'">'+
			'<div class="map" id="map' + numTasks +'"></div></div>');
	    
	    addMap("map"+numTasks);
	    
	    google.maps.event.trigger(mapArray['map'+numTasks].map, 'resize');
	    
	    $('a[href="#task'+numTasks+'div"]').on('shown.bs.tab', function(e) {
	        google.maps.event.trigger(mapArray['map'+numTasks].map, 'resize');
	    });
	    
	    $('a[href="#task'+numTasks+'div"]').tab('show');
	    
	    $('input[name="numTasks"]').val(numTasks);
	}
	
	function removeTaskTab() {
		if(numTasks > 1) {
			$("#task" + numTasks + "li").remove();
			$("#task" + numTasks + "div").remove();
			
			mapArray['map'+numTasks] = null;
			
			numTasks--;
			
			$('input[name="numTasks"]').val(numTasks);
		}
	}
	
	function addMap(mapElement) {
		
		var map = new google.maps.Map(document.getElementById(mapElement), {
			center: {lat: startPos.coords.latitude, lng: startPos.coords.longitude},
			zoom: 15,
		});
		
		map.name = mapElement;
					
		m = Object.create(MapCanvas);
		m.setName(mapElement);
		m.setMap(map);
		
		mapArray[mapElement] = m;
		
		map.addListener('click', function(e) {
			mapArray[this.name].setMarkerLocation(e.latLng);
			
			var geocoder = new google.maps.Geocoder;
			
			var that = this;
			
			geocoder.geocode({'location':e.latLng}, function(results, status) {
				if(status === google.maps.GeocoderStatus.OK) {
					if(results[0]) {
						
						//reset all form info to empty
						$('input[name="addressLine1Task' + that.name.substring(3, that.name.length) + '"]').val("");
						$('input[name="addressLine2Task' + that.name.substring(3, that.name.length) + '"]').val("");
						$('input[name="cityTask' + that.name.substring(3, that.name.length) + '"]').val("");
						$('input[name="provinceTask' + that.name.substring(3, that.name.length) + '"]').val("");
						$('input[name="countryTask' + that.name.substring(3, that.name.length) + '"]').val("");
						$('input[name="zipTask' + that.name.substring(3, that.name.length) + '"]').val("");
						
						for(i = 0; i < results[0]["address_components"].length; ++i) {
							
							switch(results[0]["address_components"][i]["types"][0]) {
								case "street_number":
									$('input[name="addressLine1Task' + that.name.substring(3, that.name.length) + '"]').val(results[0]["address_components"][i]["long_name"]);
									break;
								case "route":
									$('input[name="addressLine1Task' + that.name.substring(3, that.name.length) + '"]').val(
											$('input[name="addressLine1Task' + that.name.substring(3, that.name.length) + '"]').val() + " " +
											results[0]["address_components"][i]["long_name"]
											
									);
									break;
								case "locality":
									$('input[name="cityTask' + that.name.substring(3, that.name.length) + '"]').val(results[0]["address_components"][i]["long_name"]);
									break;
								case "administrative_area_level_1":
									$('input[name="provinceTask' + that.name.substring(3, that.name.length) + '"]').val(results[0]["address_components"][i]["long_name"]);
									break;
								case "country":
									$('input[name="countryTask' + that.name.substring(3, that.name.length) + '"]').val(results[0]["address_components"][i]["long_name"]);
									break;
								case "postal_code":
									$('input[name="zipTask' + that.name.substring(3, that.name.length) + '"]').val(results[0]["address_components"][i]["long_name"]);
									break;
							}
						}
					}
				}
			});
			
			$('input[name="latitudeTask' + that.name.substring(3, that.name.length) + '"]').val(e.latLng.lat);
			$('input[name="longitudeTask' + that.name.substring(3, that.name.length) + '"]').val(e.latLng.lng);
		});
		
	}
	
	</script>
	
<jsp:include page="footer.jsp"/>
