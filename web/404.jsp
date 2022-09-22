<%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:57 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
</head>
<body>
<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>

<%--CONTENT--%>
<section class="bg-gray">
    <div class="inner-header">
        <div class="container">
            <div class="pull-left">
                <h6 class="inner-title">Page Not Found</h6>
            </div>
            <div class="pull-right">
                <div class="beta-breadcrumb font-large">
                    <a href="#">Pages</a> / <span>Page 404</span>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>

    <div class="container">
        <div id="content" class="space-top-none space-bottom-none">
            <div class="abs-fullwidth bg-gray">
                <div class="space100">&nbsp;</div>
                <div class="space80">&nbsp;</div>
                <div class="container text-center">
                    <h2>Oops! That Page Can’t Be Found!</h2>
                    <div class="space40">&nbsp;</div>
                    <img src="assets/dest/images/404.jpg" alt="">
                    <div class="space30">&nbsp;</div>
                    <p>It looks like nothing was found at this location. Maybe try to use a search?</p>
                    <form role="search" method="get" id="searchform" action="/">
                        <input type="text" value="" name="s" id="s" placeholder="Search entire store here..."/>
                        <button class="fa fa-search" type="submit" id="searchsubmit"></button>
                    </form>
                </div>
                <div class="space100">&nbsp;</div>
                <div class="space30">&nbsp;</div>
            </div>
        </div> <!-- #content -->
    </div> <!-- .container -->
</section>
<%--ENDCONTENT--%>

<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
