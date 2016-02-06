<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
	<jsp:body>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="form-signin col-sm-4">
	        <img class="img-responsive" src="assets/img/logo.gif" style="background-color: rgb(153,153,153); width: inherit;"></img>
		</div>
		<div class="col-md-4"></div>
    </div>
	<div class="row">
		<div class="col-md-4"></div>
		<div class="form-signin col-sm-4">
	        <form class="form-signin">
				<h2 class="form-signin-heading">Please sign in</h2>
				<input type="text" class="form-control" placeholder="Username" required autofocus>
				<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
				<br/>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
			</form>
		</div>
		<div class="col-sm-4"></div>
    </div>
    </jsp:body>
</t:main>