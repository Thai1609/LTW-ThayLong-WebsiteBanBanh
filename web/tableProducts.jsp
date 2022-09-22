<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.nlu.DAO.ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.nlu.Model.Products" %>
<%@ page import="vn.edu.hcmuaf.nlu.Util.Util" %>
<%@ page import="vn.edu.hcmuaf.nlu.DAO.Type_ProductDAO" %>
<%@ page import="vn.edu.hcmuaf.nlu.Model.Type_Product" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Admin</title>
    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>
<body id="page-top">
<%
    if (session.getAttribute("Auth") != null) {
        Users u = (Users) session.getAttribute("Auth");
%>
<!-- Page Wrapper -->
<div id="wrapper">
    <!-- DataTales Example -->
    <div class="card shadow mb-4">
        <div class="card-header py-3">
            <button name="btnAdd" class="btn btn-primary" data-toggle="modal" data-target="#modalChangeForm"><i
                    class="fa fa-plus"></i> Thêm sản phẩm mới
            </button>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Giá (VNĐ)</th>
                        <th>Trong kho</th>
                        <th>Ngày tạo</th>
                        <th>Chỉnh sửa</th>
                        <th>Xóa</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Tên sản phẩm</th>
                        <th>Hình ảnh</th>
                        <th>Giá (VNĐ)</th>
                        <th>Trong kho</th>
                        <th>Ngày tạo</th>
                        <th>Chỉnh sửa</th>
                        <th>Xóa</th>
                    </tr>
                    </tfoot>
                    <% NumberFormat nf1 = NumberFormat.getInstance();
                        nf1.setMinimumIntegerDigits(0);
                        double themPhi = 0.0;
                    %>
                    <tbody>
                    <%
                        ProductDAO productDAO = new ProductDAO();
                        ArrayList<Products> listProduct = productDAO.getAll();
                        for (Products list : listProduct) {
                    %>
                    <tr>
                        <td><%=list.getName()%>
                        </td>
                        <td><img src="<%=list.getImage()%>" width="80" height="80"></td>
                        <td><%=nf1.format(list.getUnit_price())%>
                        </td>
                        <td><%=list.getStock()%>
                        </td>
                        <td>6/12/2018</td>
                        <td>
                            <button class="btn btn-primary" data-toggle="modal" data-target="#modalUpdateForm">
                                <a class="beta-btn primary" href="<%=Util.fullPath("ChangeProduct?id="+list.getId())%>"><i
                                        class="fa fa-pencil-alt" style="color: white"></i></a>
                            </button>
                        </td>
                        <td>
                            <button class="btn btn-danger" <%--data-toggle="modal" data-target="#modalDeleteForm"--%>>
                             <a href="<%=Util.fullPath("DeleteProduct?id="+list.getId())%>" ><i class="fa fa-trash" style="color: white"></i></a>
                            </button>
                        </td>
                    </tr>
                    <%}%>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalDeleteForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <!-- Button -->
            <div class="form-group">
                <div class="row">
                    <div class="col-md-6"><p>Bạn có muốn xóa sản phẩm?</p></div>
                    <div class="col-md-6">
                        <div class="row">
                            <div class="col-md-2">
                            </div>
                            <div class="col-md-4p">
                                <% for (Products list : listProduct) {%>
                                <button name="btnAdd" class="btn btn-danger" type="submit"><a
                                        href="<%=Util.fullPath("DeleteProduct?id="+list.getId())%>"></a></button>
                                <%}%>
                            </div>
                            <div class="col-md-3">
                                <button name="btnCancel" class="btn btn-primary">Hủy</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalChangeForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal" action="AddProduct" method="post">
                <!-- Form Name -->
                <legend>Thêm sản phẩm</legend>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12  control-label" for="product_name">Tên sản phẩm*</label>
                    <div class="col-md-12 ">
                        <input id="product_name" name="product_name" class="form-control input-md"
                               required="" type="text">
                    </div>
                </div>
                <!-- Select Basic -->
                <div class="form-group">
                    <label class="col-md-12  control-label" for="product_type">Loại sản phẩm*</label>
                    <div class="col-md-12 ">

                        <select id="product_type" name="product_type" class="form-control">
                            <% Type_ProductDAO type_productDAO = new Type_ProductDAO();
                                ArrayList<Type_Product> listType = type_productDAO.getListProductType();
                                for (int i = 0; i < listType.size(); i++) { %>
                            <option value="<%=listType.get(i).getId()%>"><%=listType.get(i).getName()%>
                            </option>
                            <%}%>
                        </select>

                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12  control-label" for="available_quantity">Số lượng sản phẩm*</label>
                    <div class="col-md-12 ">
                        <input id="available_quantity" name="quantity"
                               class="form-control input-md" placeholder="ví dụ: 20" required="" type="number" min="1"
                               max="10">
                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12 control-label" for="price">Giá sản phẩm*</label>
                    <div class="col-md-12">
                        <input id="price" name="price_product"
                               class="form-control input-md" required="" type="text">
                    </div>
                </div>
                <!-- Textarea -->
                <div class="form-group">
                    <label class="col-md-12 control-label" for="product_description">Mô tả về sản phẩm</label>
                    <div class="col-md-12">
                        <textarea class="form-control" id="product_description" name="description"></textarea>
                    </div>
                </div>

                <!-- Text input-->
                <%--  <div class="form-group">
                      <label class="col-md-12 control-label" for="online_date">Ngày cập nhật</label>
                      <div class="col-md-12">
                          <input id="online_date" name="online_date" class="form-control input-md"
                                 required="" type="date">
                      </div>
                  </div>
          --%>
                <!-- Text input-->
                <div class="form-group">
                    <!-- File Button -->
                    <div class="form-group">
                        <label class="col-md-12 control-label" for="filebutton">Ảnh sản phẩm*</label>
                        <div class="col-md-12">
                            <input id="filebutton" name="filebutton" class="input-file" type="file">
                        </div>
                    </div>
                    <!-- Button -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6"></div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-2">
                                    </div>
                                    <div class="col-md-4p">
                                        <button name="btnAdd" class="btn btn-primary" type="submit">Thêm</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%
    if (session.getAttribute("changeProduct") != null) {
        Products products = (Products) session.getAttribute("changeProduct");
%>
<div class="modal fade" id="modalUpdateForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal" action="UpdateProduct" method="post">
                <!-- Form Name -->
                <legend>Chỉnh sửa sản phẩm</legend>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12  control-label" for="productName">Tên sản phẩm*</label>
                    <div class="col-md-12">
                        <input id="productName" name="product_name" class="form-control input-md"
                               required="" type="text" value="<%=products.getName()%>">
                    </div>
                </div>
                <!-- Select Basic -->
                <div class="form-group">
                    <label class="col-md-12 control-label" for="productType">Loại sản phẩm*</label>
                    <div class="col-md-12">

                        <select id="productType" name="product_type" class="form-control">
                            <% Type_ProductDAO type_productDAO1 = new Type_ProductDAO();
                                ArrayList<Type_Product> listType1 = type_productDAO1.getListProductType();
                                for (int i = 0; i < listType1.size(); i++) { %>
                            <option value="<%=listType1.get(i).getId()%>"><%=listType1.get(i).getName()%>
                            </option>
                            <%}%>
                        </select>

                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12 control-label" for="quantity">Số lượng sản phẩm*</label>
                    <div class="col-md-12">
                        <input id="quantity" name="quantity"
                               class="form-control input-md" placeholder="ví dụ: 20" required="" type="number" min="1"
                               max="10"
                               value="<%=products.getStock()%>">
                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12 control-label" for="price1">Giá sản phẩm*</label>
                    <div class="col-md-12">
                        <input id="price1" name="price_product"
                               class="form-control input-md" required="" type="number"
                               value="<%=nf1.format(products.getUnit_price())%>">
                    </div>
                </div>
                <!-- Textarea -->
                <div class="form-group">
                    <label class="col-md-12 control-label" for="productDescription">Mô tả về sản phẩm</label>
                    <div class="col-md-12">
                        <textarea class="form-control" id="productDescription"
                                  name="description"><%=products.getDescription()%></textarea>
                    </div>
                </div>

                <!-- Text input-->
                <%--  <div class="form-group">
                      <label class="col-md-12 control-label" for="online_date">Ngày cập nhật</label>
                      <div class="col-md-12">
                          <input id="online_date" name="online_date" class="form-control input-md"
                                 required="" type="date">
                      </div>
                  </div>
          --%>
                <!-- Text input-->
                <div class="form-group">
                    <!-- File Button -->
                    <div class="form-group">
                        <label class="col-md-12 control-label" for="file_button">Ảnh sản phẩm*</label>
                        <div class="col-md-12">
                            <input id="file_button" name="image" class="input-file" type="file">
                        </div>
                    </div>
                    <!-- Button -->
                    <div class="form-group">
                        <div class="row">
                            <div class="col-md-6"></div>
                            <div class="col-md-6">
                                <div class="row">
                                    <div class="col-md-6">
                                        <button name="btnAdd" class="btn btn-primary" type="submit">Cập nhật</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<%
        }
    }
%>
<!-- Bootstrap core JavaScript-->
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="js/sb-admin-2.min.js"></script>

<!-- Page level plugins -->
<script src="vendor/datatables/jquery.dataTables.min.js"></script>
<script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
<!-- Page level custom scripts -->
<script src="js/demo/datatables-demo.js"></script>

</body>
</html>
