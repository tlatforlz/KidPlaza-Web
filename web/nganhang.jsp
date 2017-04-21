<%-- 
    Document   : nganhang
    Created on : Apr 18, 2017, 10:41:24 AM
    Author     : tranl
--%>

<%@page import="DTO.CHITIETDATHANG"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="DTO.SANPHAM"%>
<%@page import="DTO.DONDATHANG"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width initial-scale=1.0 maximum-scale=1.0 user-scalable=yes">
        <title>123Pay - Thanh toán bằng thẻ ghi nợ nội địa (thẻ ATM)</title>
        <link rel="shortcut icon" href="https://img.123pay.vn/img123pay/images/icon/123pay_icon.ico" type="image/ico">
        <meta content="" name="description">
        <meta content="123, 123pay.vn, 123pay, 123 pay, 1 2 3 pay, thanh toán, trực tuyến, ZingXu, thẻ ATM" name="keywords">
        <link type="text/css" rel="stylesheet" href="https://img.123pay.vn/img123ib/atm/static/css/foundation.css">
        <link type="text/css" rel="stylesheet" href="https://img.123pay.vn/img123ib/atm/static/css/style3.css?v=1">
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="//www.kidsplaza.vn/skin/frontend/kidsplaza/2015/css/font-awesome.min.css" />
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script>
        <script src="https://cdn.jsdelivr.net/jquery.validation/1.15.0/additional-methods.min.js"></script>
    </head>
    <body>
        <script>
            $(document).ready(function () {
                $("#verifycardForm").validate({
                    rules: {
                        maskCardNumber: {
                            required: true,
                            number:true,
                            minlength:13
                        },
                        cardHolderName: {
                            required: true
                        },
                        cardDate: {
                            required: true
                        },
                        password: {
                            required: true
                        }
                    },
                    messages: {
                        maskCardNumber: {
                            required: "Vui lòng nhập số thẻ",
                            number: "Số thẻ không hợp lệ",
                            minlength:"Số thẻ không hợp lệ"
                        },
                        cardHolderName: {
                            required: "Vui lòng nhập tên chủ thẻ"
                        },
                        cardDate: {
                            required: "Vui lòng nhập ngày mở thẻ"
                        },
                        password: {
                            required: "Vui lòng nhập mật khẩu"
                        }
                    }
                });
            });
        </script>
        <div id="page">
            <div class="subHeader">
                <div class="head-top">
                    <img class="left-img" src="https://img.123pay.vn/img123pay/images/merchant/7b7e5a495504392035c584249605f37c_kids1.png">
                </div>
            </div>

            <div id="content">
                <%
                    DONDATHANG ddh = (DONDATHANG) request.getSession().getAttribute("DonDatHang");
                   
                %>  
                
                <div class="boxhd">
                    <div class="corner"><img src="https://img.123pay.vn/img123ib/atm/static/img/cor.png"></div>
                    <div class="td1">
                        <p class="text-gray-label"><strong>Đơn vị</strong></p>
                        <p class="text-gray-label"><strong>KIDS PLAZA</strong></p>
                    </div>
                    <div class="td2">
                        <p class="text-gray-label"><strong>Đơn hàng</strong></p>
                        <p class="text-gray">Thanh toán đơn hàng <%=ddh.getMaDonDatHang()%> </p>
                    </div>
                    <div class="td3">
                        <p><strong>Số tiền </strong></p>
                        <p style=" color:#F60; font-weight:bold; font-size:16px;"> <%=SANPHAM.convertToVND(ddh.getTongTien())%>VND</p>
                    </div>

                    <div class="boxform">
                        <div class="td4">
                            <form class="contactForm" name="verifycardForm" id="verifycardForm" method="post" action="NganHang">
                                <div class="accordion-section">
                                    <div style="display:block;" id="accordion-1" class="accordion-section-content">
                                        <div>
                                            <div class="form-group" style="margin-top:0px;">
                                                <input class="" type="tel" value="" id="maskCardNumber" name="maskCardNumber" placeholder="Số Thẻ">
                                            </div>
                                            <div class="form-group" style="margin-top:0px;">
                                                <input class="" type="text" value="" placeholder="Họ tên chủ thẻ" id="cardHolderName" name="cardHolderName">
                                            </div>
                                            <div class="form-group" style="float:left; width:100%; margin-top:0;">
                                                <input placeholder="Ngày phát hành (MM/YY)" type="tel" name="cardDate" id="cardDate" value="" style=" margin-bottom:0;">
                                            </div>

                                            <div class="form-group" style="float:left; width:100%; margin-top:0;">                                    
                                                <input type="password" name="password" id="password" value="" style=" margin-bottom:0;" placeholder="Mật Khẩu">
                                            </div>

                                            <div class="boxtotal">
                                                <p style="font-size:16px;"><strong>Số tiền:</strong></p>
                                                <p style="text-align:right; color:#F60; font-size:16px;"><strong> <%=SANPHAM.convertToVND(ddh.getTongTien())%></strong></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <p id="accordion-1-btn" style="text-align:center;">
                                    <input style="border: none;padding: 14px !important; margin-top: 15px;" class="o-buttons b-big blue" type="submit" id="btSubmit" value="Thanh toán đảm bảo">
                                </p>
                                <p style="text-align:center; margin-top: 5px;">
                                    <a style="text-decoration:underline; color:#666;" href="HuyGiaoDich">Hủy giao dịch </a>
                                </p>
                            </form>
                        </div>
                        <div class="td5"><img src="https://img.123pay.vn/img123ib/atm/static/images/atm/agb.jpg">

                        </div>
                    </div>
                </div>
                <div id="footer" class="footer">

                    <p style="width:60%"><strong>Thanh toán đảm bảo thông qua cổng 123Pay      </strong>
                        <br> Đơn vị chủ quản: CÔNG TY TNHH ZION
                        <br> Giấy phép hoạt động cung ứng dịch vụ trung gian thanh toán số 19/GP-NHNN </p>
                    <p style="padding-left: 20px;width:40%"><label>
                            <iframe src="https://123pay.vn/ib/atm/index.php/page/trustwave" frameborder="0" style="width:111px;height: 100px; overflow: hidden;" scrolling="no"></iframe>

                        </label><strong>Hỗ trợ khách hàng </strong><br> Hotline: <strong style="color:#F00;">1900 545 436</strong><br> Email: <a href="mailto:hotro@123pay.vn">hotro@123pay.vn</a>
                    </p>
                </div>
            </div>
        </div>
    </body>

</html>