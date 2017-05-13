<%@page import="DAO.SANPHAM_DAO"%>
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
       <%
           String method = (String)request.getAttribute("method");
       %>
       <h3><%=method%></h3>
    </body>
</html>