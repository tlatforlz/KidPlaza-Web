<%@page import="DTO.DONDATHANG"%>
<%@page import="DAO.DONDATHANG_DAO"%>
<%@page import="DAO.KHACHHANG_DAO"%>
<%@page import="DTO.KHACHHANG"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.LOAISANPHAM_DAO"%>
<%@page import="DTO.SANPHAM"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="//www.kidsplaza.vn/skin/frontend/kidsplaza/2015/css/font-awesome.min.css" />
        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>

    </head>

    <body class=" catalog-product-view catalog-product-view"><a class="sr-only" href="#content">Skip to main content</a>
        <section class="mt-container">
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
            <script>
                $(document).ready(function () {
                    $('#ThongTinTaiKhoan').on('click', function () {
                        $('#ThongTinTaiKhoanDe').css('display', 'block');
                        $('#ThongTinChung').removeClass("active");
                        $('#SoDiachi').removeClass("active");
                        $('#DonHangCuaToi').removeClass("active")
                        $('#ThongTinTaiKhoan').addClass("active");
                        $('#ThongTinChungDe').css('display', 'none');
                        $('#SoDiaChiDe').css('display', 'none');
                        $('#DonHangCuaToiDe').css('display', 'none');
                    });
                    $('#ThongTinChung').on('click', function () {
                        $('#ThongTinTaiKhoan').removeClass("active");
                        $('#SoDiachi').removeClass("active");
                        $('#DonHangCuaToi').removeClass("active")
                        $('#ThongTinChung').addClass("active");
                        $('#ThongTinChungDe').css('display', 'block');
                        $('#ThongTinTaiKhoanDe').css('display', 'none');
                        $('#SoDiaChiDe').css('display', 'none');
                        $('#DonHangCuaToiDe').css('display', 'none');
                    });
                    $('#SoDiachi').on('click', function () {
                        $('#ThongTinTaiKhoan').removeClass("active");
                        $('#ThongTinChung').removeClass("active");
                        $('#DonHangCuaToi').removeClass("active")
                        $('#SoDiachi').addClass("active");
                        $('#SoDiaChiDe').css('display', 'block');
                        $('#ThongTinChungDe').css('display', 'none');
                        $('#ThongTinTaiKhoanDe').css('display', 'none');
                        $('#DonHangCuaToiDe').css('display', 'none');
                    });
                    $('#DonHangCuaToi').on('click', function () {

                        $('#ThongTinTaiKhoan').removeClass("active");
                        $('#ThongTinChung').removeClass("active");
                        $('#SoDiachi').removeClass("active")
                        $('#DonHangCuaToi').addClass("active");
                        $('#DonHangCuaToiDe').css('display', 'block');
                        $('#SoDiaChiDe').css('display', 'none');
                        $('#ThongTinChungDe').css('display', 'none');
                        $('#ThongTinTaiKhoanDe').css('display', 'none');
                    });
                });
            </script>
            <%
                KHACHHANG kh = new KHACHHANG();
                try {
                    kh = (KHACHHANG) request.getAttribute("KhachHang");
                } catch (Exception e) {

                }
            %>

            <script>
                if (${address == "false"}) {
                    alert("Vui lòng cập nhập địa chỉ trước khi giao hàng");
                }
            </script>
            <section class="mt-wrapper">
                <div class="wrapper">
                    <div class="container col2-left-layout" id="content">
                        <div class="before-main"></div> <noscript><div class="global-site-notice noscript"><div class="notice-inner"><p> <strong>JavaScript seems to be disabled in your browser.</strong><br /> You must have JavaScript enabled in your browser to utilize the functionality of this website.</p></div></div> </noscript>
                        <div class="row">
                            <!-- Thong Tin Ching -->
                            <div id="ThongTinChungDe" style="float: right;" class="col-main col-lg-9 col-md-9 col-sm-9 col-push-9 col-xs-12" >
                                <div class="before-content"></div>
                                <div class="my-account">
                                    <div class="dashboard" style="margin-top : 50px;margin-bottom:50px">
                                        <div class="page-title">
                                            <h1>Trang chính</h1>
                                        </div>
                                        <div class="welcome-msg">
                                            <p class="hello"><strong>Xin chào, <%=kh.getTenKhachHang()%></strong></p>
                                        </div>
                                        <div class="box-account box-info">
                                            <div class="box-head">
                                                <h2>Thông tin tài khoản</h2>
                                            </div>
                                            <div class="col2-set">
                                                <div class="col-1">
                                                    <div class="box">
                                                        <div class="box-title">
                                                            <h3>Liên hệ</h3> </div>
                                                        <div class="box-content">
                                                            <p> <%=kh.getHoKhachHang()%> <%=kh.getTenKhachHang()%> <br> <%=kh.getEmail()%><br> <%=kh.getSoDienThoai()%> <br></p>
                                                        </div>
                                                    </div>
                                                </div>

                                            </div>
                                            <div class="col2-set">                                           
                                                <div class="col-1">
                                                    <div class="box">
                                                        <div class="box-title">
                                                            <h3>Địa chỉ nhận hàng mặc định</h3>
                                                        </div>
                                                        <%
                                                            if (kh.getDiaChi() == null) {
                                                        %>
                                                        <div class="box-content"> <address> Khách hàng chưa cập nhập địa chỉ  <br></address></div>
                                                                <%} else {

                                                                    String address = kh.getDiaChi() + " , " + kh.getTinh() + " , " + kh.getQuocGia();
                                                                %>
                                                        <div class="box-content"> <address> <%=address%> <br></address></div>
                                                                <%}%>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="after-content"></div>
                            </div>
                            <!--So Dia Chi-->
                            <div id="SoDiaChiDe" style="float: right; display:none" class="col-main col-lg-9 col-md-9 col-sm-9 col-push-9 col-xs-12">
                                <div class="before-content"></div>
                                <div class="my-account" style="margin-top:50px;margin-bottom:50px">
                                    <div class="page-title">
                                        <h1>Thêm địa chỉ mới</h1>
                                    </div>
                                    <script>
                                        $(document).ready(function () {
                                            $("#form-address").validate({
                                                rules: {
                                                    firstname: {
                                                        required: true
                                                    },
                                                    lastname: {
                                                        required: true
                                                    },
                                                    telephone: {
                                                        required: true,
                                                        number: true,
                                                        minlength: 10
                                                    },
                                                    street: {
                                                        required: true
                                                    }
                                                },
                                                messages: {
                                                    firstname: {
                                                        required: "Vui lòng nhập vào tên"
                                                    },
                                                    lastname: {
                                                        required: "Vui lòng nhập vào họ"
                                                    },
                                                    telephone: {
                                                        required: "Vui lòng nhập vào số điện thoại",
                                                        number: "Số điện thoại không hợp lệ",
                                                        minlength: "Số điện thoại không hợp lệ"
                                                    },
                                                    street: {
                                                        required: "Vui lòng nhập vào địa chỉ"
                                                    }
                                                }
                                            });
                                        });

                                    </script>
                                    <style>
                                        #telephone-error, #street-error{
                                            color:red;
                                        }
                                    </style>
                                    <form  action="CapNhapDiaChiTaiKhoan" method="post" id="form-address">
                                        <div class="fieldset"> 
                                            <h2 class="legend">Liên hệ</h2>
                                            <ul class="form-list">
                                                <li class="fields">
                                                    <div class="customer-name row">
                                                        <div class="field name-firstname col-sm-12"> <label class="required control-label" for="firstname" class="required"><em>*</em>Tên</label>
                                                            <div class="input-box col-sm-10"> <input type="text" id="firstname" name="firstname" value="<%=kh.getTenKhachHang()%>" title="Tên" maxlength="255" class="input-sm form-control required-entry" /></div>
                                                        </div>
                                                        <div class="field name-lastname col-sm-12"> <label for="lastname" class="required control-label"><em>*</em>Họ</label>
                                                            <div class="input-box"> <input type="text" id="lastname" name="lastname" value="<%=kh.getHoKhachHang()%>" title="Họ" maxlength="255" class="input-sm form-control required-entry" /></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li class="fields">

                                                    <div class="field"> <label for="telephone" class="required"><em>*</em>Điện thoại</label>
                                                        <div class="input-box"> <input type="text" name="telephone" value="<%=kh.getSoDienThoai()%>" title="Điện thoại" class="validate-phoneprefix input-text   required-entry" id="telephone" /></div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="fieldset">
                                            <h2 class="legend">Địa chỉ</h2>
                                            <ul class="form-list">
                                                <li class="wide"> <label for="street_1" class="required"><em>*</em>Địa chỉ</label>
                                                    <%
                                                        if (kh.getDiaChi() == null) {
                                                    %>
                                                    <div class="input-box"> <input type="text" name="street" value="" title="Địa chỉ" id="street" class="input-text  required-entry" /></div>
                                                        <%} else {%>
                                                    <div class="input-box"> <input type="text" name="street" value="<%=kh.getDiaChi()%>" title="Địa chỉ" id="street" class="input-text  required-entry" /></div>
                                                        <%}%>
                                                </li> <input type="hidden" name="city" value="N/A" /> <input type="hidden" name="postcode" value="N/A" />
                                                <li class="fields">
                                                    <div class="field"> <label for="region_id" class="required"><em>*</em>Tỉnh/Tp</label>
                                                        <div class="input-box">
                                                            <select id="region_id" name="region_id" title="Tỉnh/Tp" class="validate-select required-entry">
                                                                <%
                                                                    if (kh.getTinh() == null) {
                                                                %>
                                                                <option value="">Chọn Tỉnh</option> 
                                                                <%} else {%>
                                                                <option value="<%=kh.getTinh()%>"><%=kh.getTinh()%></option> 
                                                                <%}%>
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
                                                            </select>                                
                                                            <input type="hidden" id="region" name="region" value="" title="Tỉnh/Tp" class="input-text required-entry" style="display: none;"></div>
                                                    </div>
                                                    <div class="field"> <label for="country" class="required"><em>*</em>Quốc gia</label>
                                                        <div class="input-box"> <select name="country_id" id="country" class="validate-select" title="Quốc gia"><option value="Việt Nam" selected="selected" >Việt Nam</option></select></div>
                                                    </div>
                                                </li>
                                                <li class="fields"></li>
                                                <li> <input type="hidden" name="default_billing" value="1" /></li>
                                                <li> <input type="hidden" name="default_shipping" value="1" /></li>
                                            </ul>
                                        </div>
                                        <div class="buttons-set">
                                            <p class="required">* Phải nhập thông tin</p>

                                            <button type="submit" title="Lưu lại" class="button btn-kid"><span><span>Lưu lại</span></span></button> <input id="phone_prefix"
                                                                                                                                                           name="phone_prefix" type="hidden" value="090,091,092,093,094,095,096,097,098,0120,0121,0122,0123,0124,0125,0126,0127,0128,0129,0163,0164,0165,0166,0167,0168,0169,0186,0188,0199,0162,099"> <input id="phone_len" name="phone_len"                                                                                                                                                                                                     type="hidden" value="7"></div>
                                    </form>

                                </div>
                                <div class="after-content"></div>
                            </div>
                            <!--Thong Tin Tai Khoan-->
                            <div id="ThongTinTaiKhoanDe" style="float: right; display:none" class="col-main col-lg-9 col-md-9 col-sm-9 col-push-9 col-xs-12">
                                <div class="before-content"></div>
                                <div class="my-account" style="margin-top:50px; margin-bottom:50px" >
                                    <div class="page-title" >
                                        <h1>Sửa thông tin tài khoản</h1>
                                    </div>

                                    <script>
                                        $(document).ready(function () {
                                            $("#form-thongtintaikhoan").validate({
                                                rules: {
                                                    firstname: {
                                                        required: true
                                                    },
                                                    lastname: {
                                                        required: true
                                                    },
                                                    email: {
                                                        required: true,
                                                        email: true
                                                    },
                                                    phone_number: {
                                                        required: true,
                                                        number: true,
                                                        minlength: 10
                                                    },
                                                    current_password: {
                                                        required: true
                                                    },
                                                    password: {
                                                        required: true
                                                    },
                                                    confirmation: {
                                                        required: true,
                                                        equalTo: "#password"
                                                    }
                                                },
                                                messages: {
                                                    firstname: {
                                                        required: "Vui lòng nhập họ"
                                                    },
                                                    lastname: {
                                                        required: "Vui lòng nhập tên"
                                                    },
                                                    email: {
                                                        required: "Vui lòng nhập email",
                                                        email: "Email không hợp lệ"
                                                    },
                                                    phone_number: {
                                                        required: "Vui lòng nhập số điện thoại",
                                                        number: "Số điện thoại không hợp lệ",
                                                        minlength: "Số điện thoại không hợp lệ"
                                                    },
                                                    current_password: {
                                                        required: "Vui lòng nhập mật khẩu hiện tại"
                                                    },
                                                    password: {
                                                        required: "Vui lòng nhập mật khẩu mới"
                                                    },
                                                    confirmation: {
                                                        required: "Vui lòng nhập xác nhận mật khẩu mới",
                                                        equalTo: "Mật khẩu mới không trùng"
                                                    }
                                                }
                                            });
                                        });
                                    </script>
                                    <style>
                                        #firstname-error, #lastname-error, #email-error, #phone_number-error, #current_password-error, #password-error, #confirmation-error{
                                            color: red
                                        }
                                    </style>
                                    <form action="DoiThongTinTaiKhoan" method="post" id="form-thongtintaikhoan" autocomplete="off">
                                        <div class="fieldset"> 
                                            <h2 class="legend">Thông tin tài khoản</h2>
                                            <ul class="form-list">
                                                <li class="fields">
                                                    <div class="customer-name row">
                                                        <div class="field name-firstname col-sm-12"> <label class="required control-label" for="firstname"><em>*</em>Tên</label>
                                                            <div class="input-box col-sm-10"> <input type="text" id="firstname" name="firstname" value="<%=kh.getTenKhachHang()%>" title="Tên" maxlength="255" class="input-sm form-control required-entry"></div>
                                                        </div>
                                                        <div class="field name-lastname col-sm-12"> <label for="lastname" class="required control-label"><em>*</em>Họ</label>
                                                            <div class="input-box"> <input type="text" id="lastname" name="lastname" value="<%=kh.getHoKhachHang()%>" title="Họ" maxlength="255" class="input-sm form-control required-entry"></div>
                                                        </div>
                                                    </div>
                                                </li>
                                                <li> <label for="email" class="required"><em>*</em>Địa chỉ email</label>
                                                    <div class="input-box"> <input type="text" name="email" id="email" value="<%=kh.getEmail()%>" title="Địa chỉ email" class="input-text required-entry validate-email"></div>
                                                </li>
                                                <li> <label for="telephone">Điện thoại</label>
                                                    <div class="input-box"> <input type="text" name="phone_number" id="phone_number" value="<%=kh.getSoDienThoai()%>" title="Điện thoại" class="input-text"></div>
                                                </li>
                                                <button type="button" id="doimatkhau" class="btn btn-default" > Đổi mật khẩu</button>
                                            </ul>
                                        </div>
                                        <script>
                                            $(document).ready(function () {
                                                var count = 1;
                                                $("#doimatkhau").on("click", function () {
                                                    count = count + 1;
                                                    console.log(count);
                                                    if (count % 2 === 0) {
                                                        $("#block-mat-khau").css("display", "block");
                                                    } else {
                                                        $("#block-mat-khau").css("display", "none");
                                                    }
                                                });

                                            });
                                        </script>
                                        <div id="block-mat-khau" class="fieldset" style="display:none">
                                            <h2 class="legend">Đổi mật khẩu</h2>
                                            <ul class="form-list">
                                                <li> <label for="current_password" class="required"><em>*</em>Mật khẩu cũ</label>
                                                    <div class="input-box"> <input value="" type="password" title="Mật khẩu cũ" class="input-text" name="current_password" id="current_password"></div>
                                                </li>
                                                <li class="fields">
                                                    <div class="field"> <label for="password" class="required"><em>*</em>Mật khẩu mới</label>
                                                        <div class="input-box"> <input value="" type="password" title="Mật khẩu mới" class="input-text validate-password" name="password" id="password"></div>
                                                    </div>
                                                    <div class="field"> <label for="confirmation" class="required"><em>*</em>Nhập lại mật khẩu mới</label>
                                                        <div class="input-box"> <input value="" type="password" title="Nhập lại mật khẩu mới" class="input-text validate-cpassword" name="confirmation" id="confirmation"></div>
                                                    </div>
                                                </li>
                                            </ul>
                                        </div>
                                        <div class="buttons-set">
                                            <p class="required">* Phải nhập thông tin</p>
                                            <button type="submit" title="Lưu lại" class="button btn-kid btn">
                                                <span>Lưu lại</span>
                                            </button>
                                        </div>
                                    </form>
                                    <script type="text/javascript">
                                        function setPasswordForm(arg) {
                                            if (arg) {
                                                $('current_password').up(3).show();
                                                $('current_password').addClassName('required-entry');
                                                $('password').addClassName('required-entry');
                                                $('confirmation').addClassName('required-entry');
                                            } else {
                                                $('current_password').up(3).hide();
                                                $('current_password').removeClassName('required-entry');
                                                $('password').removeClassName('required-entry');
                                                $('confirmation').removeClassName('required-entry');
                                            }
                                        }
                                    </script>
                                </div>
                                <div class="after-content"></div>
                            </div>

                            <!--Don Hang Cua toi-->
                            <div id="DonHangCuaToiDe" style="float: right; display:none" class="col-main col-lg-9 col-md-9 col-sm-9 col-push-9 col-xs-12">
                                <div class="before-content"></div>
                                <div class="my-account" style="margin-top : 50px; margin-bottom:50px">
                                    <div class="page-title">
                                        <h1>Đơn hàng của tôi</h1>
                                    </div>
                                    <%
                                        KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
                                        KHACHHANG kh_c = kh_dp.getKhachHang((String) request.getSession().getAttribute("Email"));
                                        DONDATHANG_DAO dh_dp = new DONDATHANG_DAO();
                                        ArrayList<DONDATHANG> list_dh = dh_dp.getListDDH(kh_c.getMaKhachHang());
                                        if (list_dh.isEmpty()) {
                                    %>
                                    <p>Bạn chưa có giao dịch (đơn hàng) nào.</p>
                                    <%} else {%>
                                    <!-- table-->
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>STT</th>
                                                <th>Mã Đơn Hàng</th>
                                                <th>Tình Trạng</th>
                                                <th>Thanh Toán</th>
                                                <th>Tổng Tiền</th>
                                                <th>Địa chỉ</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%                                    int count = 1;
                                                for (DONDATHANG dh : list_dh) {
                                            %>
                                            <tr>    

                                                <td name="STT"> <%=count%></td>

                                                <td name="MaDonHang"><%=dh.getMaDonDatHang()%></td>
                                                <%
                                                    String tinhtrang = "";
                                                    if (dh.getTinhTrangGiao() == 0) {
                                                        tinhtrang = "Đang đợi duyệt đơn hàng";
                                                    } else if (dh.getTinhTrangGiao() == 1) {
                                                        tinhtrang = "Đã xác nhận đơn hàng";
                                                    } else if (dh.getTinhTrangGiao() == 2) {
                                                        tinhtrang = "Đơn hàng đang chuẩn bị";
                                                    } else if (dh.getTinhTrangGiao() == 3) {
                                                        tinhtrang = "Đang giao hàng";
                                                    } else if (dh.getTinhTrangGiao() == 4) {
                                                        tinhtrang = "Đã giao thành công";
                                                    } else if (dh.getTinhTrangGiao() == 5) {
                                                        tinhtrang = "Đã hoàn trả";
                                                    }
                                                    if (dh.getDaHuy() == 1) {
                                                        tinhtrang = "Đã hủy đơn hàng";
                                                    }
                                                %>
                                                <td name="TinhTrangGiaoHang"><%=tinhtrang%></td>

                                                <%
                                                    String thanhtoan = "";
                                                    if (dh.getDaThanhToan() == 0) {
                                                        thanhtoan = "Chưa thanh toán";
                                                    } else if (dh.getDaThanhToan() == 1) {
                                                        thanhtoan = "Đã thanh toán";
                                                    }
                                                    if (dh.getDaHuy() == 1) {
                                                        thanhtoan = "Đã hủy đơn hàng";
                                                    }
                                                %>
                                                <td name="ThanhToan"><%=thanhtoan%></td>
                                                <td name="TongTien"><%=SANPHAM.convertToVND(dh.getTongTien())%> VNĐ</td>
                                                <td name="DiaChi"><%=dh.getDiaChiGiaoHang()%></td>
                                                <td>
                                                    <button type="button" class="btn btn-primary"><a style="color:black" href="XemChiTietDonHang?MaDonHang=<%=dh.getMaDonDatHang()%>">Xem</a></button>
                                                </td>                                    
                                            </tr>
                                            <%count++;
                         }%>
                                        </tbody>
                                    </table>
                                    <%}%>
                                </div>
                                <div class="after-content"></div>
                            </div>

                            <div style="margin-top:70px"class="col-left sidebar col-lg-3 col-md-3 col-sm-3 col-pull-3 hidden-xs ">
                                <div class="col-left-center">
                                    <div class="col-left-top">
                                        <div class="col-left-bottom">
                                            <div class="block block-account">
                                                <div class="block-content tabbable tabs-left">
                                                    <ul class="nav nav-tabs">
                                                        <li class="active" id="ThongTinChung"id="ThongTinChung"><a >Thông tin chung</a></li>
                                                        <li href="#ThongTinTaiKhoan" id="ThongTinTaiKhoan"><a >Thông tin tài khoản</a></li>
                                                        <li href="#SoDiaChiDe" id="SoDiachi"><a >Sổ địa chỉ</a></li>
                                                        <li id="DonHangCuaToi"><a >Đơn hàng của tôi</a></li>  
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="after-main"></div>
                        <div class="ht-container-outer">
                            <div class="promotions-blocks hidden-xs">
                                <a class="saleoffs-block" target="_blank" href="TrangChu" style="background-color: #; display: block;" alt="Con là số 1"> <img src="images/line-con-la-so-1.png" /> </a>
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
                        <header id="header" style="margin-top: 64px; margin-bottom: 40px">
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

                                                        <form id="search_mini_form" action="TimKiem" method="get" class="UI-SEARCHAUTOCOMPLETE" data-tip="Bố mẹ tìm gì cho bé hôm nay" data-url="" data-minchars="3" data-delay="500">
                                                            <div class="input-group top-search"> 
                                                                <input disabled="disabled" id="category_search" type="hidden" name="cat" value="" />
                                                                <input id="search" type="text" name="search" value="" class="form-control input-text UI-SEARCH UI-NAV-INPUT" maxlength="888888"/> 
                                                                <span class="input-group-btn"> 
                                                                    <button type="submit" title="Tìm kiếm" class="btn btn-kid btn-seach"> 
                                                                        <span class="ico-search">
                                                                        </span>
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
                                                                            KHACHHANG_DAO kh_dp1 = new KHACHHANG_DAO();
                                                                            KHACHHANG kh2 = kh_dp1.getKhachHang(Email);
                                                                            name = kh2.getTenKhachHang();
                                                                        }
                                                                    } catch (Exception e) {
                                                                        name = "";
                                                                    }
                                                                %>
                                                                <div class="toplogin" id="topLogin">
                                                                    <div class="right-login hidden-sm hidden-xs">
                                                                        <p class="p-account-link">
                                                                            <a href="ThongTinTaiKhoan?KhachHang=<%=Email%>" class="account-icon-link"> <span class="ico-user"><span></span></span> <span class="link-box"> Xin chào  <%=name%> <strong> <span id="account_link_id">Tài khoản</span> <span class="caret"></span> </strong>
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
                            <div id="undefined-sticky-wrapper" class="sticky-wrapper">
                                <div class="mt-menu-top">
                                    <div class="container">
                                        <div class="menu-top hidden-xs">
                                            <div class="megamenu-container">
                                                <h3 class="label"><span>Danh mục</span></h3>
                                                <div id="megamenu">
                                                    <%
                                                        LOAISANPHAM_DAO loai_sp = new LOAISANPHAM_DAO();
                                                        ArrayList<LOAISANPHAM> list = loai_sp.getLoaiSanPham();
                                                        for (LOAISANPHAM loai : list) {
                                                    %>
                                                    <ul id="mt_megamenu">
                                                        <li >
                                                            <a  style="margin:10px;color: black;text-transform: none;font-weight: normal;" href="XemDanhMuc?MaLoai=<%=loai.getMaLoaiSanPham()%>" rel="nofollow" target="_blank"><span><%=loai.getTenLoaiSanPham()%></span></a>
                                                        </li>
                                                    </ul>
                                                    <%}%>
                                                </div>    
                                            </div> 
                                        </div>         
                                    </div>               
                                </div>
                            </div>
                        </header>

                        </section>
                        </section>
                        </body>
                        </html>