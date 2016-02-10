<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags"%>

<t:main>
<jsp:body>
<jsp:useBean id="taskBean" class="models.Task"/>
<jsp:useBean id="userBean" class="models.User"/>
<jsp:setProperty name="userBean" property="username" value="Josh" />
<!-- Page Content -->
<div class="pad-nav-bar"></div>
<div class="row bg-teal" style="height:95%">
    <div class="col-md-8 col-md-offset-2">
        <div class="thumbnail ">
            <img src="http://lorempixel.com/1500/200/food/5" alt="Slide 1"/>
            <div class="caption-full">
                <h4 class="pull-right">$24.99</h4>
                <h4><a href="#"style="color: black;"><jsp:getProperty name="taskBean" property="taskName"/></a> <!--  apparently property name is case sensitive, and needs to be 1st char lowercase-->
                </h4>
                <p><jsp:getProperty name="userBean" property="username"/></p>
                <p>Blah Blah</p>
                <p><jsp:getProperty name="taskBean" property="taskDescription"/></p>
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
                    <p>I've seen some better than this, but not at this price. I definitely recommend this item.</p>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- /.container -->


<!-- jQuery -->
<script type="text/javascript" src="assets/js/jquery-2.2.0.min.js"></script>
<script type="text/javascript" src="assets/bootstrap/js/bootstrap.min.js"></script>
</jsp:body>
</t:main>
