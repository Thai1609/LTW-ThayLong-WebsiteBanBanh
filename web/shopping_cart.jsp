<%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Shopping card</title>
</head>
<body>

<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<div class="inner-header">
    <div class="container">
        <div class="pull-left">
            <h6 class="inner-title">Shopping Cart</h6>
        </div>
        <div class="pull-right">
            <div class="beta-breadcrumb font-large">
                <a href="index.jsp">Home</a> / <span>Shopping Cart</span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>

<div class="container">
    <div id="content">
        <div class="table-responsive">
            <% NumberFormat nf1 = NumberFormat.getInstance();
                nf1.setMinimumIntegerDigits(0);
                double themPhi = 0.0;
            %>
            <!-- Shop Products Table -->
            <table class="shop_table beta-shopping-cart-table" cellspacing="0">
                <thead>
                <tr>
                    <th class="product-name">Sản phẩm</th>
                    <th class="product-price">Giá</th>
                    <th class="product-status">Trong kho</th>
                    <th class="product-quantity">Số lượng</th>
                    <th class="product-subtotal">Tổng tiền</th>
                    <th class="product-remove">Xóa</th>
                </tr>
                </thead>
                <tbody>
                <%
                    Cart cart = (Cart) session.getAttribute("Cart");
                    Iterator<Products> iterator = cart.list().iterator();
                    Products p;
                    while (iterator.hasNext()) {
                        p = iterator.next();
                %>
                <tr class="cart_item">
                    <td class="product-name">
                        <div class="media">
                            <img class="pull-left" src="<%=p.getImage()%>" alt="" style="width: 80px;height: 80px;">
                            <div class="media-body">
                                <p class="font-large table-title"><%=p.getName()%>
                                </p>
                                <p class="table-option">Size: M</p>
                                <a class="table-edit" href="<%=Util.fullPath("doProduct?id="+p.getId())%>">Edit</a>
                            </div>
                        </div>
                    </td>

                    <td class="product-price">
                        <span class="amount"><%=nf1.format(p.getUnit_price())%> VNĐ</span>
                    </td>

                    <td class="product-status">
                        <%=p.getStock()%>
                    </td>

                    <td class="product-quantity">
                        <form action="<%=Util.fullPath("Update")%>" method="post" >
                            <input type="hidden" name="id" value="<%=p.getId()%>">
                            <input type="number" value="<%=p.getQuantity()%>" min="1" max="5" width="20"
                                   name="quantity">
                            <input type="submit" value="▲">
                        </form>
                    </td>

                    <td class="product-subtotal">
                        <span class="amount"><%=nf1.format(p.getUnit_price() * p.getQuantity())%> VNĐ</span>
                    </td>

                    <td class="product-remove">
                        <a href="<%=Util.fullPath("Delete?id="+p.getId())%>" class="remove" title="Remove this item"><i
                                class="fa fa-trash-o"></i></a>
                    </td>
                </tr>
                <%
                    }
                %>
                </tbody>
                <tfoot>
                <tr>
                    <td colspan="6" class="actions">
                        <div class="coupon">
                            <%--@declare id="coupon_code"--%><label for="coupon_code">Coupon</label>
                            <input type="text" name="coupon_code" value="" placeholder="Coupon code">
                            <button type="submit" class="beta-btn primary" name="apply_coupon">Apply Coupon <i
                                    class="fa fa-chevron-right"></i></button>
                        </div>
                    </td>
                </tr>
                </tfoot>
            </table>

            <!-- End of Shop Table Products -->
        </div>
        <!-- Cart Collaterals -->
        <div class="cart-collaterals">
            <div class="cart-totals pull-right">
                <div class="cart-totals-row"><h5 class="cart-total-title">Hóa đơn</h5></div>
                <div class="cart-totals-row"><span>Tổng tiền theo giá:</span>
                    <span><%=nf1.format(cart.total())%> VNĐ</span></div>
                <div class="cart-totals-row"><span>Phí vận chuyển:</span>
                    <%
                        if (cart.total() >= 1000000) {
                    %>
                    <span> Free ship </span>
                    <% } else {%>
                    <span><%=nf1.format(themPhi = cart.total() * 0.01)%> VNĐ</span>
                    <%}%>
                </div>
                <div class="cart-totals-row"><span>Tổng tiền :</span>
                    <span><%=nf1.format(cart.total() + themPhi)%> VNĐ</span>
                </div>


                <% if (session.getAttribute("Auth") == null) {
                %>
                <button class="beta-btn primary" id="btnSubmit">
                    <a href="login.jsp">Thanh toán</a> <i class="fa fa-chevron-right"></i>
                </button>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $("#btnSubmit").click(function () {
                            alert("Bạn chưa đăng nhập");
                        });
                    });
                </script>
                <%} else {%>

                <%
                    if (cart.total() == 0) {
                %>
                <button class="beta-btn primary" id="btnSubmit"><a>Thanh toán</a> <i
                        class="fa fa-chevron-right"></i></button>
                <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
                <script>
                    $(document).ready(function () {
                        $("#btnSubmit").click(function () {
                            alert("Không có gì trong giỏ hàng!");
                        });
                    });
                </script>
                <%} else {%>
                <button class="beta-btn primary">
                    <a href="checkout.jsp">Thanh toán</a> <i
                        class="fa fa-chevron-right"></i>
                </button>
                <%
                        }
                    }
                %>
            </div>
            <div class="clearfix"></div>
        </div>
        <!-- End of Cart Collaterals -->
        <div class="clearfix"></div>
    </div> <!-- #content -->
</div> <!-- .container -->
<%--ENDCONTENT--%>
<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
