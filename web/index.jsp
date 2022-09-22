<%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Trang Chủ </title>
</head>
<body>
<%@ include file="header.jsp" %>
<% NumberFormat nf1 = NumberFormat.getInstance();
    nf1.setMinimumIntegerDigits(0);
    double themPhi = 0.0;
%>
<div class="rev-slider">
    <div class="fullwidthbanner-container">
        <div class="fullwidthbanner">
            <div class="bannercontainer">
                <div class="banner">
                    <ul>
                        <!-- THE FIRST SLIDE -->
                        <%
                            SlideDAO slideDAO = new SlideDAO();
                            ArrayList<Slide> listSlide = slideDAO.getSlide();
                            for (int i = 0; i < listSlide.size(); i++) {
                        %>
                        <!-- THE FIRST SLIDE -->
                        <li data-transition="boxfade" data-slotamount="20" class="active-revslide"
                            style="width: 100%; height: 100%; overflow: hidden; z-index: 18; visibility: hidden; opacity: 0;">
                            <div class="slotholder" style="width:100%;height:100%;" data-duration="undefined"
                                 data-zoomstart="undefined" data-zoomend="undefined" data-rotationstart="undefined"
                                 data-rotationend="undefined" data-ease="undefined" data-bgpositionend="undefined"
                                 data-bgposition="undefined" data-kenburns="undefined" data-easeme="undefined"
                                 data-bgfit="undefined" data-bgfitend="undefined" data-owidth="undefined"
                                 data-oheight="undefined">
                                <div class="tp-bgimg defaultimg" data-lazyload="undefined" data-bgfit="cover"
                                     data-bgposition="center center" data-bgrepeat="no-repeat"
                                     data-lazydone="undefined"
                                     src="image/slide/<%=listSlide.get(i).getImage()%>"
                                     data-src="image/slide/<%=listSlide.get(i).getImage()%>"
                                     style="background-color: rgba(0, 0, 0, 0); background-repeat: no-repeat; background-image: url('image/slide/<%=listSlide.get(i).getImage()%>'); background-size: cover; background-position: center center; width: 100%; height: 100%; opacity: 1; visibility: inherit;">
                                </div>
                            </div>

                        </li>
                        <%}%>
                    </ul>
                </div>
                <div class="tp-bannertimer"></div>
            </div>
        </div>
        <!--slider-->
    </div>
</div>
<div class="container">
    <div id="content" class="space-top-none">
        <div class="main-content">
            <div class="space60">&nbsp;</div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="beta-products-list">
                        <h4>Sản phẩm mới</h4>
                        <% ProductDAO spDAO = new ProductDAO();
                            ArrayList<Products> list = spDAO.getAll();
                            String page1 = "", page2 = "";
                            int start = 0;
                            int end =20;
                            if (end < list.size()) {
                                end = 20;
                            } else {
                                end = list.size();
                            }
                            if (request.getParameter("start") != null) {
                                page1 = request.getParameter("start");
                                start = Integer.parseInt(page1);
                            }
                            if (request.getParameter("end") != null) {
                                page2 = request.getParameter("end");
                                end = Integer.parseInt(page2);
                            }

                            ArrayList<Products> list1 = spDAO.getListSPByPage(list, start, end);
                        %>
                        <div class="beta-products-details">
                            <p class="pull-left">Tìm thấy <%=list.size()%> sản phẩm</p>
                            <div class="clearfix"></div>
                        </div>
                        <div class="row">
                            <% for (Products sp : list1) {
                            %>
                            <div class="col-sm-3">
                                <div class="single-item">
                                    <div class="single-item-header">
                                        <a href="<%=Util.fullPath("doProduct?id="+sp.getId())%>"><img
                                                src="<%= sp.getImage()%>"
                                                alt=""
                                                height="270"></a>
                                    </div>
                                    <div class="single-item-body">
                                        <p class="single-item-title"><%= sp.getName()%>
                                        </p>
                                        <p class="single-item-price">
                                            <span><%= nf.format(sp.getUnit_price())%> VNĐ</span>
                                        </p>
                                    </div>
                                    <div class="single-item-caption">
                                        <%--                                        Thêm sản phẩm vào giỏ hàng--%>
                                        <a class="add-to-cart pull-left"
                                           href="<%=Util.fullPath("AddCart?id="+sp.getId())%>"> <i
                                                class="fa fa-shopping-cart"></i></a>
                                        <%--                                        Lấy chi tiết sản phẩm--%>
                                        <a class="beta-btn primary"
                                           href="<%=Util.fullPath("doProduct?id="+sp.getId())%>">Details <i
                                                class="fa fa-chevron-right"></i></a>
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
                            </div>
                            <%}%>
                        </div>
                        <div class="space50">&nbsp;</div>
                        <ul class="pagination">
                            <% int a, b;
                                int limit = list.size() / 20;
                                if (limit * 20 < list.size()) {
                                    limit++;
                                }
                                for (int i = 1; i <= limit; i++) {
                                    a = (i - 1) * 20;
                                    b = i * 20;
                                    if (b > list.size()) {
                                        b = list.size();
                                    }

                            %>
                            <li class="page"><a class="active" href="index.jsp?start=<%=a%>&end=<%=b%>"><%=i%>
                            </a></li>
                            <%}%>
                        </ul>
                    </div> <!-- .beta-products-list -->

                    <div class="space50">&nbsp;</div>

                    <div class="beta-products-list">
                        <%
                            ArrayList<Products> listProductHot = spDAO.getDSHot();
                            String p1 = "", p2 = "";
                            int start1 = 0;
                            int end1 =4;
                            if (end1 < listProductHot.size()) {
                                end1 = 4;
                            } else {
                                end1 = listProductHot.size();
                            }
                            if (request.getParameter("start1") != null) {
                                p1 = request.getParameter("start1");
                                start1 = Integer.parseInt(p1);
                            }
                            if (request.getParameter("end1") != null) {
                                p2 = request.getParameter("end1");
                                end1 = Integer.parseInt(p2);
                            }
                            ArrayList<Products> list11 = spDAO.getListSPByPage(listProductHot, start1, end1);
                        %>

                        <div class="beta-products-list">
                            <h4>Sản phẩm bán chạy</h4>
                            <div class="beta-products-details">
                                <p class="pull-left">Tìm thấy <%=list11.size()%> sản phẩm
                                </p>
                                <div class="clearfix"></div>
                            </div>
                            <div class="row">
                                <% for (Products listH : list11) {
                                %>
                                <div class="col-sm-3">
                                    <div class="single-item">
                                        <div class="single-item-header">
                                            <a href="<%=Util.fullPath("doProduct?id="+listH.getId())%>"><img
                                                    src="<%= listH.getImage()%>" alt="" height="270"></a>
                                        </div>
                                        <div class="single-item-body">
                                            <p class="single-item-title"><%= listH.getName()%>
                                            </p>
                                            <p class="single-item-price">
                                                <span><%= nf.format(listH.getUnit_price())%> VNĐ</span>
                                            </p>
                                        </div>
                                        <div class="single-item-caption">
                                            <a class="add-to-cart pull-left" href="shopping_cart.jsp"><i
                                                    class="fa fa-shopping-cart"></i></a>
                                            <a class="beta-btn primary"
                                               href="<%=Util.fullPath("doProduct?id="+listH.getId())%>">Details <i
                                                    class="fa fa-chevron-right"></i></a>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                                <% }%>
                            </div>
                            <div class="space40">&nbsp;</div>
                            <ul class="pagination">
                                <% int x, y;
                                    int limit1 = listProductHot.size() / 4;
                                    if (limit1 * 4 < listProductHot.size()) {
                                        limit1++;
                                    }
                                    for (int z = 1; z <= limit1; z++) {
                                        x = (z - 1) * 4;
                                        y = z * 4;
                                        if (y > listProductHot.size()) {
                                            y = listProductHot.size();
                                        }
                                %>
                                <li class="page"><a class="active" href="index.jsp?start1=<%=x%>&end1=<%=y%>"><%=z%>
                                </a></li>
                                <%}%>
                            </ul>
                        </div>
                    </div> <!-- .beta-products-list -->
                </div>
            </div> <!-- end section with sidebar and main content -->
        </div> <!-- .main-content -->
    </div> <!-- #content -->
</div> <!-- .container -->

<%@ include file="footer.jsp" %>

</body>

</html>
