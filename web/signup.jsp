<%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:56 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đăng ký</title>
</head>
<body>
<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<div class="inner-header">
    <div class="container">
        <div class="pull-left">
            <h6 class="inner-title">Đăng kí</h6>
        </div>
        <div class="pull-right">
            <div class="beta-breadcrumb">
                <a href="index.jsp">Home</a> / <span>Đăng kí</span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="container">
    <div id="content">

        <form action="doRegister" method="post" class="beta-form-checkout" name="myForm"
              onsubmit="return validateForm()">
            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-6">

                    <h4>Đăng kí</h4>
                    <div class="space20">&nbsp;</div>

                    <div class="form-block">
                        <label for="email">Email address* </label>
                        <input type="email" id="email" name="email" required>
                        <p style="font-size: 14px;color: red;font-style: italic;"><%
                            if (request.getAttribute("err_email") != null) {
                                out.print(request.getAttribute("err_email"));
                            }
                        %></p>
                    </div>
                    <div class="form-block">
                        <label for="name">Fullname*</label>
                        <input type="text" id="name" name="fullName" required>
                    </div>

                    <div class="form-block">
                        <label for="address">Address*</label>
                        <input type="text" id="address" name="address" required>
                    </div>

                    <div class="form-block">

                        <label for="phone">Phone* </label>
                        <input type="text" id="phone" name="phone" required>
                        <p style="font-size: 14px;color: red;font-style: italic;"><%
                            if (request.getAttribute("err_phone") != null) {
                                out.print(request.getAttribute("err_phone"));
                            }
                        %></p>
                    </div>
                    <div class="form-block">
                        <label for="pass">Password*</label>
                        <input type="password" id="pass" name="password" required>
                    </div>
                    <div class="form-block">
                        <label for="re-password">Re password*</label>
                        <input type="password" id="re-password" name="re_password" required>
                        <p style="font-size: 14px;color: red;font-style: italic;"><%
                            if (request.getAttribute("err_pass") != null) {
                                out.print(request.getAttribute("err_pass"));
                            }
                        %></p>
                    </div>
                    <div class="form-block">
                        <button type="submit" class="btn btn-primary" name="">Register</button>
                    </div>
                </div>
                <div class="col-sm-3"></div>
            </div>
        </form>
    </div> <!-- #content -->
</div> <!-- .container -->
<script type="text/javascript">
    // JavaScript Document
    function validateForm() {
//Tên phải được điền
        var ten = document.forms["myForm"]["ten"].value;
        if (ten == "") {
            alert("Trường không được để trống");
            return false;
        }
//Email phải được điền chính xác
        var email = document.forms["myForm"]["email"].value;
        var aCong = email.indexOf("@");
        var dauCham = email.lastIndexOf(".");
        if (email == "") {
            alert("Email không được để trống");
            return false;
        } else if ((aCong < 1) || (dauCham < aCong + 2) || (dauCham + 2 > email.length)) {
            alert("Email bạn điền không chính xác");
            return false;
        }
//Nhập số điện thoại
        var phone = document.forms["myForm"]["phone"].value;
        var checkPhone = isNaN(phone);
        if (phone == "") {
            alert("Điện thoại không được để trống");
            return false;
        }
        if (checkPhone == true) {
            alert("Điện thoại phải để ở định dạng số");
            return false;
        }
    }
</script>
<%--ENDCONTENT--%>
<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
