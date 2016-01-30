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
	</style>
	
    <div class="container-fluid profile-header text-center">
		<img class="img-circle" src="img/profile_img.jpg" >
		<h2>Skye Turriff</h2>
	</div>
	
	<div class="tabs">
		<ul class="nav nav-pills">
			<li class="active"><a href="#">Info</a>
			<li><a href="#">Errands</a>
		</ul>
	</div>
	
    </jsp:body>
</t:main>