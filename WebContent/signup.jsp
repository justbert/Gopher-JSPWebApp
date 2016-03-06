<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib  prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		<form class="block-display" id="login-form" method="post" action="register">
			 <h2>Join <span class="monty-font">Gopher</span> today.</h2>
			 <label>Username</label>
			 <input class="block-display" type="text" name="username" value="${username}">
			 <c:remove var="username"/>
			 <label>Email Address</label>
			 <input class="block-display" type="email" name="email" value="${email}"/>
			 <c:remove var="email"/>
			 <label>Password</label>
			 <input class="block-display" type="password" name="password"/>
			 <label>Confirm Password</label>
			 <input class="block-display" type="password" name="passwordConfirm"/>
			 <button class="btn btn-default">Sign me up!</button>
		</form>
	</div>
	
	<c:if test="${errorList != null}">
		<div class="block-display bg-teal" style="margin-top: 20px;">
			<ul class="block-display">
			<c:forEach items="${errorList}" var="error">
				<li>${error}</li>
			</c:forEach>
			</ul>
		</div>
 		<c:remove var="errorList"/>
	</c:if>
	
	<div class="bg-white fill">
		<div style="width:200px;text-align:center;margin:0 auto;padding-top:20px">
			<img width="200px" src="/Gopher/assets/img/logo.gif" />
		</div>
	</div>
<jsp:include page="/footer.jsp"/>