<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:main>
	<jsp:body>
	<div class="form-signin" style="width: inherit;">
        <form class="form-signin">
			<h2 class="form-signin-heading">Please sign in</h2>
			<input type="text" class="form-control" placeholder="Username" required autofocus>
			<input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
	<!-- 		<div class="checkbox"> -->
	<!-- 			<input type="checkbox" value="remember-me" placeholder="Remember me"> -->
	<!-- 		</div> -->
			<button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
		</form>
	</div>
    </jsp:body>
</t:main>