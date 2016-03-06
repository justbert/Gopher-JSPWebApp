<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"/>

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
	.blacktext{
		color:black;
	}"WebContent/assets/css/main-style.css"
</style>	
		<div class="jumbotron text-center bg-teal">
			<div class="gopher homespacer">	
				<img src="assets/img/cute_gopher.png">		
				<div id="title-text" class="vert-align">			
	   				<div class="monty-font" ><strong>gopher</strong></div> 
					<p>Need something done? Get someone to <i>gopher</i> it!</p> 
					<form class="form-inline">
	   					<a href="/Gopher/login.jsp"><button type="button" class="btn btn-outline btn-lg spacer">log in</button></a>
	   					<a href="/Gopher/signup.jsp"><button type="button" class="btn btn-outline btn-lg">sign up</button></a>
	 				</form> 
	 			</div> 
	 		</div>  				
	   	</div>
 	
   	<div id='what-is-gopher' class="block-text vert-align container-fluid bg-white block-size fill blacktext"> 
 		<h2 class="text-center blacktext">What is <span class="monty-font blacktext" style="font-size:60px;">gopher?</span></h2>
 		<p class ="text-center blacktext" style="width: 960px;"> 
 		Gopher is an app designed to help users request or undertake
 		errands - errands can range from personal shopping to dog
 		walking!<br /><br />
 		Sign up as a Gopher to fulfill errands and earn great rewards or 
 		register as a customer and make life simple.
 		</p>
	</div>
<jsp:include page="footer.jsp"/>