<%@page import="DTO.KHACHHANG"%>
<%@page import="DAO.KHACHHANG_DAO"%>
<%@page import="DTO.BINHLUAN"%>
<%@page import="DTO.BINHLUAN"%>
<%@page import="DAO.BINHLUAN_DAO"%>
<%@page import="DAO.SANPHAM_DAO"%>
<%@page import="DTO.LOAISANPHAM"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DAO.LOAISANPHAM_DAO"%>
<%@page import="DTO.SANPHAM"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <!--<![endif]-->

    <head>
        <%
            SANPHAM sp = (SANPHAM) request.getAttribute("SanPham");
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title><%=sp.getTenSanPham()%></title>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>

        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>

        <link rel="stylesheet" type="text/css" href="css/style1.css">
        <link href="css/style2.css" rel="stylesheet" type="text/css"/>
        <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.js" type="text/javascript"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>

    </head>
    <script>
        $(document).ready(function () {

            function onProductThumbActive(elm) {
                var item = $(elm);
                if (item.hasClass('active'))
                    return;
                $('.product-view .more-views img, .product-view .more-views-horizontal img').removeClass('active');
                item.addClass('active');
                $('.product-view img.img-main').fadeOut(100, function () {
                    $(this).attr('src', item.attr('data-small')).attr('data-large', item.attr('data-large')).fadeIn(100);
                });
                initImageZoomSl();
            }
            $('.product-view .more-views img, .product-view .more-views-horizontal img').on('click', function (e) {
                onProductThumbActive(e.target);
            });
            $('.product-view .more-views img, .product-view .more-views-horizontal img').hover(function (e) {
                onProductThumbActive(e.target);
            });
            $('.owl-carousel').each(function (i, slider) {
                var id = $(slider).attr('id');
                if (!id || !window[id])
                    return;
               $(slider).owlCarousel(window[id]);
            });
            var carCount = jQuery('.product-img-box #thumbs').find('a').length;
            if (carCount <= 4) {
                $('.product-img-box .more-views-nav').hide();
            }
            $(".product-img-box #carousel-up").on("click", function () {
                if (!$(".product-img-box #thumbs").is(':animated')) {
                    var bottom = $(".product-img-box #thumbs > a:last-child");
                    var clone = $(".product-img-box #thumbs > a:last-child").clone();
                    clone.prependTo(".product-img-box #thumbs");
                    $(".product-img-box #thumbs").animate({"top": "-=85"}, 0).stop().animate({"top": '+=85'}, 250, function () {
                        bottom.remove();
                    });
                    clone.on('click', function (e) {
                        onProductThumbActive(e.target);
                    });
                    clone.hover(function (e) {
                        onProductThumbActive(e.target);
                    });
                }
            });
            $(".product-img-box #carousel-down").on("click", function () {
                if (!$(".product-img-box #thumbs").is(':animated')) {
                    var top = $(".product-img-box #thumbs > a:first-child");
                    var clone = $(".product-img-box #thumbs > a:first-child").clone();
                    clone.appendTo(".product-img-box #thumbs");
                    $(".product-img-box #thumbs").animate({"top": '-=85'}, 250, function () {
                        top.remove();
                        $(".product-img-box #thumbs").animate({"top": "+=85"}, 0);
                    });
                    clone.on('click', function (e) {
                        onProductThumbActive(e.target);
                    });
                    clone.hover(function (e) {
                        onProductThumbActive(e.target);
                    });
                }
            });
            var carhCount = $('.product-img-box #thumbs_horizontal').find('a').length;
            $(".product-img-box #thumbs_horizontal").width(90 * carhCount);
            if (carhCount <= 4) {
                $('.product-img-box .horizontal-nav').hide();
            }
            $(".product-img-box #carousel-horizontal-up").on("click", function () {
                var bottom = $(".product-img-box #thumbs_horizontal > a:last-child");
                if (!$(".product-img-box #thumbs_horizontal").is(':animated')) {
                    var clone = $(".product-img-box #thumbs_horizontal > a:last-child").clone();
                    clone.prependTo(".product-img-box #thumbs_horizontal");
                    clone.on('click', function (e) {
                        onProductThumbActive(e.target);
                    });
                    clone.hover(function (e) {
                        onProductThumbActive(e.target);
                    });
                }
                $(".product-img-box #thumbs_horizontal").animate({"left": "-=85"}, 0).stop().animate({"left": '+=85'}, 250, function () {
                    bottom.remove();
                });
            });
            $(".product-img-box #carousel-horizontal-down").on("click", function () {
                var top = $(".product-img-box #thumbs_horizontal > a:first-child");
                if (!$(".product-img-box #thumbs_horizontal").is(':animated')) {
                    var clone = $(".product-img-box #thumbs_horizontal > a:first-child").clone();
                    clone.appendTo(".product-img-box #thumbs_horizontal");
                    clone.on('click', function (e) {
                        onProductThumbActive(e.target);
                    });
                    clone.hover(function (e) {
                        onProductThumbActive(e.target);
                    });
                }
                $(".product-img-box #thumbs_horizontal").animate({"left": '-=85'}, 250, function () {
                    top.remove();
                    $(".product-img-box #thumbs_horizontal").animate({"left": "+=85"}, 0);
                });
            });
        });
    </script>
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
    <body class="container catalog-product-view catalog-product-view"><a class="sr-only" href="#content">Skip to main content</a>
        <section class="mt-container">
            <%
                SANPHAM_DAO sp_dp = new SANPHAM_DAO();
                sp_dp.updateLuotXem(sp.getMaSanPham());
            %>
            <section class="mt-wrapper">
                <div class="wrapper">
                    <div class="container col1-layout" id="content">
                        <div class="before-main"></div> <noscript><div class="global-site-notice noscript"><div class="notice-inner"><p> <strong>JavaScript seems to be disabled in your browser.</strong><br /> You must have JavaScript enabled in your browser to utilize the functionality of this website.</p></div></div> </noscript>
                        <div
                            class="row">
                            <div class="col-lg-12 col-main">
                                <ul class="messages ispeed-messages"></ul>
                                <div class="before-content"></div> 

                                <div id="messages_product_view"></div>
                                <div class="product-view">

                                    <div class="product-essential row show-grid" style="margin-top:50px">
                                        <div class="product-essential-inner">
                                            <form action="ThemGioHang" method="post" id="product_addtocart_form"> 

                                                <input type="hidden" name="product" id="product-field" value="<%=sp.getMaSanPham()%>" /> 
                                                <input type="hidden" name="product_sl" id="product-sl" value="1" /> 

                                                <div class="product-img-box col-md-6 col-lg-6">
                                                    <div class="more-views">
                                                        <a class="more-views-prev more-views-nav" href="" id="carousel-up"> <i class="glyphicon glyphicon-chevron-up"></i> </a>
                                                        <div class="media-list">
                                                            <div id="thumbs" class="cycle-slideshow vertical">
                                                                <%
                                                                    String[] list_image = sp.getHinhAnh();
                                                                    for (String image : list_image) {
                                                                %>
                                                                <a><img width="85" height="85" data-small="<%=image%>" data-large="<%=image%>"
                                                                        src="<%=image%>" /> </a>
                                                                    <%}%>
                                                            </div>
                                                        </div>
                                                        <a class="more-views-next more-views-nav" href="" id="carousel-down"> <i class="glyphicon glyphicon-chevron-down"></i> </a>
                                                    </div>
                                                    <p class="product-image"> <img class="img-responsive img-main img-zoom img-popup" src="<%=sp.getHinhAnh()[0]%>" data-large="<%=sp.getHinhAnh()[0]%>"
                                                                                   alt="<%=sp.getTenSanPham()%>" /></p>
                                                    <div class="more-views-horizontal">
                                                        <a class="horizontal-prev horizontal-nav" href="javascript:void(0)" id="carousel-horizontal-up"> <i class="glyphicon glyphicon-chevron-left"></i> </a>
                                                        <div class="media-list-horizontal">
                                                            <div id="thumbs_horizontal" class="cycle-slideshow horizontal">
                                                                <%

                                                                    for (String image : list_image) {
                                                                %>
                                                                <a><img class="" width="85" height="85" data-small="<%=image%>" data-large="<%=image%>"
                                                                        src="<%=image%>" /> </a>
                                                                    <%}%>
                                                            </div>
                                                        </div>
                                                        <a class="horizontal-next horizontal-nav" href="javascript:void(0)" id="carousel-horizontal-down"> <i class="glyphicon glyphicon-chevron-right"></i> </a>
                                                    </div>
                                                    <style>
                                                        .kids-gift-icon {
                                                            position: absolute;
                                                            top: 0px;
                                                            right: 10px;
                                                        }
                                                    </style>
                                                </div>
                                                <div class="product-shop col-md-6 col-lg-6 col-sm-6 col-xs-12">
                                                    <div class="page-title">
                                                        <h1 itemprop="name"> <%=sp.getTenSanPham()%></h1> <span class="brand"> <small>by</small> <a href=""> Canpol </a> </span></div>
                                                    <div class="row">
                                                        <div class="mt-social-links col-lg-5 col-md-5 col-sm-5 col-xs-12">
                                                            <div class="so-facebook so-social-share">
                                                                <div id="fb-root"></div>
                                                                <div class="fb-like" data-href="ChiTietSanPham?MaSanPham=<%=sp.getMaSanPham()%>" data-send="false" data-layout="button_count" data-width="20" data-show-faces="false"></div>
                                                            </div>
                                                            <div class="so-plusone so-social-share">
                                                                <div data-count="true" data-annotation="inline" data-href="ChiTietSanPham?MaSanPham=<%=sp.getMaSanPham()%>" class="g-plusone" data-width="100" data-size="medium"></div>
                                                            </div>
                                                            <div class="fb-send" data-href="ChiTietSanPham?MaSanPham=<%=sp.getMaSanPham()%>"></div>
                                                        </div>
                                                        <div class="review col-lg-7 col-md-7 col-sm-7 col-xs-12"> <span id="product-sku" class="product-sku">Mã sản phẩm: <%=sp.getMaSanPham()%></span> <span class="separator">|</span>


                                                        </div>

                                                        <input name="check" id="checkSoLuong" value="<%=sp.getSoLuong()%>" style="display:none">
                                                        <script>
                                                            $(document).ready(function () {
                                                                var soluong = $("#checkSoLuong").val();
                                                                if (soluong <= 0) {
                                                                    $("#view-in-stock").css("display", "none");
                                                                    $("#view-in-stock-over").css("display", "block");
                                                                    $("#out-of-stock-over").css("display", "block");
                                                                    $("#out-of-stock").css("display", "none");
                                                                }
                                                            });
                                                        </script>
                                                        <div id="view-in-stock" class="php-in-stock"> 
                                                            <label class="labelstatus">Tình trạng: <span class="availability">Còn hàng (Còn <%=sp.getSoLuong()%> sản phẩm)</span> </label>
                                                        </div>
                                                       
                                                    </div>

                                                    <div id="out-of-stock-over" class="lineprices out-of-stock php-out-of-stock" style="display: none;">
                                                        <p>Đã bán hết</p>
                                                    </div>
                                                    <div class="right-desc" id="out-of-stock">
                                                        <div id="add-to-cart" class="add-to-cart">
                                                            <div class="row">
                                                                <div class="col-lg-7">
                                                                    <div class="row php-in-stock">
                                                                        <script>
                                                                            $(document).ready(function () {
                                                                                $('.add-to-cart #arrow-top').click(function () {
                                                                                    var parent = $(this).parents('.add-to-cart'), input = parent.find('input#qty');
                                                                                    if (!input.length)
                                                                                        return;
                                                                                    var oldValue = !isNaN(input.val()) ? parseInt(input.val()) : 1;
                                                                                    input.val(oldValue + 1);

                                                                                    var price = $("#price-pro").val().match(/\d+/);
                                                                                    var number = $("#qty").val().match(/\d+/);
                                                                                    var money = price * number;
                                                                                    var money_str = money.toString();
                                                                                    function reverse(s) {
                                                                                        var o = '';
                                                                                        for (var i = s.length - 1; i >= 0; i--)
                                                                                            o += s[i];
                                                                                        return o;
                                                                                    }
                                                                                    ;

                                                                                    function convert(money_str) {
                                                                                        var rs = "";
                                                                                        var count = 0;
                                                                                        for (var i = 0; i < money_str.length; i++) {
                                                                                            rs = rs + money_str[i];
                                                                                            count = count + 1;
                                                                                            if (count % 3 === 0) {
                                                                                                rs = rs + ".";
                                                                                            }
                                                                                        }
                                                                                        return rs;
                                                                                    }
                                                                                    ;

                                                                                    var num = convert(reverse(money_str));
                                                                                    num = reverse(num);
                                                                                    if (num[0] === ".") {
                                                                                        num = num.substr(1, num.length);
                                                                                    }

                                                                                    $("#total-price").text(num);
                                                                                });
                                                                                $('.add-to-cart #arrow-bottom').click(function () {
                                                                                    var parent = $(this).parents('.add-to-cart'), input = parent.find('input#qty');
                                                                                    if (!input.length)
                                                                                        return;
                                                                                    var oldValue = !isNaN(input.val()) ? parseInt(input.val()) : 1;
                                                                                    input.val(oldValue - 1 < 1 ? 1 : oldValue - 1);

                                                                                    var price = $("#price-pro").val().match(/\d+/);
                                                                                    var number = $("#qty").val().match(/\d+/);
                                                                                    var money = price * number;
                                                                                    var money_str = money.toString();
                                                                                    function reverse(s) {
                                                                                        var o = '';
                                                                                        for (var i = s.length - 1; i >= 0; i--)
                                                                                            o += s[i];
                                                                                        return o;
                                                                                    }

                                                                                    function convert(money_str) {
                                                                                        var rs = "";
                                                                                        var count = 0;
                                                                                        for (var i = 0; i < money_str.length; i++) {
                                                                                            rs = rs + money_str[i];
                                                                                            count = count + 1;
                                                                                            if (count % 3 === 0) {
                                                                                                rs = rs + ".";
                                                                                            }
                                                                                        }
                                                                                        return rs;
                                                                                    }
                                                                                    ;

                                                                                    var num = convert(reverse(money_str));
                                                                                    num = reverse(num);
                                                                                    if (num[0] === ".") {
                                                                                        num = num.substr(1, num.length);
                                                                                    }

                                                                                    $("#total-price").text(num);
                                                                                });
                                                                            });
                                                                        </script>
                                                                        <script>
                                                                            $(document).ready(function () {

                                                                                var price = $("#price-pro").val().match(/\d+/);
                                                                                var number = $("#qty").val().match(/\d+/);

                                                                                var money = price * number;
                                                                                var money_str = money.toString();
                                                                                function reverse(s) {
                                                                                    var o = '';
                                                                                    for (var i = s.length - 1; i >= 0; i--)
                                                                                        o += s[i];
                                                                                    return o;
                                                                                }

                                                                                function convert(money_str) {
                                                                                    var rs = "";
                                                                                    var count = 0;
                                                                                    for (var i = 0; i < money_str.length; i++) {
                                                                                        rs = rs + money_str[i];
                                                                                        count = count + 1;
                                                                                        if (count % 3 === 0) {
                                                                                            rs = rs + ".";
                                                                                        }
                                                                                    }
                                                                                    return rs;
                                                                                }
                                                                                ;
                                                                                var num = convert(reverse(money_str));
                                                                                num = reverse(num);
                                                                                if (num[0] === ".") {
                                                                                    num = num.substr(1, num.length);
                                                                                }

                                                                                $("#total-price").text(num);
                                                                            });
                                                                        </script>
                                                                        <div class="lineprices php-in-stock" style="">
                                                                            <div class="price-box php-orginal-price"> 
                                                                                <input style="display:none" id="price-pro" value="<%=sp.getDonGia()%>"/>
                                                                                <span class="price-label">Giá bán :</span> <span class="regular-price" id="product-price"> <span value="<%=sp.getDonGia()%>" class="price"><%=sp.getDonGiaString()%>₫</span> </span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6">
                                                                            <div class="quantity"> <label for="qty">Số lượng:</label>
                                                                                <div class="input-group">
                                                                                    <span id="arrow-bottom" class="input-group-btn">
                                                                                        <button class="btn btn-info btn-qty" type="button">-</button>
                                                                                    </span> 
                                                                                    <input readonly type="text" autocomplete="off" max="99" min="1" name="qty" id="qty" maxlength="2" value="1" title="Số lượng" class="form-control qty " /> 
                                                                                    <span id="arrow-top" class="input-group-btn"><button class="btn btn-info btn-qty" type="button">+</button>
                                                                                    </span>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="col-lg-6">
                                                                            <div id="product-price-total"><label>Thành tiền:</label><span id="total-price"class="price"></span></div>
                                                                        </div>
                                                                        <div class="clearfix"></div>
                                                                        <div class="col-lg-12">
                                                                            <div class="add-bt"> 

                                                                                <input name="thanhtoan" type="submit" class="btn btn-kid btn-cart btn-login" value="Thanh Toán"/>


                                                                                <a type="button" id="themGioHang" class="btn btn-kid btn-cart btn-login btn-yellow" title="Mua ngay" data-toggle="modal" data-target="#addCart" style="padding-top: 20px"> 
                                                                                    <span>THÊM VÀO GIỎ HÀNG</span>
                                                                                </a>

                                                                                <input id="checkLogin" style="display:none" value="<%=(String) request.getSession().getAttribute("Email")%>"/>
                                                                                <form id="formCheck" action="ThongTinTaiKhoan?KhachHang=null"></form>
                                                                                <script>
                                                                                    $(document).ready(function () {
                                                                                        $("#themGioHang").on('click', function () {
                                                                                            var user = $("#checkLogin").val();
                                                                                            if (user === "null") {
                                                                                                window.location.href = "http://localhost:9090/DemoThuongMaiDienTu/ThongTinTaiKhoan?KhachHang=null";
                                                                                            }
                                                                                        });
                                                                                    });
                                                                                </script>
                                                                                <div class="modal" id="addCart" role="dialog" style="margin-top: 100px; margin-left:500px">

                                                                                    <div class="modal-dialog modal-sm" >
                                                                                        <div class="modal-content">
                                                                                            <div class="modal-header">
                                                                                                <h4 class="modal-title">Thông báo</h4>
                                                                                            </div>
                                                                                            <div class="modal-body">
                                                                                                <p>Đã thêm vào giỏ hàng thành công</p>
                                                                                            </div>
                                                                                            <div class="modal-footer">

                                                                                                <button type="submit" id="submitGioHang" class="btn btn-default" /> Tiếp tục mua hàng </button>
                                                                                                <input type="submit" class="btn btn-default" name="thanhtoan" title="Thanh Toán" value="Thanh Toán">
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                </div>
                                                                <div class="col-lg-5 box-promotions">
                                                                    <h3><a href="#">Chính sách bán hàng</a></h3>
                                                                    <div class="short-desc">
                                                                        <ul>
                                                                            <li>Gọi ngay để đặt h&agrave;ng:<br /><strong style="color: #ff0000;">1800.0000</strong> (miễn ph&iacute;)</li>
                                                                            <li>Đổi trả<strong> MIỄN PH&Iacute;</strong> trong 45 ng&agrave;y <strong>- </strong><a href="" target="_blank">Chi tiết</a></li>
                                                                            <li>Giao h&agrave;ng trong <strong>2-4 giờ</strong> đến nh&agrave; kh&aacute;ch h&agrave;ng (nếu c&aacute;ch Kids Plaza gần hơn 6Km) - <a href=""                                                                                                                                                                           target="_blank">Chi tiết</a></li>
                                                                            <li>Cam kết ho&agrave;n tiền ch&ecirc;nh lệch c&aacute;c cửa h&agrave;ng đồng hạng c&oacute; gi&aacute; thấp hơn - <a href="" target="_blank">Chi tiết</a></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <input id="phone_prefix" name="phone_prefix" type="hidden" value="090,091,092,093,094,095,096,097,098,0120,0121,0122,0123,0124,0125,0126,0127,0128,0129,0163,0164,0165,0166,0167,0168,0169,0186,0188,0199,0162,099" />
                                                <input id="phone_len" name="phone_len" type="hidden" value="7">
                                            </form>
                                        </div>
                                    </div> 
                                    <div class="product-quick-link-box">
                                        <ul>
                                            <li class="item description"><a href="#xem-them"><span>Thông tin chi tiết</span></a></li>

                                            <li class="item review"><a href="#product-review-anchor"><span>Đánh giá</span></a></li>

                                        </ul>
                                    </div>
                                    <div itemprop="description" id="product-description">
                                        <a id="xem-them" name="xem-them"></a>
                                        <h3><span>Thông tin chi tiết</span></h3>
                                        <div class="desc">
                                            <h2 id="getName" class="subject"><strong><%=sp.getTenSanPham()%></strong></h2>
                                                    <%=sp.getMoTa()%>
                                        </div>
                                    </div>
                                    <div class="more-area">
                                        <div class="brarnd-des">
                                            <h3><span>Thông tin thương hiệu</span></h3>
                                            <div class="brand-content clearfix">
                                                <div class="des-content clearfix brands-collapse-lessmore">
                                                    <div class="brand-img"> <img src="//k.r.worldssl.net/media/wysiwyg/150x150/canpol_1.png" alt="Canpol" /></div>
                                                    <p>Được th&agrave;nh lập v&agrave;o năm 1990, c&ocirc;ng ty đ&atilde; ph&aacute;t triển rất nhanh ch&oacute;ng, tạo n&ecirc;n bộ sưu tập c&aacute;c sản phẩm d&agrave;nh cho b&eacute; v&ocirc; c&ugrave;ng độc
                                                        đ&aacute;o. Hiện tại, bộ sưu tập của Canpol Babies bao gồm hơn 600 sản phẩm đ&aacute;p ứng đầy đủ nhu cầu của kh&aacute;ch h&agrave;ng. H&agrave;ng năm Canpol c&oacute; hơn 60 sản phẩm mới (gồm cả những
                                                        bộ sưu tập sản phẩm) được giới thiệu v&agrave; ph&acirc;n phối tr&ecirc;n thị trường.</p>
                                                    <p>Canpol một trong những nh&atilde;n hiệu nổi tiến đến từ Ba Lan</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>


                                    <div class="product-upsell-wrapper-ttt">
                                        <div class=" category-products spreview-products review-social-container product-upsell-static limit-6">
                                            <h3 class="title"> <span>Sản phẩm tương tự </span></h3>
                                            <div class="products-grid">
                                                <%
                                                    SANPHAM_DAO sp_dao = new SANPHAM_DAO();
                                                    ArrayList<SANPHAM> list_tuongtu = sp_dao.getSanPhamTuongTu(sp);
                                                    for (SANPHAM sp2 : list_tuongtu) {
                                                %>
                                                <div class="item-0 item first">
                                                    <a href="ChiTietSanPham?MaSanPham=<%=sp2.getMaSanPham()%>" title="<%=sp2.getTenSanPham()%>" class="product-image"> <img src="<%=sp2.getHinhAnh()[0]%>" width="135" height="135" alt="<%=sp2.getTenSanPham()%>" /></a>
                                                    <h3 class="product-name"> <a href="ChiTietSanPham?MaSanPham=<%=sp2.getMaSanPham()%>" title="<%=sp2.getTenSanPham()%>"> <%=sp2.getTenSanPham()%></a></h3>
                                                    <div class="price-box"> <span class="price-label">Giá bán </span> <span class="regular-price" id="product-price-1439"> <span class="price"><%=sp2.getDonGiaString()%> ₫</span> </span>
                                                    </div>
                                                </div>
                                                <%}%>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row product-collateral"></div>
                                    <div class="row">
                                        <div id="product-review">
                                            <a id="product-review-anchor" name="product-review-anchor"></a>
                                            <h2><span>Bình luận về sản phẩm</span></h2>
                                            <div class="mt-review-main col-md-12">
                                                <div class="form-add row">
                                                    <fieldset>
                                                        <%
                                                            BINHLUAN_DAO bl_dao = new BINHLUAN_DAO();
                                                            ArrayList<BINHLUAN> list_bl = bl_dao.getBinhLuan(sp.getID());
                                                            for (BINHLUAN bl : list_bl) {
                                                                KHACHHANG_DAO kh_dp = new KHACHHANG_DAO();
                                                                KHACHHANG kh = kh_dp.getKhachHangID(bl.getTb_khachhang_ID());
                                                        %>
                                                        <div class="form-list media"> 
                                                            <span class="author-img img pull-left">
                                                                <img src="//k.r.worldssl.net/skin/frontend/kidsplaza/2015/images/comment-default-avatar.jpg"/>
                                                            </span>
                                                            <div class="media-body"> 
                                                                <h5><%=kh.getHoKhachHang() + " " + kh.getTenKhachHang()%><h5>
                                                                        <h5><%=bl.getTieuDe()%></h5>
                                                                        <hr>
                                                                        <div class="form-field">
                                                                            <p><%=bl.getNoiDung()%></p>
                                                                        </div>                                                            
                                                                        </div>
                                                                        </div>
                                                                        <%}%>
                                                                        </fieldset>
                                                                        </div>
                                                                        </div>

                                                                        <div id="main-review">
                                                                            <div class="mt-review-main col-md-12">
                                                                                <div class="form-add row"> <span class="your-review">Đánh giá của bạn về sản phẩm này</span>
                                                                                    <form action="ThemBinhLuan" method="post" id="review-form"> 
                                                                                        <input name="product_id" style="display:none" value="<%=sp.getID()%>"/>
                                                                                        <input name="product_ma" style="display:none" value="<%=sp.getMaSanPham()%>"/>
                                                                                        <fieldset>
                                                                                            <div class="form-list media"> 
                                                                                                <span class="author-img img pull-left">
                                                                                                    <img src="//k.r.worldssl.net/skin/frontend/kidsplaza/2015/images/comment-default-avatar.jpg"/>
                                                                                                </span>
                                                                                                <div class="media-body"> <textarea style="resize: none;" name="detail" id="review_field" cols="5" rows="3" class="required-entry form-control" placeholder="Viết nhận xét của bạn"></textarea>
                                                                                                    <div class="form-field">
                                                                                                        <div class="row">
                                                                                                            <div class="input-box col-lg-6 col-md-6"> <label for="summary_field">Tiêu đề</label>
                                                                                                                <input type="text" name="title" id="summary_field" class="input-text form-control" value="" />
                                                                                                            </div>
                                                                                                            <div class="clearfix"></div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                    <div class="form-field">
                                                                                                        <div class="row">
                                                                                                            <div class="col-lg-8 col-md-8">


                                                                                                            </div>
                                                                                                            <div class="col-lg-4 col-md-4">
                                                                                                                <div class="buttons-set"> <button type="submit" title="Gửi nhận xét" class="button btn-login btn"><span><span>Gửi nhận xét</span></span></button></div>
                                                                                                            </div>
                                                                                                            <div class="clearfix"></div>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </div>
                                                                                        </fieldset>
                                                                                    </form>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="box-collateral box-reviews" id="customer-reviews"></div>
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
                                                                                                                            KHACHHANG kh = kh_dp.getKhachHang(Email);
                                                                                                                            name = kh.getTenKhachHang();
                                                                                                                        }
                                                                                                                    } catch (Exception e) {
                                                                                                                        name = "";
                                                                                                                    }
                                                                                                                %>
                                                                                                                <div class="toplogin" id="topLogin">
                                                                                                                    <div class="right-login hidden-sm hidden-xs">
                                                                                                                        <p class="p-account-link">
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
                                                                                <div class="footer-top">

                                                                                </div>

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