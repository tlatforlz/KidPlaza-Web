<%-- 
    Document   : TrangThanhToan
    Created on : Apr 13, 2017, 9:59:07 AM
    Author     : tranl
--%>

<%@page import="DTO.GIOHANG"%>
<%@page import="DTO.GIOHANG"%>
<%@page import="DAO.GIOHANG_DAO"%>
<%@page import="DAO.KHACHHANG_DAO"%>
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
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>

        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
    </head>
    <script>
        $(document).ready(function () {
            var menu = $('#login_content');
            menu.stop(true, true).hide();
            $("#top_login").mouseenter(function (event) {

                $('#login_content').delay(200).show(600);
            });
            $("#top_login").mouseleave(function (event) {

                menu.stop(true, true).delay(200).hide(600);
            });
        });
    </script>


    <script>
        if (${ketqua == 'fail'}) {
            alert("Giao dịch thất bại. Vui lòng thanh toán lại");
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
                        <div
                            class="row">
                            <div class="col-lg-12 col-main">
                                <div class="before-content"></div>
                                <div class="cart">
                                    <%
                                        GIOHANG_DAO gh_dao = new GIOHANG_DAO();
                                        KHACHHANG_DAO kh_dao = new KHACHHANG_DAO();
                                        String email = (String) request.getSession().getAttribute("Email");
                                        KHACHHANG kh = kh_dao.getKhachHang(email);
                                        String MaKhach = kh.getMaKhachHang();
                                        ArrayList<GIOHANG> list = gh_dao.getList(MaKhach);
                                    %>
                                </div>
                                <div class="checkout">
                                    <ol class="opc" id="checkoutSteps">
                                        <li class="col-lg-4 col-md-4  col-sm-4  col-xs-12">
                                            <ul>
                                                <script>
                                                    $(document).ready(function () {

                                                        $("#thongtinthanhtoan_gh").on('click', function () {
                                                            if ($('#thongtinthanhtoan_gh').is(":checked")) {
                                                                $("#thongtinvanchuyen").css("display", "block");
                                                                $("#address").val("checked");
                                                            } else {
                                                                $("#thongtinvanchuyen").css("display", "none");
                                                                $("#address").val("none");
                                                            }
                                                        });
                                                    });
                                                </script>
                                                <script>
                                                    $(document).ready(function () {
                                                        var x = $("#ten").text();
                                                        if (x === "null") {
                                                            window.location.href = "GioHang.jsp";
                                                        }
                                                    })

                                                </script>
                                                <li id="thongtinthanhtoan">
                                                    <div class="panel panel-info">
                                                        <div class="panel-heading"> 
                                                            <span class="label label-warning">1</span>
                                                            Thông tin địa chỉ thanh toán
                                                        </div>
                                                        <div id="checkout-step-billing" class="panel-body">
                                                            <span>  
                                                                <p style="font-weight: bold; display: inline">Họ : </p>
                                                                <%=kh.getHoKhachHang()%> 
                                                            </span>
                                                            <br>
                                                            <span>  
                                                                <p style="font-weight: bold; display: inline">Tên : </p>
                                                                <span id="ten"><%=kh.getTenKhachHang()%></span> 
                                                            </span>
                                                            <br>
                                                            <span> 
                                                                <p style="font-weight: bold; display: inline">Email : </p>
                                                                <%=kh.getEmail()%>
                                                            </span>
                                                            <br>
                                                            <span>  
                                                                <p style="font-weight: bold; display: inline">Số điện thoại : </p>
                                                                <%=kh.getSoDienThoai()%>
                                                            </span>
                                                            <br>
                                                            <span>  
                                                                <p style="font-weight: bold; display: inline">Địa chỉ : </p>
                                                                <%
                                                                    String diachi = "";
                                                                    if (kh.getDiaChi() == null) {
                                                                        diachi += "Chưa có thông tin ";
                                                                    } else {
                                                                        diachi += kh.getDiaChi();
                                                                    }
                                                                    if (kh.getTinh() == null) {
                                                                        diachi += "- Chưa có thông tin";
                                                                    } else {
                                                                        diachi = diachi + "-" + kh.getTinh();
                                                                    }

                                                                    if (kh.getQuocGia()== null) {
                                                                        diachi += " - Chưa có thông tin";
                                                                    } else {
                                                                        diachi = diachi + "-" + kh.getQuocGia();
                                                                    }
                                                                %>
                                                                <%=diachi%> 

                                                            </span>
                                                            <hr>
                                                            <span>
                                                                <p style="display:inline" > Giao hàng ở địa chỉ khác </p>  
                                                                <input type="checkbox" name="thongtinthanhtoan_gh" id="thongtinthanhtoan_gh" value="1" title="Giao hàng ở địa chỉ này" onclick="" class="check">
                                                            </span>
                                                        </div>
                                                    </div>
                                                </li>

                                                <script>
                                                    $(document).ready(function () {
                                                        $("#ship-form").validate({
                                                            rules: {
                                                                shipfirstname: {
                                                                    required: true
                                                                },
                                                                shiplastname: {
                                                                    required: true
                                                                },
                                                                shipemail: {
                                                                    required: true,
                                                                    email: true
                                                                },
                                                                shipstreet: {
                                                                    required: true
                                                                },
                                                                shipphone: {
                                                                    required: true,
                                                                    minlength: 10,
                                                                    maxlength: 12,
                                                                    number: true
                                                                }
                                                            },
                                                            messages: {
                                                                shipfirstname: {
                                                                    required: "Vui lòng nhập họ"
                                                                },
                                                                shiplastname: {
                                                                    required: "Vui lòng nhập tên"
                                                                },
                                                                shipstreet: {
                                                                    required: "Vui lòng nhập địa chỉ"
                                                                },
                                                                shipphone: {
                                                                    required: "Vui lòng nhập số điện thoại",
                                                                    minlength: "Số điện thoại không hợp lệ",
                                                                    maxlength: "Số điện thoại không hợp lệ",
                                                                    number: "Số điện thoại không hợp lệ"
                                                                }
                                                            }
                                                        });
                                                    });
                                                </script>

                                                <style>
                                                    #ship-firstname-error, #ship-lastname-error, #ship-email-error, #ship-street-error, #ship-phone-error{
                                                        color:red;
                                                    }
                                                </style>
                                                <form id="ship-form" method="post" action="ThemDonHang">
                                                    <input name="address" id="address" value="none" style="display:none">
                                                    <li id= "thongtinvanchuyen" style="display:none">
                                                        <div class="panel panel-info">
                                                            <div class="panel-heading"> <span class="label label-warning">2</span> Thông tin giao hàng </div>
                                                            <div id="checkout-step-shipping" class="panel-body">

                                                                <ul class="form-list">
                                                                    <li id="shipping-new-address-form">
                                                                        <fieldset> <input type="hidden" name="shipping[address_id]" value="" id="shipping:address_id">
                                                                            <ul>
                                                                                <li class="fields">
                                                                                    <div class="customer-name row">
                                                                                        <div class="field name-firstname col-sm-12"> <label class="required control-label" for="shipping:firstname"><em>*</em>Tên</label>
                                                                                            <div class="input-box col-sm-10">
                                                                                                <input type="text" id="ship-firstname" name="shipfirstname" value="" title="Tên" maxlength="255" class="input-sm form-control required-entry" onchange="shipping.setSameAsBilling(false)"></div>
                                                                                        </div>
                                                                                        <div class="field name-lastname col-sm-12"> <label for="shipping:lastname" class="required control-label"><em>*</em>Họ</label>
                                                                                            <div class="input-box"> <input type="text" id="ship-lastname" name="shiplastname" value="" title="Họ" maxlength="255" class="input-sm form-control required-entry" onchange="shipping.setSameAsBilling(false)"></div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>

                                                                                <li class="fields"> <label for="shipping:street1" class="required"><em>*</em>Địa chỉ</label>
                                                                                    <div class="input-box"> <input type="text" title="Địa chỉ" name="shipstreet" id="ship-street" value="" class="input-sm form-control  required-entry" onchange="shipping.setSameAsBilling(false);"></div>
                                                                                </li>
                                                                                <li> <input type="hidden" id="shipping:city" name="shipping[city]" value="N/A">
                                                                                    <div class="field"> <label for="shipping:region" class="required"><em>*</em>Tỉnh/Tp</label>
                                                                                        <div class="input-box"> 
                                                                                            <select id="shipp-region" name="shipregion" title="Tỉnh/Tp" class="validate-select input-sm form-control required-entry">
                                                                                                <option value="Hà Nội" title="Hà Nội">Hà Nội</option>
                                                                                                <option value="T.P. Hồ Chí Minh" title="T.P. Hồ Chí Minh">T.P. Hồ Chí Minh</option>
                                                                                                <option value="Đà Nẵng" title="Đà Nẵng">Đà Nẵng</option>
                                                                                                <option value="Hải Phòng" title="Hải Phòng">Hải Phòng</option>
                                                                                                <option value="Cần Thơ" title="Cần Thơ">Cần Thơ</option>
                                                                                                <option value="An Giang" title="An Giang">An Giang</option>
                                                                                                <option value="Bà Rịa - Vũng Tàu" title="Bà Rịa - Vũng Tàu">Bà Rịa - Vũng Tàu</option>
                                                                                                <option value="Bắc Giang" title="Bắc Giang">Bắc Giang</option>
                                                                                                <option value="Bắc Kạn" title="Bắc Kạn">Bắc Kạn</option>
                                                                                                <option value="Bạc Liêu" title="Bạc Liêu">Bạc Liêu</option>
                                                                                                <option value="Bắc Ninh" title="Bắc Ninh">Bắc Ninh</option>
                                                                                                <option value="Bến Tre" title="Bến Tre">Bến Tre</option>
                                                                                                <option value="Bình Định" title="Bình Định">Bình Định</option>
                                                                                                <option value="Bình Dương" title="Bình Dương">Bình Dương</option>
                                                                                                <option value="Bình Phước" title="Bình Phước">Bình Phước</option>
                                                                                                <option value="Bình Thuận" title="Bình Thuận">Bình Thuận</option>
                                                                                                <option value="Cà Mau" title="Cà Mau">Cà Mau</option>
                                                                                                <option value="Cao Bằng" title="Cao Bằng">Cao Bằng</option>
                                                                                                <option value="Đắk Lắk" title="Đắk Lắk">Đắk Lắk</option>
                                                                                                <option value="Đắk Nông" title="Đắk Nông">Đắk Nông</option>
                                                                                                <option value="Điện Biên" title="Điện Biên">Điện Biên</option>
                                                                                                <option value="Đồng Nai" title="Đồng Nai">Đồng Nai</option>
                                                                                                <option value="Đồng Tháp" title="Đồng Tháp">Đồng Tháp</option>
                                                                                                <option value="Gia Lai" title="Gia Lai">Gia Lai</option>
                                                                                                <option value="Hà Giang" title="Hà Giang">Hà Giang</option>
                                                                                                <option value="Hà Nam" title="Hà Nam">Hà Nam</option>
                                                                                                <option value="Hà Tĩnh" title="Hà Tĩnh">Hà Tĩnh</option>
                                                                                                <option value="Hải Dương" title="Hải Dương">Hải Dương</option>
                                                                                                <option value="Hậu Giang" title="Hậu Giang">Hậu Giang</option>
                                                                                                <option value="Hòa Bình" title="Hòa Bình">Hòa Bình</option>
                                                                                                <option value="Hưng Yên" title="Hưng Yên">Hưng Yên</option>
                                                                                                <option value="Khánh Hòa" title="Khánh Hòa">Khánh Hòa</option>
                                                                                                <option value="Kiên Giang" title="Kiên Giang">Kiên Giang</option>
                                                                                                <option value="Kon Tum" title="Kon Tum">Kon Tum</option>
                                                                                                <option value="Lai Châu" title="Lai Châu">Lai Châu</option>
                                                                                                <option value="Lâm Đồng" title="Lâm Đồng">Lâm Đồng</option>
                                                                                                <option value="Lạng Sơn" title="Lạng Sơn">Lạng Sơn</option>
                                                                                                <option value="Lào Cai" title="Lào Cai">Lào Cai</option>
                                                                                                <option value="Long An" title="Long An">Long An</option>
                                                                                                <option value="Nam Định" title="Nam Định">Nam Định</option>
                                                                                                <option value="Nghệ An" title="Nghệ An">Nghệ An</option>
                                                                                                <option value="Ninh Bình" title="Ninh Bình">Ninh Bình</option>
                                                                                                <option value="Ninh Thuận" title="Ninh Thuận">Ninh Thuận</option>
                                                                                                <option value="Phú Thọ" title="Phú Thọ">Phú Thọ</option>
                                                                                                <option value="Quảng Bình" title="Quảng Bình">Quảng Bình</option>
                                                                                                <option value="Quảng Nam" title="Quảng Nam">Quảng Nam</option>
                                                                                                <option value="Quảng Ngãi" title="Quảng Ngãi">Quảng Ngãi</option>
                                                                                                <option value="Quảng Ninh" title="Quảng Ninh">Quảng Ninh</option>
                                                                                                <option value="Quảng Trị" title="Quảng Trị">Quảng Trị</option>
                                                                                                <option value="Sóc Trăng" title="Sóc Trăng">Sóc Trăng</option>
                                                                                                <option value="Sơn La" title="Sơn La">Sơn La</option>
                                                                                                <option value="Tây Ninh" title="Tây Ninh">Tây Ninh</option
                                                                                                <option value="Thái Bình" title="Thái Bình">Thái Bình</option>
                                                                                                <option value="Thái Nguyên" title="Thái Nguyên">Thái Nguyên</option>
                                                                                                <option value="Thanh Hóa" title="Thanh Hóa">Thanh Hóa</option>
                                                                                                <option value="Thừa Thiên Huế" title="Thừa Thiên Huế">Thừa Thiên Huế</option>
                                                                                                <option value="Tiền Giang" title="Tiền Giang">Tiền Giang</option>
                                                                                                <option value="Trà Vinh" title="Trà Vinh">Trà Vinh</option>
                                                                                                <option value="Tuyên Quang" title="Tuyên Quang">Tuyên Quang</option>
                                                                                                <option value="Vĩnh Long" title="Vĩnh Long">Vĩnh Long</option>
                                                                                                <option value="Vĩnh Phúc" title="Vĩnh Phúc">Vĩnh Phúc</option>
                                                                                                <option value="Yên Bái" title="Yên Bái">Yên Bái</option>
                                                                                                <option value="Phú Yên" title="Phú Yên">Phú Yên</option>
                                                                                                <input type="text" id="shipping:region" name="shipping[region]" value="" title="Tỉnh/Tp" class="input-sm form-control " style="display:none;"></div>
                                                                                                </div>
                                                                                                </li>

                                                                                                <li class="fields">
                                                                                                    <div class="field"> <label for="shipping:telephone" class="required"><em>*</em>Điện thoại</label>
                                                                                                        <div class="input-box"> <input type="text" name="shipphone" value="" title="Điện thoại" class="validate-phoneprefix input-sm form-control  required-entry" id="ship-phone"></div>
                                                                                                    </div>
                                                                                                    <input type="hidden" id="shipping:fax" name="shipping[fax]" value=""></li>
                                                                                                <li class="no-display"><input type="hidden" name="shipping[save_in_address_book]" value="1"></li>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>            
                                                                            </ul>
                                                                    </li>
                                                                    <li class="col-lg-4 col-md-4  col-sm-4  col-xs-12">
                                                                        <ul>
                                                                            <li>
                                                                                <div class="panel panel-info">
                                                                                    <div class="panel-heading"> <span class="label label-warning">3</span> Phương thức vận chuyển</div>
                                                                                    <div id="checkout-step-shipping_method" class="panel-body">
                                                                                        <div class="loading-indicator" style="display: none;"><span>Loading...</span></div>

                                                                                        <div id="checkout-shipping-method-load">
                                                                                            Xem chính sách vận chuyển <a href="" target="_blank">tại đây</a> </div>

                                                                                        <div id="onepage-checkout-shipping-method-additional-load">

                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                            <li>
                                                                                <div class="panel panel-info">
                                                                                    <div class="panel-heading"> <span class="label label-warning">4</span> Thông tin thanh toán</div>
                                                                                    <div id="checkout-step-payment" class="panel-body">
                                                                                        <div id="co-payment-main">
                                                                                            <script>
                                                                                                $(document).ready(function () {
                                                                                                    $("#method").val("p_method_cashondelivery");
                                                                                                    $("#p_method_cashondelivery").on('click', function () {
                                                                                                        $("#method").val($("#p_method_cashondelivery").val());
                                                                                                    });
                                                                                                    $("#p_method_emosys_pay123_standard").on('click', function () {
                                                                                                        $("#method").val($("#p_method_emosys_pay123_standard").val());
                                                                                                    });
                                                                                                });
                                                                                            </script>
                                                                                            <fieldset>
                                                                                                <input style="display:none" id="method" name="method" value="" >
                                                                                                <dl class="sp-methods" id="checkout-payment-method-load">

                                                                                                    <dt>
                                                                                                        <input id="p_method_cashondelivery" value="cashondelivery" type="radio" name="payment[method]" title="Thanh toán khi nhận hàng" checked="checked" class="radio">
                                                                                                        <label for="p_method_cashondelivery">
                                                                                                            Thanh toán khi nhận hàng </label>
                                                                                                    </dt>

                                                                                                    <dt>
                                                                                                        <input id="p_method_emosys_pay123_standard" value="emosys_pay123_standard" type="radio" name="payment[method]" title="123Pay - Thẻ ATM nội địa"  class="radio">
                                                                                                        <label for="p_method_emosys_pay123_standard">
                                                                                                            Thanh toán qua thẻ ATM    </label>
                                                                                                    </dt>  
                                                                                                </dl>

                                                                                            </fieldset>                                                                                      
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </li>
                                                                        </ul>
                                                                    </li>
                                                                    <li class="col-lg-4 col-md-4  col-sm-4  col-xs-12">
                                                                        <div class="panel panel-info">
                                                                            <div class="panel-heading"> <span class="label label-warning">5</span> Xem đơn hàng</div>
                                                                            <div id="checkout-step-review" class="panel-body">
                                                                                <div class="order-review" id="checkout-review-load">
                                                                                    <div id="checkout-review-table-wrapper">
                                                                                        <table class="table review-table table-striped table-condensed" id="checkout-review-table">
                                                                                            <thead>
                                                                                                <tr>
                                                                                                    <th rowspan="1">Tên sản phẩm</th>
                                                                                                    <th colspan="1" class="a-center">Giá</th>
                                                                                                    <th rowspan="1" class="a-center">Số lượng</th>
                                                                                                    <th colspan="1" class="a-center">Tổng tiền thanh toán</th>
                                                                                                </tr>
                                                                                            </thead>

                                                                                            <tbody class="review-items">
                                                                                                <%
                                                                                                    int Tong = 0;
                                                                                                    for (GIOHANG gh : list) {

                                                                                                        SANPHAM_DAO sp_dao = new SANPHAM_DAO();
                                                                                                        SANPHAM sp = sp_dao.getSanPham(gh.getMaSanPham());
                                                                                                %>
                                                                                                <tr>
                                                                                                    <td>
                                                                                                        <p class="product-name"><%=sp.getTenSanPham()%></p>
                                                                                                    </td>
                                                                                                    <td class="a-right">
                                                                                                        <span class="cart-price">

                                                                                                            <span class="price"><%=sp.getDonGiaString()%>&nbsp;₫</span>
                                                                                                        </span>


                                                                                                    </td>
                                                                                                    <td class="a-center"><%=gh.getSoLuong()%></td>

                                                                                                    <td class="a-right">
                                                                                                        <span class="cart-price">

                                                                                                            <span class="price"><%=SANPHAM.convertToVND(sp.getDonGia() * gh.getSoLuong())%>&nbsp;₫</span>
                                                                                                            <%
                                                                                                                Tong += sp.getDonGia() * gh.getSoLuong();
                                                                                                            %>
                                                                                                        </span>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <%}%>
                                                                                            </tbody>

                                                                                            <tfoot>
                                                                                                <tr>
                                                                                                    <td style="" class="a-right" colspan="3">
                                                                                                        Tổng </td>
                                                                                                    <td style="" class="a-right">
                                                                                                        <span class="price"><%=SANPHAM.convertToVND(Tong)%>&nbsp;₫</span> </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td style="" class="a-right" colspan="3">
                                                                                                        <strong>Tổng cộng</strong>
                                                                                                    </td>
                                                                                                    <td style="" class="a-right">
                                                                                                        <strong><span class="price"><%=SANPHAM.convertToVND(Tong)%>&nbsp;₫</span></strong>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </tfoot>
                                                                                        </table>
                                                                                    </div>

                                                                                    <div id="checkout-review-submit">
                                                                                        <div class="buttons-set" id="review-buttons-container">

                                                                                            <div class="buttons-set">
                                                                                                <ul class="form-list">
                                                                                                    <li>
                                                                                                        <fieldset>
                                                                                                            <ul>
                                                                                                                <li class="wide">
                                                                                                                    <label for="ordercomment-comment">Nhận xét đơn hàng</label>
                                                                                                                    <div class="input-box">
                                                                                                                        <textarea id="ordercomment" class="input-text validation-passed" name="ordercomment" title="Nhận xét đơn hàng" rows="5" cols="10"></textarea>
                                                                                                                    </div>
                                                                                                                </li>
                                                                                                            </ul>
                                                                                                        </fieldset>
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </div>


                                                                                            <button type="submit" title="Đặt hàng" class="btn btn-kid btn-checkout pull-right" onclick="submitForm()">
                                                                                                <i class="glyphicon glyphicon-shopping-cart"></i> Đặt hàng</button>
                                                                                            <span class="please-wait text-center" id="review-please-wait" style="display:none;">

                                                                                        </div>

                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </li>
                                                                    </form> 
                                                                    <script>
                                                                        function submitForm() {
                                                                            $("#ship-form").submit();
                                                                        }

                                                                    </script>
                                                                    </ol>
                                                            </div>
                                                            <style type="text/css">
                                                                #nprogress .bar {
                                                                    background: #FF0000;
                                                                }
                                                            </style>

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

                                                                                                %>
                                                                                                <div class="toplogin" id="topLogin">
                                                                                                    <div class="right-login hidden-sm hidden-xs">
                                                                                                        <p class="p-account-link">
                                                                                                            <%                                                                            String name = "";

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
                                                                                                            <a href="ThongTinTaiKhoan?KhachHang=<%=Email%>" class="account-icon-link"> <span class="ico-user"><span></span></span> <span class="link-box"> Xin chào <%=name%><strong> <span id="account_link_id">Tài khoản</span> <span class="caret"></span> </strong>
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
                                                                                                <div class="cart-items" style="display: none">
                                                                                                    <div id="cart_items_not_empty" style="display: none;">
                                                                                                        <div id="cart_items_not_empty_inner" style="display: none;"></div>
                                                                                                        <div class="cart-action"> <span id="cart_summary_total" class="cart-total pull-left">0</span> <a href="http://www.kidsplaza.vn/checkout/onepage/">Tiến Hành Thanh toán&nbsp;<i class="glyphicon glyphicon-chevron-right"></i></a></div>
                                                                                                    </div>
                                                                                                    <div id="cart_items_empty" style="display: none;">
                                                                                                        <p class="empty">Không có sản phẩm nào</p>
                                                                                                    </div>
                                                                                                </div>
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
                                                                <div class="switch-device" style="padding-bottom:20px;"> 
                                                                    <div style="color:white">
                                                                        <p> Địa Chỉ Liên Hệ :  Tòa nhà 1A, Sao Hỏa, Vũ Trụ Thứ 7. </p> 
                                                                        <p>     Email: support@kid.plaza.com </p>
                                                                        <p>   Số điện thoại : 1800.0000</p> 
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </footer>


                                                        </div>
                                                        </section>
                                                        </section>

                                                        </body>

                                                        </html>

