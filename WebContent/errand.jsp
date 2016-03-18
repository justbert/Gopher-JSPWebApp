<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Errand" %>
<%@page import="daos.ErrandDao" %>
<%@page import="entities.Task" %>
<%@page import="entities.Rating" %>
<%@ taglib  prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page import="java.io.*, java.net.*,java.util.*"%>

<%-- Language Declaration and Resource Bundle --%>
<% 
String lang = request.getParameter( "lang" );
if ( lang == null){ lang = "en";}
  ResourceBundle RB = ResourceBundle.getBundle("com.lang.i18n.text", new Locale(lang));
%> 

<%-- Variable Declarations --%>
<%! String reviews, stars, leaveReview, anon, rating; %>

<%-- Variable Initializations --%>
<% 
  reviews = RB.getString("reviews"); 
  stars = RB.getString("stars"); 
  leaveReview = RB.getString("leaveReview"); 
  anon = RB.getString("anon"); 
  rating = RB.getString("rating"); 
%>

<jsp:include page="header.jsp"/>

<style>
	.jumbotron p {
  		font-size: 14px;
	}
</style>

<!-- Page Content -->
<!-- <div class="pad-nav-bar pad-me-please"></div> -->
<div class="row bg-teal jumbotron">
    <div class="col-md-8 col-md-offset-2">
        <div class="thumbnail ">
            <img src="assets/img/gopher_small.png" alt="Slide 1"/>
            <div class="caption-full">
                <h4 class="pull-right">$ ${errand.getRewardId().getRewardValue()}</h4>
                <h4><a href="#"style="color: black;">${errand.getName() }</a>
                </h4>
                <p>${errand.getDescription()}</p>
            </div>
            <div class="ratings">
                <p class="pull-right">${ratingsList.size()} <%=reviews %></p>
                <p>
                	<a href="/Gopher/profile?id=${errand.getUserIdCustomer().getId()}">${errand.getUserIdCustomer().getUsername()}</a>'s <%=rating %>:
                    <c:forEach begin="1" end="${customerAverage}">
                	<span class="glyphicon glyphicon-star"></span>
                	</c:forEach>
                    <c:forEach begin="1" end="${5-customerAverage}">
                	<span class="glyphicon glyphicon-star-empty"></span>
                	</c:forEach>
                    ${customerAverage} <%=stars %>
                </p>
            </div>
        </div>

        <div class="well bg-white">
            <div class="text-right">
                <a class="btn btn-success"><%=leaveReview %></a>
            </div>
            <c:forEach items="${ratingsList}" var="rating">
            <hr>
            <div class="row">
                <div class="col-md-12">
                	<c:forEach begin="1" end="${rating.ratingValue}">
                	<span class="glyphicon glyphicon-star"></span>
                	</c:forEach>
                    <c:forEach begin="1" end="${5-rating.ratingValue}">
                	<span class="glyphicon glyphicon-star-empty"></span>
                	</c:forEach>
                    <%=anon %>
                    <span class="pull-right">${rating.creationDate}</span>
					<p><c:out value="${rating.comments}"/></p>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- /.container -->


<!-- jQuery -->
<script type="text/javascript" src="assets/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<jsp:include page="footer.jsp"/>
