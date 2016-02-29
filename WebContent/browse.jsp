<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%
 String sessionEmail = request.getParameter("emailLogin");

if (sessionEmail == null){
	sessionEmail = request.getSession().getAttribute("emailLogin").toString();
}

%>
<style>
	.pad-me-please{
		margin-top:50px;
	}
	#product-wrapper{
		padding:40px;
	}
	
</style>
<t:main>
<jsp:body>
<!-- Page Content -->
		<div class="bg-teal pad-nav-bar">
			<div id="carousel" class="carousel slide pad-me-please" data-ride="carousel">
    			<!-- Menu -->
			    <ol class="carousel-indicators">
			        <li data-target="#carousel" data-slide-to="0" class="active"></li>
			        <li data-target="#carousel" data-slide-to="1"></li>
			        <li data-target="#carousel" data-slide-to="2"></li>
			    </ol>  
			    <!-- Items -->
			    <div class="carousel-inner">			        
			        <div class="item active">
			            <img src="http://lorempixel.com/1500/400/food/5" alt="Slide 1"/>
			        </div>
			        <div class="item">
			            <img src="http://lorempixel.com/1500/400/cats/5" alt="Slide 2"/>
			        </div>
			        <div class="item">
			            <img src="http://lorempixel.com/1500/400/people/5" alt="Slide 3"/>
			        </div>
			    </div> 
			    <a href="#carousel" class="left carousel-control" data-slide="prev">
			        <span class="glyphicon glyphicon-chevron-left"></span>
			    </a>
			    <a href="#carousel" class="right carousel-control" data-slide="next">
			        <span class="glyphicon glyphicon-chevron-right"></span>
			    </a>
			</div>
		</div>
		<div class="bg-white fill">
				<div class="w_960" id="product-wrapper">
		            <div class="col-sm-4 col-lg-4 col-md-4">
		                 <div class="thumbnail">
		                     <img src="assets/img/gopher_small.png" alt="">
		                     <div class="caption">
		                         <h4 class="pull-right">$24.99</h4>
		                         <h4>
								 <a href="item.jsp" style="color: black;">Pick up my Groceries</a>
		                         </h4>
		                         <p>This is a sample Gopher Task that can be selected and an item info page loads</p>
		                     </div>
		                     <div class="ratings">
		                         <p class="pull-right">15 reviews</p>
		                         <p>
		                             <span class="glyphicon glyphicon-star"></span>
		                             <span class="glyphicon glyphicon-star"></span>
		                             <span class="glyphicon glyphicon-star"></span>
		                             <span class="glyphicon glyphicon-star"></span>
		                             <span class="glyphicon glyphicon-star"></span>
		                         </p>
		                     </div>
		                 </div>
		            </div>
	                <div class="col-sm-4 col-lg-4 col-md-4">
	                     <div class="thumbnail">
	                         <img src="assets/img/gopher_small.png" alt="">
	                         <div class="caption">
	                             <h4 class="pull-right">$64.99</h4>
	                             <h4>
								 <a href="#" style="color: black;">Second Product</a>
	                             </h4>
	                             <p>This is a sample Gopher Task that can be selected and an item info page loads</p>
	                         </div>
	                         <div class="ratings">
	                             <p class="pull-right">12 reviews</p>
	                             <p>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star-empty"></span>
	                             </p>
	                         </div>
	                     </div>
	                </div>
	                <div class="col-sm-4 col-lg-4 col-md-4">
	                     <div class="thumbnail">
	                         <img src="assets/img/gopher_small.png" alt="">
	                         <div class="caption">
	                             <h4 class="pull-right">$74.99</h4>
	                             <h4>
								 <a href="#" style="color: black;">Third Product</a>
	                             </h4>
	                             <p>This is a sample Gopher Task that can be selected and an item info page loads</p>
	                         </div>
	                         <div class="ratings">
	                             <p class="pull-right">31 reviews</p>
	                             <p>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star-empty"></span>
	                             </p>
	                         </div>
	                     </div>
	                </div>
	                <div class="col-sm-4 col-lg-4 col-md-4">
	                     <div class="thumbnail">
	                         <img src="assets/img/gopher_small.png" alt="">
	                         <div class="caption">
	                             <h4 class="pull-right">$84.99</h4>
	                             <h4>
								 <a href="#" style="color: black;">Fourth Product</a>
	                             </h4>
	                             <p>This is a sample Gopher Task that can be selected and an item info page loads</p>
	                         </div>
	                         <div class="ratings">
	                             <p class="pull-right">6 reviews</p>
	                             <p>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star"></span>
	                                 <span class="glyphicon glyphicon-star-empty"></span>
	                                 <span class="glyphicon glyphicon-star-empty"></span>
	                             </p>
	                         </div>
	                     </div>
	                </div>
					<div class="col-sm-4 col-lg-4 col-md-4">
						<div class="thumbnail">
	                            <img src="assets/img/gopher_small.png" alt="">
							<div class="caption">
	                      		<h4 class="pull-right">$94.99</h4>
	                      		<h4>
								<a href="#" style="color: black;">Fifth Product</a>
	                     		</h4>
	                     		<p>This is a sample Gopher Task that can be selected and an item info page loads</p>
	                 		</div>
	                 		<div class="ratings">
	                     		<p class="pull-right">18 reviews</p>
	                    		<p>
		                         	<span class="glyphicon glyphicon-star"></span>
		                         	<span class="glyphicon glyphicon-star"></span>
		                         	<span class="glyphicon glyphicon-star"></span>
		                         	<span class="glyphicon glyphicon-star"></span>
		                         	<span class="glyphicon glyphicon-star-empty"></span>
	                     		</p>
							</div>
						</div>
					</div>
				</div>
			</div>
<script type="text/javascript" src="assets/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$('.carousel').carousel({
			interval : 3000
		})
	});
</script>
</jsp:body>
</t:main>