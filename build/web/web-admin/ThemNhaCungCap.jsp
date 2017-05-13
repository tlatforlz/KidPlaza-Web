<%-- 
    Document   : ThemNhaCungCap
    Created on : May 8, 2017, 9:20:17 PM
    Author     : tranl
--%>


<%@page import="DAO.NHANVIEN_DAO"%>
<%@page import="DTO.KHACHHANG"%>
<%@page import="DAO.KHACHHANG_DAO"%>
<%@page import="DTO.BINHLUAN"%>
<%@page import="DAO.BINHLUAN_DAO"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DAO.LOAISANPHAM_DAO"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Collections"%>
<%@page import="DTO.SANPHAM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SANPHAM_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Thêm nhà cung cấp </title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- Bootstrap Core CSS -->
        <link href="web-admin/css/bootstrap.min.css" rel='stylesheet' type='text/css' />
        <!-- Custom CSS -->
        <link href="web-admin/css/style.css" rel='stylesheet' type='text/css' />
        <!-- Graph CSS -->
        <link href="web-admin/css/lines.css" rel='stylesheet' type='text/css' />
        <link href="web-admin/css/font-awesome.css" rel="stylesheet"> 
        <!-- jQuery -->
        <script src="web-admin/js/jquery.min.js"></script>
        <!----webfonts--->
        <link href='http://fonts.googleapis.com/css?family=Roboto:400,100,300,500,700,900' rel='stylesheet' type='text/css'>
        <!---//webfonts--->  
        <!-- Nav CSS -->
        <link href="web-admin/css/custom.css" rel="stylesheet">
        <!-- Metis Menu Plugin JavaScript -->
        <script src="web-admin/js/metisMenu.min.js"></script>
        <script src="web-admin/js/custom.js"></script>
        <!-- Graph JavaScript -->
        <script src="web-admin/js/d3.v3.js"></script>
        <script src="web-admin/s/rickshaw.js"></script>
        <script>
            var CKEDITOR_BASEPATH = 'js/ckeditor/';
        </script>

        <script src="js/ckeditor/ckeditor.js" type="text/javascript"></script> 
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
    </head>
    <body>


        <%
            String username = (String) request.getSession().getAttribute("username");
            if (username == null) {
        %>

        <jsp:forward page="/Admin" />

        <%
            }
            NHANVIEN_DAO nv_dp = new NHANVIEN_DAO();
            String Quyen = nv_dp.getQuyen(username);

        %>
        <div id="wrapper">
            <!-- Navigation -->
            <nav class="top1 navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                </div>
                <!-- /.navbar-header -->
                <ul class="nav navbar-nav navbar-right">

                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle avatar" data-toggle="dropdown">Xin chào <%=username%></a>
                        <ul class="dropdown-menu">
                            <li class="dropdown-menu-header text-center">
                                <strong>Tài Khoản</strong>
                            </li>
                            <li class="m_2"><a href="DangXuatAdmin"><i class="fa fa-lock"></i> Đăng Xuất</a></li>	
                        </ul>
                    </li>
                </ul>

                <div class="navbar-default sidebar" role="navigation">
                    <div class="sidebar-nav navbar-collapse">
                        <ul class="nav" id="side-menu">
                            <%
                                if (Quyen.equals("CTV")) {
                            %>

                            <li>
                                <a href="#"><i></i>Sản Phẩm<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ThemPhieuNhap">Thêm Phiếu Nhập</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachPhieuNhap">Danh sách Phiếu Nhập</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachSanPham">Danh sách sản phẩm</a>
                                    </li>
                                    <li>
                                        <a href="ThemSanPham">Thêm sản phẩm</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i></i>Danh Mục<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachDanhMuc">Danh sách danh mục</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Nhà cung cấp<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ThemNhaCungCap?yc=Them">Thêm nhà cung cấp</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachNhaCungCap">Danh sách nhà cung cấp</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Bình luận<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachBinhLuan">Danh sách bình luận</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Khách hàng<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachKhachHang">Danh sách khách hàng</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i></i>Đơn Đặt Hàng<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DuyetDonDatHang">Duyệt Đơn Đặt Hàng</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachDonDatHang">Danh Sách Đơn Đặt Hàng</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <%
                            } else {
                            %>
                            <li>
                                <a href="DoanhThu"><i class="fa fa-dashboard fa-fw nav_icon"></i>Trang Chính</a>
                            </li>

                            <li>
                                <a href="#"><i></i>Thống Kê<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DoanhThu">Doanh Thu</a>
                                    </li>
                                    <li>
                                        <a href="ThongKeTruyCap">Lượt truy cập</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Sản Phẩm<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ThemPhieuNhap">Thêm Phiếu Nhập</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachPhieuNhap">Danh sách Phiếu Nhập</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachSanPham">Danh sách sản phẩm</a>
                                    </li>
                                    <li>
                                        <a href="ThemSanPham">Thêm sản phẩm</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>

                            <li>
                                <a href="#"><i></i>Danh Mục<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachDanhMuc">Danh sách danh mục</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Nhà cung cấp<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="ThemNhaCungCap?yc=Them">Thêm nhà cung cấp</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachNhaCungCap">Danh sách nhà cung cấp</a>
                                    </li>
                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Bình luận<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachBinhLuan">Danh sách bình luận</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Khách hàng<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DanhSachKhachHang">Danh sách khách hàng</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Tài khoản<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="TaoTaiKhoanHeThong">Tạo tài khoản hệ thống </a>
                                    </li>
                                    <li>
                                        <a href="DanhSachTaiKhoanHeThong">Danh sách tài khoản</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <li>
                                <a href="#"><i></i>Đơn Đặt Hàng<span class="fa arrow"></span></a>
                                <ul class="nav nav-second-level">
                                    <li>
                                        <a href="DuyetDonDatHang">Duyệt Đơn Đặt Hàng</a>
                                    </li>
                                    <li>
                                        <a href="DanhSachDonDatHang">Danh Sách Đơn Đặt Hàng</a>
                                    </li>

                                </ul>
                                <!-- /.nav-second-level -->
                            </li>
                            <%}%>
                        </ul>
                    </div>
                    <!-- /.sidebar-collapse -->
                </div>
                <!-- /.navbar-static-side -->
            </nav>

            <script>
            $(document).ready(function () {
                $("#form-nhacungcap").validate({
                    rules: {
                        sp_name: {
                            required: true
                        },
                        sp_address: {
                            required: true
                        },
                        sp_phone: {
                            required: true,
                            minlength: 10,
                            number: true
                        },
                        sp_email: {
                            required: true,
                            email: true
                        },
                        sp_fax: {
                            required: true
                        }
                    },
                    messages: {
                        sp_name: {
                            required: "Vui lòng nhập tên nhà cung cấp"
                        },
                        sp_address: {
                            required: "Vui lòng nhập địa chỉ nhà cung cấp"
                        },
                        sp_phone: {
                            required: "Vui lòng nhập số điện thoại",
                            minlength: "Số điện thoại không hợp lệ",
                            number: "Số điện thoại không hợp lệ"
                        },
                        sp_email: {
                            required: "Vui lòng nhập email nhà cung cấp",
                            email: "Email không hợp lệ"
                        },
                        sp_fax: {
                            required: "Vui lòng nhập fax"
                        }
                    }
                });
            });
            </script>
            <style>
                #sp_name-error, #sp_address-error, #sp_phone-error, #sp_email-error, #sp_fax-error{
                    color:red;
                }
            </style>
            <script>
                $(document).ready(function () {
                    if (${check =="true"}) {
                        $("#error-name").css("display", "block");
                    }
                });
            </script>
            <div id="page-wrapper" style="background-color: white">
                <div class="graphs">
                    <div class="xs">
                        <h3>Thêm nhà cung cấp</h3>
                        <div class="tab-pane active" id="horizontal-form">
                            <form id="form-nhacungcap" class="form-horizontal" action="ThemMoiNhaCungCap" method="POST">
                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label">Tên nhà cung cấp</label>
                                    <div class="col-sm-8">
                                        <input name="sp_name" type="text" class="form-control1" id="sp_name" placeholder="Tên nhà cung cấp">
                                        <p id="error-name" style="display:none; color:red" >Tên nhà cung cấp đã tồn tại<p>
                                    </div>

                                </div>

                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label">Địa chỉ nhà cung cấp</label>
                                    <div class="col-sm-8">
                                        <input name="sp_address" type="text" class="form-control1" id="sp_address" placeholder="Địa chỉ nhà cung cấp">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label">Email nhà cung cấp</label>
                                    <div class="col-sm-8">
                                        <input name="sp_email" type="text" class="form-control1" id="sp_email" placeholder="Email nhà cung cấp">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label">Điện thoại nhà cung cấp</label>
                                    <div class="col-sm-8">
                                        <input name="sp_phone" type="text" class="form-control1" id="sp_phone" placeholder="Số điện thoại nhà cung cấp">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label">Fax nhà cung cấp</label>
                                    <div class="col-sm-8">
                                        <input name="sp_fax" type="text" class="form-control1" id="sp_fax" placeholder="Fax nhà cung cấp">
                                    </div>
                                </div>

                                <script>
                                    $(document).ready(function () {
                                        $("#add-themnhacungcap").on('click', function () {
                                            console.log("fuck");
                                            $("#form-nhacungcap").submit();
                                        });
                                    });
                                </script>
                                <div class="form-group">
                                    <div class="col-sm-2"></div>
                                    <div class="col-sm-8">
                                        <button id="add-themnhacungcap" type="button" class="btn btn-primary "> <p style="color:black"> Thêm </p> </button>
                                        <button type="button" class="btn btn-warning"> <a href="DanhSachNhaCungCap">Hủy </a> </button>
                                    </div>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
