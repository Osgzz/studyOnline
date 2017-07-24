<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Focus
  Date: 2017/7/18
  Time: 3:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script type="text/javascript">
    //
    // NOTE:
    // Modifying the URL below to another server will likely *NOT* work. Because of browser
    // security restrictions, we have to use a file server with special headers
    // (CORS) - most servers don't support cross-origin browser requests.
    //
    var url = 'a.pdf';

    //
    // Disable workers to avoid yet another cross-origin issue (workers need the URL of
    // the script to be loaded, and dynamically loading a cross-origin script does
    // not work)
    //
    PDFJS.disableWorker = true;

    //
    // Asynchronous download PDF as an ArrayBuffer
    //
    PDFJS.getDocument(url).then(function getPdfHelloWorld(pdf) {
        //
        // Fetch the first page
        //
        pdf.getPage(1).then(function getPageHelloWorld(page) {
            var scale = 1.0;
            var viewport = page.getViewport(($(window).width()-4) / page.getViewport(1.0).width);

            //
            // Prepare canvas using PDF page dimensions
            //
            var canvas = document.getElementById('the-canvas');
            var context = canvas.getContext('2d');
            canvas.height = viewport.height;
            canvas.width = viewport.width;

            //
            // Render PDF page into canvas context
            //
            page.render({canvasContext: context, viewport: viewport});
        });
    });
</script>
<body>
</body>
</html>
