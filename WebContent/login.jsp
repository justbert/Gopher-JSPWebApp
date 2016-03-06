<%-- <%@page import="utils.Login"%>
<%@page import="models.User"%> --%>
<%@page import="servlets.LoginServlet" %>
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
<jsp:include page="header.jsp"/>
		<div class="bg-teal pad-nav-bar">
			<img class="img-responsive" style="margin:auto;padding:20px 0px;" src="assets/img/cute_gopher.png"></img>
		</div>
		<div class="bg-white">
	    	<form class="block-display" id="login-form" action="loginServlet" method="post">
				<h2 class="monty-font">Sign in</h2>
			 	<input class="block-display" type="text" placeholder="Email" name="email"/>
			 	<input class="block-display" type="password" placeholder="Password" name="password" />
			 	<button class="btn btn-default bg-grey" type="submit">Sign in</button>
			</form>
		</div>
<jsp:include page="footer.jsp"/>