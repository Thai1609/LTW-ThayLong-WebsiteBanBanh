<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="vn.edu.hcmuaf.nlu.DAO.*" %>
<%@ page import="vn.edu.hcmuaf.nlu.Model.*" %>
<%@ page import="vn.edu.hcmuaf.nlu.Util.Util" %>
<%@ page import="java.text.NumberFormat" %>

<%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:47 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link href='http://fonts.googleapis.com/css?family=Dosis:300,400' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/dest/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/dest/vendors/colorbox/example3/colorbox.css">
    <link rel="stylesheet" href="assets/dest/rs-plugin/css/settings.css">
    <link rel="stylesheet" href="assets/dest/rs-plugin/css/responsive.css">
    <link rel="stylesheet" title="style" href="assets/dest/css/style.css">
    <link rel="stylesheet" href="assets/dest/css/animate.css">
    <link rel="stylesheet" title="style" href="assets/dest/css/huong-style.css">
</head>
<body>

<div id="header">
    <div class="header-top">
        <div class="container">
            <div class="pull-left auto-width-left">
                <ul class="top-menu menu-beta l-inline">
                    <li><a href=""><i class="fa fa-home"></i> Đại học Nông Lâm Tp.hcm, Thủ đức ,Tp.Hcm </a></li>
                    <li><a href=""><i class="fa fa-phone"></i>0343651367 </a></li>
                </ul>
            </div>
            <div class="pull-right auto-width-right">
                <ul class="top-details menu-beta l-inline">
                    <%
                        if (session.getAttribute("Auth") != null) {
                            Users u = (Users) session.getAttribute("Auth");

                    %>
                    <li><a href="" class="fa fa-user"> Xin chào <%=u.getFullName()%>
                    </a>
                    </li>
                    <%if (u.getLevel() >= 2) {%>
                    <li><a href="admin.jsp">Trang quản trị</a></li>
                    <%}%>
                    <li><a href="doLogout">Đăng xuất</a></li>
                    <%
                    } else {
                    %>
                    <li><a href="" class="fa fa-user"> Bạn chưa đăng nhập
                    </a></li>
                    <li><a href="signup.jsp">Đăng kí</a></li>
                    <li><a href="login.jsp">Đăng nhập</a></li>
                    <%
                        }
                    %>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div> <!-- .container -->
    </div> <!-- .header-top -->
    <div class="header-body">
        <div class="container beta-relative">
            <div class="pull-left">
                <a href="index.jsp" id="logo"><img src="assets/dest/images/logo_saigon_2.png" width="200" alt=""></a>
            </div>
            <div class="pull-right beta-components space-left ov">
                <div class="space10">&nbsp;</div>
                <div class="beta-comp">
                    <form role="search" id="searchform" action="doSearch" method="post">
                        <input type="text" value="" name="key" id="s" placeholder="Nhập từ khóa..."/>
                        <button class="fa fa-search" type="submit" id="searchsubmit"></button>
                    </form>
                </div>
                <div class="beta-comp">
                    <div class="cart">
                        <%
                            Cart c = (Cart) session.getAttribute("Cart");
                            int count = c == null ? 0 : c.list().size();
                        %>
                        <div class="beta-select"><i class="fa fa-shopping-cart">
                            <%if (count == 0) {%>
                            Giỏ hàng (trống)
                            <%
                            } else {
                            %>
                            Giỏ hàng <%=count%>
                            <%}%>
                        </i>
                            <i class="fa fa-chevron-down"></i>
                        </div>
                        <div class="beta-dropdown cart-body">
                            <div class="cart-item">
                                <% if (c != null) {
                                    Iterator<Products> it = c.list().iterator();
                                    Products p;
                                    while (it.hasNext()) {
                                        p = it.next();
                                %>
                                <div class="media">
                                    <a class="pull-left" href="#"><img src="<%=p.getImage()%>"
                                                                       alt=""></a>
                                    <div class="media-body">
                                        <span class="cart-item-title"><%=p.getName()%></span>
                                        <span class="cart-item-amount"><%=p.getQuantity()%> *<span>SP</span></span>
                                    </div>
                                </div>
                                <%
                                        }
                                    }
                                %>
                            </div>
                           <% NumberFormat nf = NumberFormat.getInstance();
                            nf.setMinimumIntegerDigits(0);%>
                            <div class="cart-caption">
                                <div class="cart-total">Tổng tiền:
                                    <span class="cart-total-value"><%= nf.format(c != null ? c.total() : 0)%> VNĐ
                                    </span>
                                </div>
                                <div class="clearfix"></div>
                                <div class="center">
                                    <div class="space10">&nbsp;</div>
                                    <a href="shopping_cart.jsp" class="beta-btn primary text-center">Xem
                                        giỏ hàng<i
                                                class="fa fa-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>

                    </div> <!-- .cart -->
                </div>
            </div>
            <div class="clearfix"></div>
        </div> <!-- .container -->
    </div> <!-- .header-body -->
    <div class="header-bottom" style="background-color: #0277b8;">
        <div class="container">
            <a class="visible-xs beta-menu-toggle pull-right" href="#"><span
                    class='beta-menu-toggle-text'>Menu</span>
                <i class="fa fa-bars"></i></a>
            <div class="visible-xs clearfix"></div>
            <nav class="main-menu">
                <ul class="l-inline ov">
                    <li><a href="index.jsp">Trang chủ</a></li>
                    <li><a href="#">Sản phẩm</a>
                        <ul class="sub-menu">
                            <% Type_ProductDAO type_productDAO = new Type_ProductDAO();
                                ArrayList<Type_Product> listType = type_productDAO.getListProductType();
                                for (int i = 0; i < listType.size(); i++) { %>
                            <li>
                                <a href="<%=Util.fullPath("doProductByType?id_type="+listType.get(i).getId())%>"><%=listType.get(i).getName()%>
                                </a>
                            </li>
                            <%}%>
                        </ul>
                    </li>
                    <li><a href="about.jsp">Giới thiệu</a></li>
                    <li><a href="contacts.jsp">Liên hệ</a></li>
                </ul>
                <div class="clearfix"></div>
            </nav>
        </div> <!-- .container -->
    </div> <!-- .header-bottom -->
</div> <!-- #header -->
</body>
</html>
