<%-- 
    Document   : DanhSachSanPham
    Created on : Mar 29, 2017, 12:32:15 AM
    Author     : tranl
--%>

<%@page import="DAO.NHANVIEN_DAO"%>
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
        <title>Danh sách sản phẩm </title>
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

            <div id="page-wrapper" style="background-color: white">
                <div class="graphs">
                    <h3>Thêm loại </h3>
                    <script>
            $(document).ready(function () {
                $("#themdanhmuc").validate({
                    rules: {
                        tendanhmuc: {
                            required: true
                        }
                    },
                    messages: {
                        tendanhmuc: {
                            required: "Nhập tên danh mục"
                        }
                    }
                });
            });
                    </script>
                    <style>
                        #tendanhmuc-error{
                            color:red;
                        }
                    </style>
                    <div class="tab-pane active" id="horizontal-form">
                        <form id="themdanhmuc" class="form-horizontal" action="ThemDanhMuc" method="POST">
                            <script>
                                if(${dup == "dup"}){
                                    alert("Tên danh mục đã tồn tại");
                                }
                            </script>
                            <div class="form-group">
                                <label for="focusedinput" class="col-sm-2 control-label">Tên Danh Mục</label>
                                <div class="col-sm-8">
                                    <input name="tendanhmuc" type="text" class="form-control1" id="tendanhmuc" placeholder="Tên danh mục">
                                    <p id="dup"style="color:red; display: none">Tên danh mục đã tồn tại</p>
                                </div>
                                <button type="submit" class="btn-success btn"> Add </button>
                               
                            </div>
                             
                        </form>
                    </div>
                    </hr>
                    <hr>
                    <div class="xs">
                        <%
                            LOAISANPHAM_DAO loai_sp = new LOAISANPHAM_DAO();
                            ArrayList<LOAISANPHAM> list = loai_sp.getLoaiSanPham();
                        %>
                        <h3>Danh sách loại</h3>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã Loại</th>
                                    <th>Tên Loại</th>
                                    <th>Số Lượng</th>

                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    int count = 1;
                                    for (LOAISANPHAM sp : list) {
                                        int soLuong = loai_sp.getSoLuongMaSanPham(sp.getMaLoaiSanPham());
                                %>
                                <tr>
                                    <td name="STT"> <%=count%></td>
                                    <td name="MaLoaiSanPham"><%=sp.getMaLoaiSanPham()%></td>
                                    <td name="TenLoaiSanPham"><%=sp.getTenLoaiSanPham()%></td>
                                    <td name="SoLuong"><%=soLuong%></td>
                            <input style="display:none" value="<%=sp.getTenLoaiSanPham()%>" id="focusedinputfix<%=sp.getMaLoaiSanPham()%>"/>
                            <td>
                                <button type="button" class="btn btn-primary"><a target="_blank" style="color:black" href="XemDanhMuc?MaLoai=<%=sp.getMaLoaiSanPham()%>">Xem</a></button>
                                <button type="button" class="btn btn-default" data-target="#myModal<%=sp.getMaLoaiSanPham()%>" data-toggle="modal"><a style="color:black" >Sửa</a></button>
                                <button type="button" class="btn btn-warning"><a style="color:black" href="XoaDanhMuc?ID=<%=sp.getID()%>">Xóa</a></button>
                                <div class="modal fade" id="myModal<%=sp.getMaLoaiSanPham()%>" role="dialog">
                                    <div class="modal-dialog modal-md">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                <h4 class="modal-title">Sửa tên danh mục</h4>
                                            </div>
                                            <script>
                                                $(document).ready(function () {
                                                    var text = "#focusedinputfix" + "<%=sp.getMaLoaiSanPham()%>";
                                                    var text2 = "#focusedinput" + "<%=sp.getMaLoaiSanPham()%>";
                                                    $(text2).val($(text).val());
                                                });
                                            </script>
                                            <form action="SuaDanhMuc" method="post">>
                                                <div class="modal-body">
                                                    <div class="form-group">
                                                        <label for="focusedinput" class="col-md-2 control-label">Tên Danh Mục</label>
                                                        <div class="col-md-8">
                                                            <input style="display:none" name="id" type="text" class="form-control1" value="<%=sp.getID()%>" >
                                                            <input name="tendanhmuc" type="text" class="form-control1" id="focusedinput<%=sp.getMaLoaiSanPham()%>" >
                                                        </div>

                                                    </div>
                                                </div>
                                                <br>
                                                <div class="modal-footer">
                                                    <button type="submit" class="btn btn-default" ><a>Sửa</a></button>
                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Thoát</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </td>                                    
                            </tr>
                            <%count++;
                                }%>
                            </tbody>
                        </table>
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
