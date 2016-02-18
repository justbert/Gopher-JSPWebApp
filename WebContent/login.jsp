<%@page import="utils.Login"%>
<%@page import="models.User"%>
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

<%
String email = request.getParameter("email");
if(email != null) {
	if(Login.verifyEmail(email)) {
		if(Login.verifyPassword(email, request.getParameter("password"))) {
			User current = Login.getUser(email);
			if(current != null) {
				session.setAttribute("userObject", current);
			}
			response.sendRedirect("dashboard.jsp");
		} else {
			%>
			<script type="text/javascript">
				alert("Password is incorrect. Please try again.");
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
			alert("This email has not been registered.");
		</script>
		<%	
	}
}
%>

<t:main>
	<jsp:body>
		<div class="bg-teal pad-nav-bar">
			<img class="img-responsive" style="margin:auto;padding:20px 0px;" src="assets/img/cute_gopher.png"></img>
		</div>
			<div class="bg-white">
				<div class="w_960">
			       <form class="block-display" id="login-form" action="login.jsp" method="post">
					 <h2 class="monty-font">Sign in</h2>
					 <input class="block-display" type="text" placeholder="Email" name="email"/>
					 <input class="block-display" type="password" placeholder="Password" name="password" />
					 <button class="btn btn-default bg-grey" type="submit">Sign in</button>
				</form>
				</div>
			</div>
    </jsp:body>
</t:main>