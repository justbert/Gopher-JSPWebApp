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
		
		.tabs {
			display: table;
			margin: 0 auto;
		}
	</style>
	
    <div class="container-fluid profile-header text-center">
		<img class="img-circle" src="img/profile_img.jpg" >
		<h2>Skye Turriff</h2>
	</div>
	
	<div>
		<ul class="tabs nav nav-pills">
			<li class="active"><a href="#">Profile</a></li>
			<li><a href="#">Errands</a></li>
		</ul>
	</div>
	
    </jsp:body>
</t:main>