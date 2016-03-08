<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.Errand" %>
<%@page import="daos.ErrandDao" %>
<%@page import="entities.Task" %>
<%@ taglib  prefix = "c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp"/>

<!-- Page Content -->
<div class="pad-nav-bar"></div>
<div class="row bg-teal">
    <div class="col-md-8 col-md-offset-2">
        <div class="thumbnail ">
            <img src="assets/img/gopher_small.png" alt="Slide 1"/>
            <div class="caption-full">
                <h4 class="pull-right">$ ${errand.getRewardId().getRewardValue()}</h4>
                <h4><a href="#"style="color: black;">${errand.getName() }</a>
                </h4>
                <p></p>
                <p></p>
                <p>${errand.getDescription() }</p>
            </div>
            <div class="ratings">
                <p class="pull-right">3 reviews</p>
                <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star-empty"></span>
                    4.0 stars
                </p>
            </div>
        </div>

        <div class="well bg-white">
            <div class="text-right">
                <a class="btn btn-success">Leave a Review</a>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star-empty"></span>
                    Anonymous
                    <span class="pull-right">10 days ago</span>
                    <p>This product was great in terms of quality. I would definitely buy another!</p>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star-empty"></span>
                    Anonymous
                    <span class="pull-right">12 days ago</span>
                    <p>I've alredy ordered another one!</p>
                </div>
            </div>
            <hr>
            <div class="row">
                <div class="col-md-12">
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star-empty"></span>
                    Anonymous
                    <span class="pull-right">15 days ago</span>
                    <p>I've seen some better than this, but not at this price. I definitely recommend this errand.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container -->


<!-- jQuery -->
<script type="text/javascript" src="assets/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
<jsp:include page="footer.jsp"/>
