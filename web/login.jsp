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
    <title>Đăng nhập</title>
</head>
<body>
<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<div class="inner-header">
    <div class="container">
        <div class="pull-left">
            <h6 class="inner-title">Đăng nhập</h6>
        </div>
        <div class="pull-right">
            <div class="beta-breadcrumb">
                <a href="index.jsp">Home</a> / <span>Đăng nhập</span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="container">
    <div id="content">
        <form class="beta-form-checkout" action="doLogin" method="post">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">
                    <p style="font-size: 14px;color: red;font-style: italic;"><%
                        if (request.getAttribute("err") != null) {
                            out.print(request.getAttribute("err"));
                        }
                    %></p>
                    <h4>Đăng nhập</h4>
                    <div class="space20">&nbsp;</div>
                    <div class="form-block">
                        <label for="email">Email*</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-block">
                        <label for="pass">Password*</label>
                        <input type="password" id="pass" name="pass" required>
                    </div>
                    <div class="form-block">
                        <button type="submit" class="btn btn-primary">Login</button>
                        <div class="row">
                            <div class="col-sm-3"></div>
                            <div class="col-sm-9"><a>Quên mật khẩu?</a></div>
                        </div>
                    </div>

                </div>
                <div class="col-sm-3"></div>
            </div>
        </form>
    </div> <!-- #content -->
</div> <!-- .container -->

<%--ENDCONTENT--%>
<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
