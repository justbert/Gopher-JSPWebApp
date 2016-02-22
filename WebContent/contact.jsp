<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
	<jsp:body>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="form-contact col-sm-4">
	        
		</div>
		<div class="col-md-4"></div>
    </div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="form-signin col-sm-4">
			<img class="img-responsive" style="margin:auto;" src="assets/img/cute_gopher.png"></img>
	        <form class="form-contact">
				<h2 class="form-signin-heading">Contact The Gopher Team</h2>
				<input type="text" id ="name" class="form-control" placeholder="Name" required>
				<input type="text" id ="email" class="form-control" placeholder="Email" required>
				<textarea id="message"class="form-control" rows="8" placeholder="Message"></textarea>
				<br/>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Submit</button>
			</form>
		</div>
		<div class="col-sm-4"></div>
    </div>
    </jsp:body>
</t:main>