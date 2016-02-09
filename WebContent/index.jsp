<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<style>
	.what-is-gopher{
		border-top:1px solid gray;
		padding-top:40px;
	}
	.btn{
		border: 2px solid #FFFFFF;
		color: #989898;
		background-color:rgba(255,255,255,0.6); 		
	}
</style>	
<t:main>
	<jsp:body>
	<div class="jumbotron text-center">
		
		<div class="gopher homespacer">	
			<img src="assets/img/cute_gopher.png">		
		
			<div id="title-text" class="vert-align">			
   				<div class="monty-font" ><strong>gopher</strong></div> 
				<p>Need something done? Get someone to <i>gopher</i> it!</p> 
				<form class="form-inline">
   					<a href="/Gopher/login.jsp"><button type="button" class="btn btn-outline btn-lg spacer" style="background: #989898;">log in</button></a>
   					<a href="/Gopher/signup.jsp"><button type="button" class="btn btn-outline btn-lg" style="background: #989898;">sign up</button></a>
 					</form> 
 				</div> 
 			</div>  		
   	</div> 
   	   		  
   	
   	<div id='what-is-gopher' class="block-text vert-align container-fluid bg-grey block-size fill"> 
 			<h2 class="text-center">What is <span class="monty-font" style="font-size:60px;">gopher?</span></h2>
 			<p class ="text-center" style="width: 960px;"> 
 			Gopher is an app designed to help users request or undertake
 			errands - errands can range from personal shopping to dog
 			walking!<br /><br />
 			Sign up as a Gopher to fulfill errands and earn great rewards or 
 			register as a customer and make life simple.
 			</p>
	</div>
	</jsp:body>
</t:main>