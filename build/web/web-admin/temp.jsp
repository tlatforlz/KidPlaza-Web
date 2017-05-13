<%-- 
    Document   : temp.jsp
    Created on : Mar 13, 2017, 3:17:57 AM
    Author     : tranl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String sp_name = (String) request.getAttribute("sp_name");
            String sp_loai[] = (String[]) request.getAttribute("sp_loai");
            String sp_nhasanxuat = (String) request.getAttribute("sp_nhasanxuat");
            String sp_mota = (String) request.getAttribute("sp_mota");
            String sp_giatien = (String) request.getAttribute("sp_giatien");
            String sp_giamgia = (String) request.getAttribute("sp_giamgia");
            String sp_anhchinh = (String) request.getAttribute("sp_anhchinh");
            String[] listanh = (String[]) request.getAttribute("sp_listanh");
            
        %>
        <h5><%=sp_anhchinh%></h5>
          <%
            for (int i = 0; i < listanh.length; i++) {
        %><h5><%=listanh[i]%></h5>
        <%}
            for (int i = 0; i < listanh.length; i++) {
        %><img src="<%=listanh[i]%>"><%
            }
                for (String sp : sp_loai) {
        %> <h5><%=sp%></h5><%
            }
        %>
        <h5><%=sp_name%></h5>
        <h5><%=sp_nhasanxuat%></h5>
        <%=sp_mota%>
        <h5><%=sp_giatien%></h5>
        <h5><%=sp_giamgia%></h5>
        <img src="<%=sp_anhchinh%>">

    </body>
</html>
