<%--
  Created by IntelliJ IDEA.
  User: Focus
  Date: 2017/7/13
  Time: 0:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件在线预览</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/flexpaper_handlers.js"></script>
    <style type="text/css" media="screen">
        html, body {
            height: 100%;
        }

        body {
            margin: 0;
            padding: 0;
            overflow: auto;
        }

        #flashContent {
            display: none;
        }
    </style>
</head>
<body>
<div style="position:absolute;left:50px;top:10px;">
    <div id="documentViewer" class="flexpaper_viewer" style="width:770px;height:500px"></div>

    <script type="text/javascript">

        var startDocument = "Paper";

        $('#documentViewer').FlexPaperViewer(
            {
                config: {

                    SWFFile: '${pageContext.request.contextPath}/upload/a.swf',

                    Scale: 0.6,
                    ZoomTransition: 'easeOut',
                    ZoomTime: 0.5,
                    ZoomInterval: 0.2,
                    FitPageOnLoad: true,
                    FitWidthOnLoad: false,
                    FullScreenAsMaxWindow: false,
                    ProgressiveLoading: false,
                    MinZoomSize: 0.2,
                    MaxZoomSize: 5,
                    SearchMatchAll: false,
                    InitViewMode: 'Portrait',
                    RenderingOrder: 'flash',
                    StartAtPage: '',

                    ViewModeToolsVisible: true,
                    ZoomToolsVisible: true,
                    NavToolsVisible: true,
                    CursorToolsVisible: true,
                    SearchToolsVisible: true,
                    WMode: 'window',
                    localeChain: 'en_US'
                }
            }
        );

    </script>
</div>
</body>
</html>
