<%@page import="DTO.KHACHHANG"%>
<%@page import="DAO.KHACHHANG_DAO"%>
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
        <link rel="stylesheet" type="text/css" href="css/single2.css" />
        <link rel="stylesheet" type="text/css" href="css/single1.css" />

        <!--[if lt IE 9]> <script type="text/javascript" src="//k.r.worldssl.net/media/js/64e83df62267718cbb1c41f1bffad418.js"></script> <![endif]-->

        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
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
    <body class=" catalog-product-view catalog-product-view"><a class="sr-only" href="#content">Skip to main content</a>
        <section class="mt-container">

            <section class="mt-wrapper">
                <div class="wrapper">
                    <div class="container col1-layout" id="content">
                        <div class="before-main">

                        </div> 
                        <div class="row" style="margin-top:20px; margin-bottom: 50px">
                            <div class="col-lg-12 col-main">
                                <div class="before-content">

                                </div><div class="account-login ">
                                    <div class="col-lg-12">
                                        <div class="login-form row">
                                            <div class="col2-set-right col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                                <form action="DangNhap" method="POST" id="login-form"> 

                                                    <div class="login-form row">
                                                        <div class="content">
                                                            <h3>Bạn đã có tài khoản</h3>
                                                            <ul class="form-list">
                                                                <li> <label for="email" class="required"><em>*</em>Email </label>
                                                                    <div class="input-box"> 
                                                                        <input data-url="" type="text" name="username" value="" id="email" data-validate="validate-email-phoneprefix" class="input-text form-control required-entry validate-email-phoneprefix" title="Địa chỉ email"> 

                                                                    </div>
                                                                </li>
                                                                <li> 
                                                                    <label for="pass" class="required"><em>*</em>Mật khẩu</label>
                                                                    <div class="input-box"> 
                                                                        <input type="password" name="password" class="input-text form-control required-entry validate-password" id="pass" title="Mật khẩu">
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                            <%
                                                                String status = "none";
                                                                try {
                                                                    status = (String) request.getAttribute("status");
                                                                } catch (NullPointerException e) {
                                                                    status = "none";
                                                                }
                                                                if (status.equals("none")) {
                                                            %>
                                                            <p class="required">* Phải nhập thông tin</p>
                                                            <%} else {%> 
                                                            <p class="required">* Tài khoản hoặc mật khẩu không đúng</p>
                                                            <%}%>
                                                        </div>
                                                        <div class="buttons-set"> 
                                                            <!--                                                            <a href="http://www.kidsplaza.vn/tai-khoan/quen-mat-khau" class="f-right">Quên mật khẩu?</a>-->
                                                            <button type="submit" class="button btn-kid btn btn-login" title="Đăng nhập" name="send" id="send2">
                                                                <span><span>Đăng nhập</span></span>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                            <div class="col2-set-left col-lg-9 col-md-9 col-sm-9  col-xs-12">
                                                <div class="col-1 new-users">
                                                    <div class="content">
                                                        <h3>Khách hàng mới</h3>
                                                        <p>Hãy tạo cho mình một tài khoản, bạn sẽ nhận được các ưu đãi bất ngờ mà chỉ thành viên mới có.</p>
                                                        <div class="button_creat"> 
                                                            <button type="button" title="Tạo tài khoản" class="button btn-kid btn btn-regisform btn-login"> 
                                                                <span><span>Tạo tài khoản</span></span> 
                                                            </button>
                                                        </div>
                                                        <%
                                                            int check = 0;
                                                            try {
                                                                check = (Integer) request.getAttribute("check");
                                                            } catch (Exception e) {
                                                                check = 0;
                                                            }
                                                        %>
                                                        <script>
                                                            $(document).ready(function () {
                                                                $(".btn-regisform").on('click', function () {
                                                                    $(".form_register").css("display", "block");
                                                                });
                                                            });
                                                        </script>
                                                        <%
                                                            if (check == 0) {
                                                        %>
                                                        <div class="form_register" style="display: none;">
                                                            <%} else {%>

                                                            <div class="form_register" style="display: block;">
                                                                <%}%>
                                                                <div class="account-create">
                                                                    <script>
                                                                        $(document).ready(function () {
                                                                            $("#form-register").validate({
                                                                                rules: {
                                                                                    phone_number: {
                                                                                        required: true,
                                                                                        number: true,
                                                                                        minlength: 9
                                                                                    },
                                                                                    firstname: {
                                                                                        required: true
                                                                                    },
                                                                                    lastname: {
                                                                                        required: true
                                                                                    },
                                                                                    email_address: {
                                                                                        required: true,
                                                                                        email: true
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
                                                                                    phone_number: {
                                                                                        required: "Vui lòng nhập số điện thoại",
                                                                                        number: "Số điện thoại không đúng",
                                                                                        minlength: "Số điện thoại không đúng"
                                                                                    },
                                                                                    firstname: {
                                                                                        required: "Vui lòng nhập họ"
                                                                                    },
                                                                                    lastname: {
                                                                                        required: "Vui lòng nhập tên"
                                                                                    },
                                                                                    email_address: {
                                                                                        required: "Vui lòng nhập email",
                                                                                        email: "Email không hợp lệ"
                                                                                    },
                                                                                    password: {
                                                                                        required: "Vui lòng nhập password"
                                                                                    },
                                                                                    confirmation: {
                                                                                        required: "Vui lòng nhập xác nhân password",
                                                                                        equalTo: "Password không trùng"
                                                                                    }
                                                                                }

                                                                            });
                                                                        });
                                                                    </script>
                                                                    <style>
                                                                        #phone_number-error, #firstname-error, #lastname-error, #email_address-error, #password-error, #confirmation-error{
                                                                            width: 100% !important;
                                                                            color:red !important;
                                                                        }
                                                                    </style>
                                                                    <form action="TaoTaiKhoan" method="post" id="form-register" class="form-horizontal"> 
                                                                        <input name="form_key" type="hidden">
                                                                        <div class="fieldset form-group"> 
                                                                            <input type="hidden" name="success_url" value=""> 
                                                                            <input type="hidden" name="error_url" value="">
                                                                            <ul class="form-list">
                                                                                <li class="fields">
                                                                                    <div class="field">
                                                                                        <label class="col-sm-2 control-label" for="telephone">Điện thoại</label>
                                                                                        <div class="input-box col-sm-10">
                                                                                            <input data-url="" type="input" name="phone_number" id="phone_number" value="" title="Điện thoại" data-validate="validate-phoneprefix" class="validate-phoneprefix input-text form-control">
                                                                                            <%
                                                                                                if (check == 3 || check == 4) {
                                                                                            %>
                                                                                            <div id="phone_miss" class="validation-success">Thông tin của bạn đã có trên hệ thống.</div>
                                                                                            <%}%>

                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li class="fields">
                                                                                    <div class="customer-name row">
                                                                                        <div class="field name-firstname col-sm-12"> 
                                                                                            <label class="required control-label" for="firstname"><em>*</em>Tên</label>
                                                                                            <div class="input-box col-sm-10">
                                                                                                <input type="text" id="firstname" id="firstname" name="firstname" value="" title="Tên" maxlength="255" class="input-sm form-control required-entry">
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="field name-lastname col-sm-12"> 
                                                                                            <label for="lastname" class="required control-label"><em>*</em>Họ</label>
                                                                                            <div class="input-box"> 
                                                                                                <input type="text" id="lastname" id="lastname" name="lastname" value="" title="Họ" maxlength="255" class="input-sm form-control required-entry">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                                <li class="fields">
                                                                                    <div class="field">
                                                                                        <label for="email_address" class="required col-sm-2 control-label"><em>*</em>Địa chỉ email</label>
                                                                                        <div class="input-box col-sm-10"> 
                                                                                            <input type="text" name="email_address" id="email_address" value="" title="Địa chỉ email" class="input-text form-control validate-email required-entry">
                                                                                            <%
                                                                                                if (check == 2 || check == 4) {
                                                                                            %>
                                                                                            <div id="email_miss" class="validation-success">Thông tin của bạn đã có trên hệ thống.</div>
                                                                                            <%}%>
                                                                                        </div>

                                                                                    </div>
                                                                                </li>
                                                                                <li class="fields">
                                                                                    <div class="field"> 
                                                                                        <label for="password" class="required col-sm-2 control-label"><em>*</em>Mật khẩu</label>
                                                                                        <div class="input-box col-sm-10"> 
                                                                                            <input type="password" name="password" id="password" title="Mật khẩu" class="input-text form-control required-entry validate-password">
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="field"> 
                                                                                        <label for="confirmation" class="required col-sm-2 control-label"><em>*</em>Nhập lại mật khẩu</label>
                                                                                        <div class="input-box col-sm-10"> 
                                                                                            <input type="password" name="confirmation" title="Nhập lại mật khẩu" id="confirmation" class="input-text form-control required-entry validate-cpassword">

                                                                                        </div>
                                                                                    </div>
                                                                                </li>

                                                                                <li>
                                                                                    <div class="field"> 
                                                                                        <label class="control-label col-sm-2"></label>
                                                                                        <div class="input-box col-sm-10">
                                                                                            <button type="submit" title="Gửi" class="button btn-kid btn btn-login pull-left"> 
                                                                                                <span><span>Gửi</span></span> 
                                                                                            </button>
                                                                                        </div>
                                                                                    </div>
                                                                                </li>
                                                                            </ul>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="after-content">

                                    </div>

                                </div>

                            </div>
                            <div class="after-main">

                            </div>

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
                        <header id="header" style="margin-top: 65px; margin-bottom: 20px">
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

                                                                    String Email = "null";
                                                                    try {

                                                                        Email = (String) request.getSession().getAttribute("Email");

                                                                    } catch (Exception e) {

                                                                    }


                                                                %>
                                                                <div class="toplogin" id="topLogin">
                                                                    <div class="right-login hidden-sm hidden-xs">
                                                                        <p class="p-account-link">
                                                                            <a href="ThongTinTaiKhoan?KhachHang=<%=Email%>" class="account-icon-link"> <span class="ico-user"><span></span></span> <span class="link-box"> Xin chào<strong> <span id="account_link_id">Tài khoản</span> <span class="caret"></span> </strong>
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
                        <footer id="footer">
                            <div id="footer_inner">


                                <div class="clearfix"></div>

                                <div class="switch-device" style="padding-bottom:20px;"> <a id="switch-to-mobile" class="change-device">CopyRight Kib Plaza</a></div>
                            </div>
                        </footer>
                        <a href="#location_dialog_container" id="location_dialog_button"></a>


                        <div id="back-to-top" class="back-to-top" style="display: none;">
                            <div class="btt-inner"> <a href="#" title="Lên đầu trang"><span>Lên đầu trang</span></a></div>
                        </div>
                        </section>
                        </section>

                        </html>