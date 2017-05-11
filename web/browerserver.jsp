<%-- 
    Document   : loadimage.jsp
    Created on : Mar 14, 2017, 12:26:42 AM
    Author     : tranl
--%>

<%@page import="java.util.Arrays"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.io.File"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/loadimage.css" rel="stylesheet" type="text/css"/>
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery-1.11.1.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.min.js" type="text/javascript"></script>
        <link href="css/image-picker.css" rel="stylesheet" type="text/css"/>

        <script src="js/image-picker.js" type="text/javascript"></script>
    </head>
    <body>
        <script>
            $(document).ready(function () {
                $("select").imagepicker();
                $("#reload_btn").on("click", function () {
                    location.reload(true);
                });
                $("#get-image").on("click", function () {
                    var s = $(".selected");
                    var y = s.find('img');
                    var link = [];
                    for (var i = 0; i < y.length; i++) {
                        link.push(y[i].currentSrc);

                    }
                    window.opener.$('#cke_77_textInput').val(link[0]);
                    window.opener.$('#cke_112_textInput').val(link[0]);
                    window.close();
                });

            });
        </script>


        <h3>Choose File to Upload in Server</h3>
        <form action="UpLoadFile" method="post" enctype="multipart/form-data">
            <input type="file" name="file" id="file"/> 
            <input class="btn btn-primary" type="submit" value="Upload" />
            <input class="btn btn-warning" type="button" value="Reload" id="reload_btn" />
            <input class="btn btn-primary" type="button" value="Get Image" id="get-image"/> 
        </form>
        <br>
        <hr>

        <select class="image-picker">
            <%
                String UPLOAD_DIRECTORY = "F:\\JavaCode\\DemoThuongMaiDienTu\\web\\Image";

                File imageDir = new File(UPLOAD_DIRECTORY);
                File[] list_file = imageDir.listFiles();
                Arrays.sort(list_file, new Comparator() {
                    public int compare(Object o1, Object o2) {

                        if (((File) o1).lastModified() > ((File) o2).lastModified()) {
                            return -1;
                        } else if (((File) o1).lastModified() < ((File) o2).lastModified()) {
                            return +1;
                        } else {
                            return 0;
                        }
                    }

                });
                String name = imageDir.getName();
                
                
                
                
                
                int i = 0;
                while (i < list_file.length) {
                    File imageFile = list_file[i];
                    String imageFileName = new String(imageFile.getName());
                    String imageName = imageFileName;
                    imageFileName = "/Image/" + imageFileName;
                    i++;

            %>
            <option data-img-src="<%=imageFileName%>" value="<%=imageFileName%>"></option> 
            <%
                }
            %>
        </select>
    </body>
</html>
