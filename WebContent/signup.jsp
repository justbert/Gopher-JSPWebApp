<!DOCTYPE html>
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
		<div class="w_960" >
			<form class="block-display" id="login-form">
				 <h2>Join <span class="monty-font">Gopher</span> today.</h2>
				 <label>Email address</label>
				 <input class="block-display" type="text" />
				 <label>Password</label>
				 <input class="block-display" type="password" />
				 <label>Confirm Password</label>
				 <input class="block-display" type="password" />
				 
				 <button class="btn btn-default">Sign me up!</button>
			</form>
		</div>
	</div>
	<div class="bg-white fill">
		<div style="width:200px;text-align:center;margin:0 auto;padding-top:20px">
			<img width="200px" src="/Gopher/assets/img/logo.gif" />
		</div>
	</div>
	</jsp:body>
</t:main>
	