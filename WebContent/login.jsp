<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<style>	
	#login-form{
		padding: 20px 0px;
		margin: 0 auto;
		text-align: center;
	}
	
	#login-form h2 {
		margin: 20px;	
	}
	
	#login-form input{
		margin:20px auto;
		margin-top:0px;
		height:40px;
		width:350px;
	}
	
</style>
<t:main>
	<jsp:body>
		<div class="bg-teal pad-nav-bar">
			<img class="img-responsive" style="margin:auto;padding:20px 0px;" src="assets/img/cute_gopher.png"></img>
		</div>
			<div class="bg-white">
				<div class="w_960">
			       <form class="block-display" id="login-form">
					 <h2 class="monty-font">Sign in</h2>
<!-- 					 <label>Email address</label> -->
					 <input class="block-display" type="text" placeholder="Email"/>
<!-- 					 <label>Password</label> -->
					 <input class="block-display" type="password" placeholder="Password" />
					 <button class="btn btn-default bg-grey" type="submit">Sign in</button>
				</form>
				</div>
			</div>
    </jsp:body>
</t:main>