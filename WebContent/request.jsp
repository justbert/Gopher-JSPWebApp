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
	#subtasks{
		margin-top:25px;
	}
	#tasklist .btn{
		display:block;
		margin:15px;
	}
</style>
<t:main>
	<jsp:body>
        <h1>Request an Errand</h1>
        <div class="row">
	        <div class="col-md-6">
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
        <div class="row" id="subtasks">
        	<div class="col-md-3"><h4>Remove the last Subtask</h4></div>
        	<div class="col-md-3 col-md-offset-2"><h4>Add another Subtask</h4></div>
        </div>
        <div class="row">
        <div class="col-md-3">
        	<ul class="nav nav-pills nav-stacked">
			  <li role="presentation" class="active"><a href="#">Task 1</a></li>
			  <li role="presentation"><a href="#">Task 2</a></li>
			  <li role="presentation"><a href="#">Task 3</a></li>
			</ul>
		</div>
        	<div class="col-md-6"></div>
        </div>
    </jsp:body>
</t:main>

