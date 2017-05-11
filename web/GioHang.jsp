<%-- 
    Document   : index
    Created on : Mar 21, 2017, 11:09:30 PM
    Author     : tranl
--%>

<%@page import="DAO.KHACHHANG_DAO"%>
<%@page import="DAO.KHACHHANG_DAO"%>
<%@page import="DTO.GIOHANG"%>
<%@page import="DAO.GIOHANG_DAO"%>
<%@page import="DTO.KHACHHANG"%>
<%@page import="DTO.NHASANXUAT"%>
<%@page import="DAO.NHASANXUAT_DAO"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="DAO.LOAISANPHAM_DAO"%>
<%@page import="DTO.SANPHAM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SANPHAM_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title>Đồ chơi cho bé - Đồ chơi trẻ em An toàn Giá Tốt</title>
        <meta name="description" content=" Đồ chơi cho bé đồ chơi trẻ em an toàn độc đáo phù hợp với từng giai đoạn. Giúp bé phát triển thính giác thị giác khả năn vận động di chuyển linh hoạt ngay từ lúc mới sinh" />
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>


    </head>
    <script>
        $(document).ready(function () {
            var menu = $('#login_content');
            menu.stop(true, true).hide( );
            $("#top_login").mouseenter(function (event) {

                $('#login_content').delay(200).show(600);

            });
            $("#top_login").mouseleave(function (event) {

                menu.stop(true, true).delay(200).hide(600);

            });
        });

    </script>
    <%
        String email = (String) request.getSession().getAttribute("Email");
        if (email == null) {
    %>

    <jsp:forward page="/ThongTinTaiKhoan?KhachHang=null" />

    <%
        }
    %>
    
    <script>
        if(${DatHang == "false"}){
            alert("Đặt hàng không thành công");
        }
    </script>
    <body class=" catalog-category-view categorypath-do-choi-cho-be-html category-do-choi-cho-be"> <a class="sr-only" href="#content">Skip to main content</a>
        <section class="mt-container">
            <div class="mt-menu mt-effect-slide">
                <div class="mt-menu-active">
                    <div class="navbar-header">
                        <div class="navbar-toggle" type="button" data-toggle="collapse">
                            <div class="collapsed-icon pull-left">
                                <span class="sr-only">Navigation</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span></div> 
                            <span class="title-canvas">Menu</span> 
                            <button type="button" class="mt-close-canvas"></button>
                        </div>
                    </div>
                </div>
            </div>
            <div class="site-overlay"></div>
            <section class="mt-wrapper">
                <div class="wrapper">

                    <div class="container col1-layout" id="content">
                        <div class="before-main"></div>
                        <div class="row">
                            <div class="col-lg-12 col-main">
                                <div class="before-content"></div>
                                <div class="cart">
                                    <div class="page-title title-buttons">
                                        <h2>Giỏ hàng</h2>
                                    </div>
                                    <form action="http://www.kidsplaza.vn/checkout/cart/updatePost/" method="post"> 
                                        <table id="shopping-cart-table" class="table cart-table table-striped table-bordered">
                                            <thead></thead>
                                            <tfoot>
                                                <tr>
                                                    <td colspan="50" class="a-right"> 
                                                        <script>
                                                            $(document).ready(function(){
                                                                $("#tieptuc").on('click', function(){
                                                                    window.location.href="TrangChu";
                                                                })
                                                            })
                                                        </script>
                                                        <button id="tieptuc" type="button" title="Tiếp tục mua hàng" class="btn-ribbon btn-continue">
                                                            <span><span>Tiếp tục mua hàng</span></span>
                                                        </button>
                                                    </td>
                                                </tr>
                                            </tfoot>
                                            <tbody>
                                                <%
                                                    GIOHANG_DAO gh_dao = new GIOHANG_DAO();
                                                    KHACHHANG_DAO kh_dao = new KHACHHANG_DAO();
                                                    //   String email = (String) request.getSession().getAttribute("Email");
                                                    KHACHHANG kh = kh_dao.getKhachHang(email);
                                                    String MaKhach = kh.getMaKhachHang();
                                                    int count = 0;
                                                    ArrayList<GIOHANG> list = gh_dao.getList(MaKhach);
                                                    for (GIOHANG gh : list) {

                                                        SANPHAM_DAO sp_dao = new SANPHAM_DAO();
                                                        SANPHAM sp = sp_dao.getSanPham(gh.getMaSanPham());
                                                %>
                                            <input style="display:none"value="<%=count%>" id="count" name="count" >
                                            <tr>
                                                <td class="a-center">
                                                    <a href="ChiTietSanPham?MaSanPham=<%=sp.getMaSanPham()%>" title="<%=sp.getTenSanPham()%>" class="product-image"><img src="<%=sp.getHinhAnh()[0]%>" width="75" height="75" alt="<%=sp.getTenSanPham()%>"></a>
                                                </td>
                                                <td class="text">
                                                    <p class="product-name"> <a href="ChiTietSanPham?MaSanPham=<%=sp.getMaSanPham()%>"> <%=sp.getTenSanPham()%></a></p>
                                                </td>


                                                <td class="a-right"> <span class="cart-price"> <span class="price"><%=sp.getDonGiaString()%>&nbsp;₫</span> </span>
                                                </td>
                                            <script>
                                                $(document).ready(function () {
                                                    var number = $("#soluong<%=count%>").val();
                                                    $("#sp-down<%=count%>").on('click', function () {
                                                        console.log("down");
                                                        console.log(number);
                                                        if (number <= 1) {
                                                            number = 1;
                                                            $("#soluong<%=count%>").val(number);
                                                        } else {
                                                            number = parseInt(number, 10) - 1;
                                                            $("#soluong<%=count%>").val(number);
                                                        }
                                                        var sotien = $("#giatien<%=count%>").val();
                                                        var toal = number * (parseInt(sotien));
                                                        console.log(toal);
                                                        var re = "";
                                                        var count = 0;
                                                        var toal_s = toal.toString();
                                                        for (var i = toal_s.length - 1; i >= 0; i--) {
                                                            count++;
                                                            re = re + toal_s[i];
                                                            if (count % 3 === 0 && i !== 0) {
                                                                re += ".";
                                                            }
                                                        }
                                                        console.log(re);
                                                        var gia = "";
                                                        for (var i = re.length - 1; i >= 0; i--) {
                                                            gia += re[i];
                                                        }
                                                        $("#price<%=count%>").text(gia + "₫");
                                                        window.location.href = "SoLuongGioHang?MaSanPham=<%=sp.getMaSanPham()%>&SoLuong=" + number;
                                                    });

                                                    $("#sp-up<%=count%>").on('click', function () {
                                                        console.log("up");
                                                        console.log(number);
                                                        if (number === 99) {
                                                            $("#soluong<%=count%>").val(number);
                                                        } else {
                                                            number = parseInt(number, 10) + 1;
                                                            $("#soluong<%=count%>").val(number);
                                                        }
                                                        var sotien = $("#giatien<%=count%>").val();
                                                        var toal = number * (parseInt(sotien));
                                                        console.log(toal);
                                                        var re = "";
                                                        var count = 0;
                                                        var toal_s = toal.toString();
                                                        for (var i = toal_s.length - 1; i >= 0; i--) {
                                                            count++;
                                                            re = re + toal_s[i];
                                                            if (count % 3 === 0 && i !== 0) {
                                                                re += ".";
                                                            }
                                                        }
                                                        var gia = "";
                                                        for (var i = re.length - 1; i >= 0; i--) {
                                                            gia += re[i];
                                                        }
                                                        $("#price<%=count%>").text(gia + "₫");
                                                        window.location.href = "SoLuongGioHang?MaSanPham=<%=sp.getMaSanPham()%>&SoLuong=" + number;
                                                    });

                                                });
                                            </script>
                                            <input style="display:none" id="giatien<%=count%>"value="<%=sp.getDonGia()%>">
                                            <td class="a-center ">
                                                <div class="input-group">
                                                    <span class="input-group-btn">
                                                        <button id="sp-down<%=count%>" class="btn btn-info btn-qty" type="button">-</button></span>
                                                    <input id="soluong<%=count%>" style="background: #fff" readonly="" name="" value="<%=gh.getSoLuong()%>" size="4" title="Số lượng" class="form-control qty a-center"
                                                           maxlength="12"><span class="input-group-btn">
                                                        <button id="sp-up<%=count%>" class="btn btn-info btn-qty" type="button">+</button>
                                                    </span>
                                                </div>                           
                                            </td>

                                            <td class="a-right"> <span class="cart-price"> <span id="price<%=count%>" class="price"><%=(SANPHAM.convertToVND(sp.getDonGia() * gh.getSoLuong()))%>&nbsp;₫</span> </span>
                                            </td>
                                            <td class="a-center right">
                                                <a href="XoaSanPham?MaSanPham=<%=gh.getMaSanPham()%>" title="Xóa sản phẩm" class="btn-remove"> <i class="glyphicon glyphicon-remove"></i> </a>
                                            </td>
                                            </tr>
                                            <%count++;
                                                }%>
                                            </tbody>
                                        </table>
                                    </form>

                                    <div class="cart-collaterals row">
                                        <div class="col-lg-6"></div>
                                        <div class="col-lg-6 totals">
                                            <table id="shopping-cart-totals-table" class="table">
                                                <colgroup>
                                                    <col>
                                                    <col width="1">
                                                </colgroup>
                                                <tfoot>
                                                    <%

                                                        String MaKhachHang = kh.getMaKhachHang();
                                                        int Tong = gh_dao.TongCong(MaKhachHang);
                                                        String con_Tong = SANPHAM.convertToVND(Tong);
                                                    %>
                                                    <tr>
                                                        <td style="" class="a-right" colspan="1"> <strong>Tổng cộng</strong></td>
                                                        <td style="" class="a-right"> <strong><span class="price"><%=con_Tong%>&nbsp;₫</span></strong></td>
                                                    </tr>
                                                </tfoot>

                                            </table>
                                            <script>
                                                if (${ThongBao == 'error'}) {
                                                    alert("Không có sản phẩm nào để thanh toán. Vui lòng chọn sản phẩm trước khi thanh toán !")
                                                }
                                            </script>


                                            <script>
                                                if (${ThongBao == 'success'}) {
                                                    alert("Đặt hàng thành công. Đơn hàng của bạn sẽ được kiểm tra.");
                                                }
                                            </script>
                                            <ul class="checkout-types a-right">
                                                <li> <button type="button" title="Tiến hành thanh toán" class="btn btn-kid btn-proceed-checkout btn-checkout" onclick="window.location = 'TrangThanhToan';"> <span><span>Tiến hành thanh toán</span></span> </button></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                <div class="after-content"></div>
                            </div>
                        </div>
                        <div class="after-main"></div>
                    </div>
                    <div class="ht-container-outer">
                        <div class="promotions-blocks hidden-xs">
                            <a class="saleoffs-block" target="_blank" href="TrangChu" style="display: block;" alt="Con là số 1"> <img src="images/line-con-la-so-1.png" /> </a>
                        </div>
                        <div class="ht-container">
                            <div class="ht-inner">
                                <div class="ht-left">
                                    <div class="store-location">
                                        <ul>
                                            <li id="header_promotion_tab_01" class="mini-logo">
                                                <a href="TrangChu"><img src="images/mini-logo.png" /></a>
                                            </li>

                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <header id="header" style="margin-top: 65px">
                        <div class="container">
                            <div class="header-mid">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12 header-mid-left">
                                        <a href="TrangChu" title="Hệ thống siêu thị Mẹ và Bé Kids Plaza" class="logo"> <img src="images/logo_new.png" alt="Hệ thống siêu thị Mẹ và Bé Kids Plaza" /> </a>
                                    </div>
                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12 header-mid-right">
                                        <div class="row">
                                            <div class="foothead">
                                                <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 foothead-left">

                                                    <form id="search_mini_form" action="TimKiem" method="get" class="UI-SEARCHAUTOCOMPLETE" data-tip="Bố mẹ tìm gì cho bé hôm nay" data-url="http://www.kidsplaza.vn/search/result/ajax/" data-minchars="3" data-delay="500">
                                                        <div class="input-group top-search"> <input disabled="disabled" id="category_search" type="hidden" name="cat" value="" /><input id="search" type="text" name="search" value="" class="form-control input-text UI-SEARCH UI-NAV-INPUT" maxlength="888888"
                                                                                                                                                                                        /> <span class="input-group-btn"> <button type="submit" title="Tìm kiếm" class="btn btn-kid btn-seach"> <span class="ico-search"><span></span></span>
                                                                </button>
                                                            </span>
                                                            <div class="searchautocomplete-loader UI-LOADER" style="display:none;"></div>
                                                        </div>
                                                        <div style="display:none" id="search_autocomplete" class="UI-PLACEHOLDER search-autocomplete"></div>
                                                    </form>
                                                </div>
                                                <div class="locatis col-lg-4 col-md-4 hidden-sm hidden-xs foothead-right">
                                                    <div class="row cart-top-right">
                                                        <div id="top_login" class="top-login pull-left">
                                                            <%
                                                                String status = "";
                                                                String Email = "null";
                                                                try {
                                                                    status = (String) request.getAttribute("status");
                                                                    Email = (String) request.getSession().getAttribute("Email");

                                                                } catch (Exception e) {

                                                                }
                                                                String name = "";
                                                                try {
                                                                    if (Email.equals("null") == false) {
                                                                        KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
                                                                        KHACHHANG kh2 = kh_dp.getKhachHang(Email);
                                                                        name = kh2.getTenKhachHang();
                                                                    }
                                                                } catch (Exception e) {
                                                                    name = "";
                                                                }
                                                            %>
                                                            <div class="toplogin" id="topLogin">
                                                                <div class="right-login hidden-sm hidden-xs">
                                                                    <p class="p-account-link">
                                                                        <a href="ThongTinTaiKhoan?KhachHang=<%=Email%>" class="account-icon-link"> <span class="ico-user"><span></span></span> <span class="link-box"> Xin chào <%=name%>      <strong> <span id="account_link_id">Tài khoản</span> <span class="caret"></span> </strong>
                                                                            </span>
                                                                        </a>
                                                                    </p>
                                                                </div>
                                                            </div>

                                                            <div id="login_content">
                                                                <div id="customer_menu_links">
                                                                    <ul>
                                                                        <li> <i class="glyphicon glyphicon-user"></i> <a href="ThongTinTaiKhoan?KhachHang=<%=Email%>">Tài khoản của tôi</a></li>                            
                                                                        <li> <i class="glyphicon glyphicon-log-out"></i> <a href="DangXuat">Đăng xuất</a></li>
                                                                    </ul>
                                                                </div>

                                                            </div>

                                                        </div>
                                                        <div class="vr"></div>
                                                        <div class="top-cart" id="cart-top" data-title="Sản phẩm vừa thêm">
                                                            <a class="cart-content hidden-sm  hidden-xs" href="GioHang.jsp"> <span class="ico-cart"> <span id="cart_summary_qty" class="cart-summary" style="display: none;">0</span> </span>
                                                            </a>

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>
                        <div class="divheight clearfix"></div>   
                    </header>
                    <footer id="footer">
                        <div id="footer_inner">
                            <div class="footer-top">

                            </div>

                            <div class="clearfix"></div>
                            <div class="page-tags" style="color: #fff; text-align: center; padding-top: 10px;"></div>
                            <div class="clearfix"></div>
                            <div class="switch-device" style="padding-bottom:20px;"> <a id="switch-to-mobile">
                                    Copyright Kid Plaza
                                </a></div>
                        </div>
                    </footer>

                    <div id="back-to-top" class="back-to-top" style="display: none;">
                        <div class="btt-inner"> <a href="#" title="Lên đầu trang"><span>Lên đầu trang</span></a></div>
                    </div>
                </div>
            </section>
        </section>

    </body>

</html>
