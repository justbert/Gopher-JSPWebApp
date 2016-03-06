<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Errand" %>
<%@page import="daos.ErrandDao" %>
<%@page import="entities.Task" %>
<%@ taglib  prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<style>
	.pad-me-please{
		margin-top:50px;
	}
	#product-wrapper{
		padding:40px;
	}
	
</style>
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
		<div class="bg-white">
				<div id="product-wrapper">
				<%-- <% for(Errand errand : errandList) { %> --%>
				<c:forEach items="${errandList}" var="errand"> 
		            <div class="col-sm-4 col-lg-4 col-md-4">
		                 <div class="thumbnail">
		                     <img src="assets/img/gopher_small.png" alt="">
		                     <div class="caption" id="errand${errand.getId()}">
		                     
		                         <h4 class="pull-right">$ ${errand.getRewardId().getRewardValue()}<%-- <%=errand.getRewardId().getRewardValue() %> --%></h4>
		                         <h4>
								 <a href="/Gopher/errand?id=${errand.getId() }" style="color: black;">${errand.getName()}</a>
		                         </h4>
		                         <p>${errand.getDateCreated() } </p>
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
		            </c:forEach>
		          <%--   <%} %> --%>
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

<jsp:include page="footer.jsp"/>