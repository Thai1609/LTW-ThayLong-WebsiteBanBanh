<%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Đặt hàng</title>
</head>
<body>
<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<div class="inner-header">
    <div class="container">
        <div class="pull-left">
            <h6 class="inner-title">Đặt hàng</h6>
        </div>
        <div class="pull-right">
            <div class="beta-breadcrumb">
                <a href="index.jsp">Trang chủ</a> / <span>Đặt hàng</span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="container">
    <div id="content">
        <%
            if (session.getAttribute("Auth") != null) {
                Users u = (Users) session.getAttribute("Auth");
        %>
        <form action="doCheckout" method="post" class="beta-form-checkout">
            <div class="row">
                <div class="col-sm-6">
                    <h4>Đặt hàng</h4>
                    <div class="space20">&nbsp;</div>

                    <div class="form-block disabled">
                        <label for="name">Họ tên*</label>
                        <input type="text" id="name" value="<%=u.getFullName()%>" name="hoten">
                    </div>
                    <div class="form-block">
                        <label>Giới tính </label>
                        <input type="radio" class="input-radio" name="gender" value="1" checked="checked"
                               style="width: 10%"><span style="margin-right: 10%">Nam</span>
                        <input type="radio" class="input-radio" name="gender" value="0"
                               style="width: 10%"><span>Nữ</span>
                    </div>

                    <div class="form-block ">
                        <label for="email">Email*</label>
                        <input type="email" id="email" value="<%=u.getEmail()%>" name="email">
                    </div>

                    <div class="form-block">
                        <label for="address">Địa chỉ*</label>
                        <input type="text" id="address" required name="address" value="<%=u.getAddress()%>">
                    </div>


                    <div class="form-block">
                        <label for="phone">Điện thoại*</label>
                        <input type="text" id="phone" required name="phoneNumber" value="<%=u.getPhone()%>">
                    </div>

                    <div class="form-block">
                        <label for="notes">Ghi chú</label>
                        <textarea id="notes" name="note"></textarea>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class="your-order">
                        <div class="your-order-head"><h5>Đơn hàng của bạn</h5></div>
                        <div class="your-order-body" style="padding: 0px 10px">
                            <div class="your-order-item">
                                <div>
                                    <% if (c != null) {
                                        Iterator<Products> it = c.list().iterator();
                                        Products p;
                                        while (it.hasNext()) {
                                            p = it.next();
                                    %>
                                    <div class="media">
                                        <a class="pull-left" href="#"><img src="<%=p.getImage()%>"
                                                                           alt="" width="80" height="80"></a>
                                        <div class="media-body">
                                            <p class="font-large"><%=p.getName()%>
                                            </p>
                                            <span class="color-gray your-order-info">Color: Red</span>
                                            <span class="color-gray your-order-info">Size: M</span>
                                            <span class="color-gray your-order-info">Qty: <%=p.getQuantity()%></span>
                                        </div>
                                    </div>
                                    <%
                                            }
                                        }
                                    %>
                                    <!-- end one item -->
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div class="your-order-item">
                                <div class="pull-left "><p class="your-order-f18">Tổng tiền: <%= nf.format(c != null ? c.total() : 0)%>
                                    VNĐ </p></div>
                                <div class="pull-right"><h5 class="color-black"></h5></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                        <div class="your-order-head"><h5>Hình thức thanh toán</h5></div>

                        <div class="your-order-body">
                            <ul class="payment_methods methods">
                                <li class="payment_method_bacs">
                                    <input id="payment_method_bacs" type="radio" class="input-radio"
                                           name="payment_method" value="COD" checked="checked"
                                           data-order_button_text="">
                                    <label for="payment_method_bacs">Thanh toán khi nhận hàng </label>
                                    <div class="payment_box payment_method_bacs" style="display: block;">
                                        Cửa hàng sẽ gửi hàng đến địa chỉ của bạn, bạn xem hàng rồi thanh toán tiền cho
                                        nhân viên giao hàng
                                    </div>
                                </li>

                                <li class="payment_method_cheque">
                                    <input id="payment_method_cheque" type="radio" class="input-radio"
                                           name="payment_method" value="ATM" data-order_button_text="">
                                    <label for="payment_method_cheque">Chuyển khoản </label>
                                    <div class="payment_box payment_method_cheque" style="display: none;">
                                        Chuyển tiền đến tài khoản sau:
                                        <br>- Số tài khoản: 123 456 789
                                        <br>- Chủ TK: Nguyễn A
                                        <br>- Ngân hàng ACB, Chi nhánh TPHCM
                                    </div>
                                </li>

                            </ul>
                        </div>

                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">Đặt hàng <i class="fa fa-chevron-right"></i>
                            </button>
                        </div>
                    </div> <!-- .your-order -->
                </div>
            </div>
        </form>
        <%}%>
    </div> <!-- #content -->
</div> <!-- .container -->
<%--ENDCONTENT--%>

<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
