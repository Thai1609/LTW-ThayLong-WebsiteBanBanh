<%@ page import="java.util.ArrayList" %>
<%@ page import="vn.edu.hcmuaf.nlu.DAO.UserDAO" %>
<%@ page import="vn.edu.hcmuaf.nlu.Model.Users" %>
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
            <%if (u.getLevel() < 3) {%>
            <button name="btnAdd" id="btnAdd" class="btn btn-primary"><i
                    class="fa fa-plus"></i> Thêm người dùng mới
            </button>
            <%} else {%>
            <button name="btnAdd" class="btn btn-primary" data-toggle="modal" data-target="#modalChangeFormUser"><i
                    class="fa fa-plus"></i> Thêm người dùng mới
            </button>
            <%}%>
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
            <script>
                $(document).ready(function () {
                    $("#btnAdd").click(function () {
                        alert("Bạn phải là admin!");
                    });
                });
            </script>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                    <thead>
                    <tr>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Quyền cấp</th>
                        <th>Ngày tạo</th>
                        <th>Chỉnh sửa</th>
                        <th>Xóa</th>
                    </tr>
                    </thead>
                    <tfoot>
                    <tr>
                        <th>Họ và tên</th>
                        <th>Email</th>
                        <th>Quyền cấp</th>
                        <th>Ngày tạo</th>
                        <th>Chỉnh sửa</th>
                        <th>Xóa</th>
                    </tr>
                    </tfoot>
                    <tbody>
                    <% UserDAO userDAO = new UserDAO();
                        ArrayList<Users> listU = userDAO.getAllUser();
                        for (Users users : listU) {
                    %>

                    <tr>
                        <td><%=users.getFullName()%>
                        </td>
                        <td><%=users.getEmail()%>
                        </td>
                        <td>
                            <%if (users.getLevel() == 1) { %>
                            Người dùng
                            <%} %>
                            <% if (users.getLevel() == 2) {%>
                            Quản lý
                            <%}%>
                            <% if (users.getLevel() == 3) {%>
                            Admin
                            <%}%>
                        </td>
                        <td><%=users.getCREATED_TIME()%>
                        </td>
                        <td>
                            <button>Chỉnh sửa</button>
                        </td>
                        <td>
                            <button>Xóa</button>
                        </td>
                    </tr>

                    <%}%>

                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="modalChangeFormUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <form class="form-horizontal" action="addUser" method="post">
                <!-- Form Name -->
                <legend>Thêm người dùng</legend>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12  control-label" for="fullName">Họ và tên*</label>
                    <div class="col-md-12 ">
                        <input id="fullName" name="fullName" class="form-control input-md"
                               required="" type="text" placeholder="Nguyễn Văn A">
                    </div>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12  control-label" for="email">Email*</label>
                    <div class="col-md-12 ">
                        <input id="email" name="email"
                               class="form-control input-md" placeholder="name@gmail.com" required="" type="email">
                    </div>
                    <p style="font-size: 14px;color: red;font-style: italic;"><%
                        if (request.getAttribute("err_email") != null) {
                            out.print(request.getAttribute("err_email"));
                        }
                    %></p>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12 control-label" for="password">Password*</label>
                    <div class="col-md-12">
                        <input id="password" name="password"
                               class="form-control input-md" required="" type="password">
                    </div>
                </div>

                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12 control-label" for="phone">Số điện thoại*</label>
                    <div class="col-md-12">
                        <input id="phone" name="phone"
                               class="form-control input-md" required="" type="tel">
                    </div>
                    <p style="font-size: 14px;color: red;font-style: italic;"><%
                        if (request.getAttribute("err_phone") != null) {
                            out.print(request.getAttribute("err_phone"));
                        }
                    %></p>
                </div>
                <!-- Text input-->
                <div class="form-group">
                    <label class="col-md-12  control-label" for="address">Address*</label>
                    <div class="col-md-12 ">
                        <input id="address" name="address" class="form-control input-md" required="" type="text">
                    </div>
                </div>
                <!--Radio input -->
                <div class="form-group">
                    <label class="col-md-12  control-label" >Cấp quyền*</label>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="level" id="inlineRadio1"
                               value="1">
                        <label class="form-check-label" for="inlineRadio1">Người dùng</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="level" id="inlineRadio2"
                               value="2">
                        <label class="form-check-label" for="inlineRadio2">Quản lý</label>
                    </div>
                    <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="level" id="inlineRadio3"
                               value="3">
                        <label class="form-check-label" for="inlineRadio2">Admin</label>
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
            </form>
        </div>
    </div>
</div>
<%}%>
</body>
</html>
