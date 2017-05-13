<%-- 
    Document   : ThemPhieuNhap
    Created on : Apr 25, 2017, 4:31:51 PM
    Author     : tranl
--%>

<%@page import="DAO.NHANVIEN_DAO"%>
<%@page import="DTO.NHACUNGCAP"%>
<%@page import="DAO.NHACUNGCAP_DAO"%>
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
        <title>Thêm Phiếu Nhập</title>
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

                    <div class="xs">
                        <h3>Thêm phiếu nhập</h3>
                        <hr>
                        <%
                            String MaPhieuNhap = (String) request.getAttribute("MaPhieuNhap");
                        %>
                        <div class="tab-pane active" id="horizontal-form">
                            <form class="form-horizontal" id="formLuu" action="LuuPhieuNhap?MaPhieuNhap=<%=MaPhieuNhap%>">

                                <script>
            $(document).ready(function () {
                $("#luulai").on('click', function () {
                    $("#formLuu").submit();
                });
            });
                                </script>

                                <div class="form-group">
                                    <label for="focusedinput" class="col-sm-2 control-label">Mã Phiếu Nhập</label>
                                    <div class="col-sm-8">
                                        <h4 style="margin-top:10px"><%=MaPhieuNhap%></h4>
                                        <input style="display:none" name="MaPhieuNhap" value="<%=MaPhieuNhap%>"/>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="select" class="col-sm-2 control-label">Nhà cung cấp</label>
                                    <div class="col-sm-8">
                                        <script>
                                            if (${checkNCC == 'true'}) {
                                                alert("Tên nhà cung cấp đã tồn tại !");
                                            }
                                        </script>
                                        <div style="margin:10px"> 
                                            <span>
                                                <script>
                                                    $(document).ready(function () {
                                                        $("#themnhacungcap").on('click', function () {
                                                            var nhacungcap = $("#nhacungcap").val();
                                                            if (nhacungcap === "") {
                                                                $("#nhacungcap-error").css("display", "block");
                                                            } else {
                                                                window.location.href = "ThemNhaCungCap?NhaCungCap=" + nhacungcap;
                                                            }
                                                        });

                                                    });
                                                </script>
                                                <input name="nhacungcap" id="nhacungcap" value="">                                                                           
                                                <button type="button" class="btn btn-default"><a id="themnhacungcap" >Thêm nhà cung cấp</a></button>
                                                <h5 id="nhacungcap-error" style="display:none;color:red; margin-top:10px">Thông tin không được bỏ trống</h5>
                                            </span>
                                        </div>
                                        <select name="sp_nhacungcap" class="form-control1">
                                            <%
                                                NHACUNGCAP_DAO ncc_dp = new NHACUNGCAP_DAO();
                                                ArrayList<NHACUNGCAP> list = ncc_dp.getListNhaCungCap();
                                                for (NHACUNGCAP ncc : list) {
                                            %>
                                            <option value="<%=ncc.getMaNhaCungCap()%>"> <%=ncc.getTenNhaCungCap()%></option>
                                            <%}%>
                                        </select>
                                    </div>
                                </div>

                                <hr>
                                <div class="form-group">
                                    <button type="button" class="btn btn-primary"><a style="color:black" href="ThemChiTietPhieuNhap?yc=sanphammoi&MaPhieuNhap=<%=MaPhieuNhap%>">Thêm Mới</a></button>
                                    <button type="button" class="btn btn-warning"><a style="color:black" href="ThemChiTietPhieuNhap?yc=sanphamsan&MaPhieuNhap=<%=MaPhieuNhap%>">Thêm vào sản phẩm có sẵn</a></button>
                                </div>
                                <%
                                    SANPHAM_DAO sp_dp = new SANPHAM_DAO();
                                    ArrayList<SANPHAM> list_mau = sp_dp.getListSP_temp(MaPhieuNhap);
                                    if (list_mau.isEmpty()) {
                                %>
                                Chưa có chi tiết phiếu nhập
                                <%} else {
                                %>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th>Mã Sản Phẩm</th>
                                            <th>Tên Sản Phẩm</th>
                                            <th>Số Lượng</th>
                                            <th>Đơn Giá</th>
                                            <th>Tổng Tiền</th>
                                            <th></th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <%
                                            int count = 1;
                                            for (SANPHAM sp : list_mau) {
                                        %>
                                        <tr>    
                                            <td><%=count%></td>
                                            <td><%=sp.getMaSanPham()%></td>
                                            <td><%=sp.getTenSanPham()%></td>
                                            <td><%=sp.getSoLuong()%></td>
                                            <td><%=SANPHAM.convertToVND(sp.getGiaGoc())%></td>
                                            <td><%=SANPHAM.convertToVND(sp.getGiaGoc() * sp.getSoLuong())%></td>
                                            <td>                                              
                                                <button type="button" class="btn btn-primary"><a style="color:black" href="ChinhSuaSanPhamPhieuNhap?MaSanPham=<%=sp.getMaSanPham()%>&MaPhieuNhap=<%=MaPhieuNhap%>">Sửa</a></button>
                                                <button type="button" class="btn btn-warning"><a style="color:black" href="XoaSanPhamPhieuNhap?MaSanPham=<%=sp.getMaSanPham()%>&MaPhieuNhap=<%=MaPhieuNhap%>">Xóa</a></button>
                                            </td>                                    
                                        </tr>
                                        <% count++;
                                            }
                                        %>
                                    </tbody>
                                </table>
                                <div class="form-group">
                                    <button id="luulai" type="button" class="btn btn-primary"><a style="color:black">Lưu Lại</a></button>
                                    <button type="button" class="btn btn-warning"><a style="color:black" href="HuyPhieuNhap?MaPhieuNhap=<%=MaPhieuNhap%>">Xóa</a></button>
                                </div>
                                <%}%>
                            </form>
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
