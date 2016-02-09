<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<style>
	.form-signin-heading{
		margin:0px 0px 0px 0px;
		padding: 50px 0px 10px 0px;
	}
	
	.form-signin {
		width: 50%;
		margin-right: auto;
		margin-left: auto;
	}
	
	.form-signin input {
		padding: 3px;
		margin-top: 10px;
	}
</style>
<t:main>
	<jsp:body>
		<div class="bg-teal pad-nav-bar">
			<img class="img-responsive" style="margin:auto;padding:20px 0px;" src="assets/img/cute_gopher.png"></img>
		</div>
			<div class="bg-white">
				<div class="w_960">
			        <form class="form-signin">
						<h2 class="form-signin-heading">Please sign in</h2>
						<input type="text" class="form-control" placeholder="Username" required autofocus>
						<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
						<br/>
						<button class="btn btn-lg btn-primary" type="submit">Sign in</button>
					</form>
				</div>
			</div>
    </jsp:body>
</t:main>