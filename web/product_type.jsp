<%--  Created by IntelliJ IDEA.
  User: MAD
  Date: 11/18/2019
  Time: 8:58 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Loại sản phẩm</title>
</head>
<body>

<%--HEADER--%>
<%@ include file="header.jsp" %>
<%--ENDHEADER--%>
<%--CONTENT--%>
<% NumberFormat nf1 = NumberFormat.getInstance();
    nf.setMinimumIntegerDigits(0);
    double themPhi = 0.0;
%>
<div class="inner-header">
    <div class="container">
        <div class="pull-left">
            <h6 class="inner-title">Sản phẩm</h6>
        </div>
        <div class="pull-right">
            <div class="beta-breadcrumb font-large">
                <a href="index.jsp">Home</a> / <span>Sản phẩm <%%></span>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<div class="container">
    <div id="content" class="space-top-none">
        <div class="main-content">
            <div class="space60">&nbsp;</div>
            <div class="row">
                <div class="col-sm-3">
                    <ul class="aside-menu">
                        <%
                            for (int i = 0; i < listType.size(); i++) { %>
                        <li>
                            <a href="<%=Util.fullPath("doProductByType?id_type="+listType.get(i).getId())%>"><%=listType.get(i).getName()%>
                            </a>
                        </li>
                        <%}%>
                    </ul>
                </div>

                <div class="col-sm-9">
                    <%
                        ProductDAO spDAO = new ProductDAO();
                        if (session.getAttribute("id") != null) {
                            ArrayList<Products> listProductByType = new Type_ProductDAO().getProductByType((Integer) session.getAttribute("id"));
                            String page1 = "", page2 = "";
                            int start = 0;
                            int end = 15;
                            if (end < listProductByType.size()) {
                                end = 15;
                            } else {
                                end = listProductByType.size();
                            }
                            if (request.getParameter("start") != null) {
                                page1 = request.getParameter("start");
                                start = Integer.parseInt(page1);
                            }
                            if (request.getParameter("end") != null) {
                                page2 = request.getParameter("end");
                                end = Integer.parseInt(page2);
                            }

                            ArrayList<Products> listT = spDAO.getListSPByPage(listProductByType, start, end);
                    %>
                    <div class="beta-products-list">
                        <h4>Sản phẩm mới</h4>
                        <div class="beta-products-details">
                            <p class="pull-left">Tìm thấy <%=listT.size()%> sản phẩm</p>
                            <div class="clearfix"></div>
                        </div>

                        <div class="row">
                            <%
                                for (Products listP : listT) {
                            %>
                            <div class="col-sm-4">
                                <div class="single-item">
                                    <div class="single-item-header">
                                        <a href="<%=Util.fullPath("doProduct?id="+listP.getId())%>"><img
                                                src="<%= listP.getImage()%>" alt="" style="height: 320px "></a>
                                    </div>
                                    <div class="single-item-body">
                                        <p class="single-item-title"><%= listP.getName()%>
                                        </p>
                                        <p class="single-item-price">
                                            <span><%= nf1.format(listP.getUnit_price())%> VNĐ</span>
                                        </p>
                                    </div>
                                    <div class="single-item-caption">
                                        <a class="add-to-cart pull-left"
                                           href="<%=Util.fullPath("AddCart?id="+listP.getId())%>"><i
                                                class="fa fa-shopping-cart"></i></a>
                                        <a class="beta-btn primary"
                                           href="<%=Util.fullPath("doProduct?id="+listP.getId())%>">Details <i
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
                                int limit = listProductByType.size() / 15;
                                if (limit * 15 < listProductByType.size()) {
                                    limit++;
                                }
                                for (int i = 1; i <= limit; i++) {
                                    a = (i - 1) * 15;
                                    b = i * 15;
                                    if (b > listProductByType.size()) {
                                        b = listProductByType.size();
                                    }

                            %>
                            <li><a href="product_type.jsp?start=<%=a%>&end=<%=b%>"><%=i%>
                            </a></li>
                            <%
                                    }
                                }
                            %>
                        </ul>
                    </div> <!-- .beta-products-list -->

                    <div class="space50">&nbsp;</div>
                    <%
                        ArrayList<Products> listProductHot = spDAO.getDSHot();
                        String p1 = "", p2 = "";
                        int start1 = 0;
                        int end1 = 6;
                        if (end1 < listProductHot.size()) {
                            end1 = 6;
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
                    <div class="beta-products-list">
                        <h4>Sản phẩm bán chạy</h4>
                        <div class="beta-products-details">
                            <p class="pull-left">Tìm thấy <%=listHot.size()%> sản phẩm </p>
                            <div class="clearfix"></div>
                        </div>
                        <div class="row">
                            <% for (Products listH : listHot) { %>
                            <div class="col-sm-4">
                                <div class="single-item">
                                    <div class="single-item-header">
                                        <a href="<%=Util.fullPath("doProduct?id="+listH.getId())%>"><img
                                                src="<%= listH.getImage()%>" alt=""
                                                style="width: 270px;height: 320px ; background-image: none; background-repeat: no-repeat; background-position: center center; "></a>
                                    </div>
                                    <div class="single-item-body">
                                        <p class="single-item-title"><%= listH.getName()%>
                                        </p>
                                        <p class="single-item-price">
                                            <span><%= nf1.format(listH.getUnit_price())%> VNĐ</span>
                                        </p>
                                    </div>
                                    <div class="single-item-caption">
                                        <a class="add-to-cart pull-left"
                                           href="<%=Util.fullPath("AddCart?id="+listH.getId())%>"><i
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
                            <li><a href="product_type.jsp?start1=<%=x%>&end1=<%=y%>"><%=z%>
                            </a></li>
                            <%}%>
                        </ul>
                    </div> <!-- .beta-products-list -->
                </div>
            </div> <!-- end section with sidebar and main content -->
        </div> <!-- .main-content -->
    </div> <!-- #content -->
</div> <!-- .container -->
<%--ENDCONTENT--%>
<%--FOOTER--%>
<%@ include file="footer.jsp" %>
<%--ENDFOOTER--%>
</body>
</html>
