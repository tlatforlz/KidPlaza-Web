<%-- 
    Document   : ckeditor
    Created on : Mar 9, 2017, 6:06:19 PM
    Author     : tranl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script>
            var CKEDITOR_BASEPATH = 'js/ckeditor/';
        </script>

        <script src="js/ckeditor/ckeditor.js" type="text/javascript"></script>
    </head>
    <body>
        <textarea name="editor1"></textarea>
        <script>
            CKEDITOR.replace('editor1', {
                extraPlugins: 'imageuploader'
            });
        </script>
    </body>
</html>
