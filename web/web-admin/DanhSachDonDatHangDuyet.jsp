<%-- 
    Document   : DanhSachDonDatHangDuyet
    Created on : May 7, 2017, 12:48:45 PM
    Author     : tranl
--%>

<%@page import="DAO.NHANVIEN_DAO"%>
<%@page import="DAO.CHITIETDATHANG_DAO"%>
<%@page import="DTO.DONDATHANG"%>
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
        <title>Danh sách Đơn Đặt Hàng</title>
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

                            <li class="m_2"><a href="ThongTinAdmin"><i class="fa fa-user"></i> Thông Tin Cá Nhân</a></li>

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
                        <%
                            ArrayList<DONDATHANG> list = (ArrayList<DONDATHANG>) request.getAttribute("DanhSachDonDatHang");
                        %>
                        <h3>Danh sách đơn đặt hàng </h3>
                        <table class="table table-bordered">
                            <thead>
                                <tr>
                                    <th>STT</th>
                                    <th>Mã hóa đơn</th>
                                    <th>Ngày đặt</th>
                                    <th>Tình trạng</th>
                                    <th>Tổng tiền</th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                                <%                                    int count = 1;
                                    for (DONDATHANG dh : list) {

                                %>
                                <tr>    
                                    <td><%=count%></td>
                                    <td><%=dh.getMaDonDatHang()%></td>
                                    <td><%=dh.getNgayDat()%></td>
                                    <%
                                        int TinhTrang = dh.getTinhTrangGiao();
                                        String status = "";
                                        if (TinhTrang == 0) {
                                            status = "Đang đợi duyệt";
                                        }
                                        if (TinhTrang == 1) {
                                            status = "Đã xác nhận đơn hàng";
                                        }
                                        if (TinhTrang == 2) {
                                            status = "Đơn hàng đang chuẩn bị";
                                        }
                                        if (TinhTrang == 3) {
                                            status = "Đang giao hàng";
                                        }
                                        if (TinhTrang == 4) {
                                            status = "Đã giao hàng";
                                        }
                                        if (TinhTrang == 5) {
                                            status = "Đã đổi trả";
                                        }
                                        if (TinhTrang == 6) {
                                            status = "Yêu cầu đổi trả";
                                        }
                                    %>
                                    <td><%=status%></td>

                                    <%
                                        CHITIETDATHANG_DAO ct_dp = new CHITIETDATHANG_DAO();
                                        int TongTien = ct_dp.TongTienDonHang(dh.getMaDonDatHang());
                                    %>
                                    <td><%=SANPHAM.convertToVND(TongTien)%> VNĐ</td>
                                    <td>
                                        <button type="button" class="btn btn-primary"><a style="color:black" href="ChiTietDuyetDonDatHang?MaDonDatHang=<%=dh.getMaDonDatHang()%>">Xem</a></button>
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
