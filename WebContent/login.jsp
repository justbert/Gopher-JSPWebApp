<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<style>
	.form-signin-heading{
		margin:0px 0px 0px 0px;
		padding:20px;
	
	}
</style>
<t:main>
	<jsp:body>
		<div class="bg-teal pad-nav-bar">
			<img class="img-responsive" style="margin:auto;" src="assets/img/cute_gopher.png"></img>
		</div>
		<div class="bg-grey fill">
			<div class="w_960">
		        <form class="form-signin">
					<h2 class="form-signin-heading">Please sign in</h2>
					<input type="text" class="form-control" placeholder="Username" required autofocus>
					<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
					<br/>
					<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
				</form>
			</div>
		</div>
    </jsp:body>
</t:main>