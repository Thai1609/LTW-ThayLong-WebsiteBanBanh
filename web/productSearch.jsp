<%--
  Created by IntelliJ IDEA.
  User: MAD
  Date: 12/12/2019
  Time: 11:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tìm kiếm</title>
</head>
<body>
<%@ include file="header.jsp" %>
<div class="container">
    <div id="content" class="space-top-none">
        <div class="main-content">
            <div class="space60">&nbsp;</div>
            <div class="row">
                <div class="col-sm-12">
                    <div class="beta-products-list">
                        <h4>Tìm kiếm</h4>
                        <% ProductDAO spDAO = new ProductDAO();
                            if (session.getAttribute("name") != null) {
                                ArrayList<Products> listProductByKey = new ProductDAO().getSearch((String) session.getAttribute("name"));
                                String page1 = "", page2 = "";
                                int start = 0;
                                int end = 4;
                                if (end < listProductByKey.size()) {
                                    end = 4;
                                } else {
                                    end = listProductByKey.size();
                                }
                                if (request.getParameter("start") != null) {
                                    page1 = request.getParameter("start");
                                    start = Integer.parseInt(page1);
                                }
                                if (request.getParameter("end") != null) {
                                    page2 = request.getParameter("end");
                                    end = Integer.parseInt(page2);
                                }

                                ArrayList<Products> list1 = spDAO.getListSPByPage(listProductByKey, start, end);
                        %>
                        <div class="beta-products-details">
                            <p class="pull-left">Tìm thấy <%=list1.size()%> sản phẩm</p>
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
                                            <span><%= sp.getUnit_price()%> VNĐ</span>
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
                            <%
                                }
                            %>
                        </div>
                        <div class="space50">&nbsp;</div>
                        <ul class="pagination">
                            <% int a, b;
                                int limit = listProductByKey.size() / 4;
                                if (limit * 4 < listProductByKey.size()) {
                                    limit++;
                                }
                                for (int i = 1; i <= limit; i++) {
                                    a = (i - 1) * 4;
                                    b = i * 4;
                                    if (b > listProductByKey.size()) {
                                        b = listProductByKey.size();
                                    }

                            %>
                            <li class="page active"><a href="productSearch.jsp?start=<%=a%>&end=<%=b%>"><%=i%>
                            </a></li>
                            <%}%>
                        </ul>

                        <%
                            }
                        %>
                    </div> <!-- .beta-products-list -->
                    <div class="space50">&nbsp;</div>
                </div>
            </div> <!-- end section with sidebar and main content -->
        </div> <!-- .main-content -->
    </div> <!-- #content -->
</div> <!-- .container -->
<%@ include file="footer.jsp" %>
</body>
</html>