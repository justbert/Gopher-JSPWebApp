<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
<jsp:include page="/header.jsp"/>
	<div class="bg-teal pad-nav-bar">
		<form class="block-display" id="login-form" method="post">
			 <h2>Join <span class="monty-font">Gopher</span> today.</h2>
			 <label>Username</label>
			 <input class="block-display" type="text" name="username" />
			 <label>Email Address</label>
			 <input class="block-display" type="email" name="email" />
			 <label>Password</label>
			 <input class="block-display" type="password" name="password"/>
			 <label>Confirm Password</label>
			 <input class="block-display" type="password" name="passwordConfirm"/>
			 
			 <button class="btn btn-default">Sign me up!</button>
		</form>
	</div>
	<div class="bg-white fill">
		<div style="width:200px;text-align:center;margin:0 auto;padding-top:20px">
			<img width="200px" src="/Gopher/assets/img/logo.gif" />
		</div>
	</div>
<jsp:include page="/footer.jsp"/>