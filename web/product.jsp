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
    <title>Product</title>
</head>
<body>
<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<div class="container">
    <div id="content">
        <div class="row">
            <% NumberFormat nf1 = NumberFormat.getInstance();
                nf.setMinimumIntegerDigits(0);
                double themPhi = 0.0;
            %>
            <div class="col-sm-9">
                <%
                    if (session.getAttribute("AuthProduct") != null) {
                        Products products = (Products) session.getAttribute("AuthProduct");
                %>
                <div class="row">
                    <div class="col-sm-4">
                        <img src="<%=products.getImage()%>" alt="" style="width: 270px; height: 320px">
                    </div>
                    <div class="col-sm-8">
                        <div class="single-item-body">
                            <p class="single-item-title"
                               style=" font-weight: bold;  font-size: 20px"><%=products.getName()%>
                            </p>
                            <p class="single-item-price">
                                <span><%=nf1.format(products.getUnit_price())%> VNĐ</span>
                            </p>
                        </div>

                        <div class="clearfix"></div>
                        <div class="space20">&nbsp;</div>

                        <div class="single-item-desc">
                            <p><%=products.getDescription()%>
                            </p>
                        </div>
                        <div class="space20">&nbsp;</div>

                        <p>Options:</p>
                        <div class="single-item-options">
                            <select class="wc-select" name="size">
                                <option>Size</option>
                                <option value="XS">XS</option>
                                <option value="S">S</option>
                                <option value="M">M</option>
                                <option value="L">L</option>
                                <option value="XL">XL</option>
                            </select>
                            <a class="add-to-cart" href="<%=Util.fullPath("AddCart?id="+products.getId())%>"><i
                                    class="fa fa-shopping-cart"></i></a>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <div class="space40">&nbsp;</div>
                <div class="woocommerce-tabs">
                    <ul class="tabs">
                        <li><a href="#tab-description">Description</a></li>
                        <li><a href="#tab-reviews">Reviews (0)</a></li>
                    </ul>

                    <div class="panel" id="tab-description">
                        <p></p>
                    </div>
                    <div class="panel" id="tab-reviews">
                        <p>No Reviews</p>
                    </div>
                </div>
                <%
                    }
                %>
                <div class="space50">&nbsp;</div>
                <div class="beta-products-list">
                    <% ProductDAO spDAO = new ProductDAO();
                        ArrayList<Products> listProductHot = spDAO.getDSHot();
                        String p1 = "", p2 = "";
                        int start1 = 0;
                        int end1 = 3;
                        if (end1 < listProductHot.size()) {
                            end1 =3;
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

                        ArrayList<Products> listHot = spDAO.getListSPByPage(listProductHot, start1, end1);
                    %>
                    <h4>Sản phẩm liên quan</h4>
                    <div class="beta-products-details">
                        <p class="pull-left">Tìm thấy <%=listHot.size()%> sản phẩm
                        </p>
                        <div class="clearfix"></div>
                    </div>
                    <div class="row">
                        <% for (Products listH : listHot) {%>
                        <div class="col-sm-4">
                            <div class="single-item">
                                <div class="single-item-header">
                                    <a href="<%=Util.fullPath("doProduct?id="+listH.getId())%>"><img
                                            src="<%=listH.getImage()%>" alt=""
                                            style="width: 270px;height: 320px ; background-image: none; background-repeat: no-repeat; background-position: center center; "></a>
                                </div>
                                <div class="single-item-body">
                                    <p class="single-item-title"><%=listH.getName()%>
                                    </p>
                                    <p class="single-item-price">
                                        <span><%=nf1.format(listH.getUnit_price())%>  VNĐ</span>
                                    </p>
                                </div>
                                <div class="single-item-caption">
                                    <a class="add-to-cart pull-left" href="#"><i
                                            class="fa fa-shopping-cart"></i></a>
                                    <a class="beta-btn primary"
                                       href="<%=Util.fullPath("doProduct?id="+listH.getId())%>">Details <i
                                            class="fa fa-chevron-right"></i></a>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <%}%>
                    </div>
                    <div class="space40">&nbsp;</div>
                    <ul class="pagination">
                        <% int x, y;
                            int limit1 = listProductHot.size() / 6;
                            if (limit1 * 6 < listProductHot.size()) {
                                limit1++;
                            }
                            for (int z = 1; z <= limit1; z++) {
                                x = (z - 1) * 6;
                                y = z * 6;
                                if (y > listProductHot.size()) {
                                    y = listProductHot.size();
                                }

                        %>
                        <li ><a href="product.jsp?start=<%=x%>&end=<%=y%>"><%=z%>
                        </a></li>
                        <% }%>
                    </ul>
                </div> <!-- .beta-products-list -->
            </div>

            <div class="col-sm-3 aside">
                <div class="widget">
                    <% ProductDAO sp = new ProductDAO();
                        ArrayList<Products> listProductSale = new ProductDAO().getDSHot();
                        int startSale = 0;
                        int endSale = 5;
                        if (listProductSale.size() < 5) {
                            endSale = listProductSale.size();
                        }
                        ArrayList<Products> list = spDAO.getListSPByPage(listProductSale, startSale, endSale);
                    %>
                    <h3 class="widget-title">Sản phẩm bán chạy</h3>
                    <div class="widget-body">
                        <div class="beta-sales beta-lists">
                            <% for (Products listSL : list) {%>
                            <div class="media beta-sales-item">
                                <a class="pull-left" href="<%=Util.fullPath("doProduct?id="+listSL.getId())%>"><img
                                        src="<%=listSL.getImage()%>" alt=""
                                        style="width: 55px;height: 58px  ; background-image: none; background-repeat: no-repeat; background-position: center center; "></a>
                                <div class="media-body">
                                    <%=listSL.getName()%>
                                    <span class="beta-sales-price"><%=nf1.format(listSL.getUnit_price())%> VNĐ</span>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div> <!-- best sellers widget -->
                <div class="widget">
                    <% ProductDAO spNew = new ProductDAO();
                        ArrayList<Products> listProductNew = new ProductDAO().getAll();
                        int startNew = 0;
                        int endNew = 5;
                        if (listProductNew.size() < 5) {
                            endNew = listProductNew.size();
                        }
                        ArrayList<Products> listNew = spNew.getListSPByPage(listProductNew, startNew, endNew);
                    %>
                    <h3 class="widget-title">Sản phẩm mới</h3>
                    <div class="widget-body">

                        <div class="beta-sales beta-lists">
                            <% for (Products listNewP : listNew) {%>
                            <div class="media beta-sales-item">
                                <a class="pull-left" href="<%=Util.fullPath("doProduct?id="+listNewP.getId())%>"><img
                                        src="<%=listNewP.getImage()%>" alt=""
                                        style="width: 55px;height: 58px ; background-image: none; background-repeat: no-repeat; background-position: center center; "></a>
                                <div class="media-body">
                                    <%=listNewP.getName()%>
                                    <span class="beta-sales-price"><%=listNewP.getUnit_price()%> VNĐ</span>
                                </div>
                            </div>
                            <%}%>
                        </div>
                    </div>
                </div> <!-- best sellers widget -->
            </div>
        </div>
    </div> <!-- #content -->
</div> <!-- .container -->
<%--ENDCONTENT--%>
<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
