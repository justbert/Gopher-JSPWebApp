<!DOCTYPE html>
<%@page import="utils.RegisterUser"%>
<%@page import="entities.User"%>
<%@page import="utils.Login"%>
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
		<form class="block-display" id="login-form" method="post">
			 <h2>Join <span class="monty-font">Gopher</span> today.</h2>
			 <label>Email address</label>
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
	</jsp:body>
</t:main>

<%
String email = request.getParameter("email");
if(email != null) {
	if(!RegisterUser.verifyEmail(email)) {
		if(request.getParameter("password").equals(request.getParameter("passwordConfirm"))) {
			if(RegisterUser.registerUser(email, request.getParameter("password"))) {
				User current = Login.getUser(email);
				if(current != null) {
					session.setAttribute("userObject", current);
				}
				response.sendRedirect("dashboard.jsp");
			} else {
				%>
				<script type="text/javascript">
					alert("Registration failed, please try again.");
				</script>
				<%	
			}
		} else {
			%>
			<script type="text/javascript">
				alert("Passwords do not match.");
			</script>
			<%
		}
	} else if(email.equals("")) {
		%>
		<script type="text/javascript">
			alert("Please enter an email.");
		</script>
		<%
	} else {
		%>
		<script type="text/javascript">
			alert("This email has already been registered.");
		</script>
		<%	
	}
}
%>