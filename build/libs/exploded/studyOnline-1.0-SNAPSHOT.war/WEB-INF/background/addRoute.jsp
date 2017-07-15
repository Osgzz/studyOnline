<%--
  Created by IntelliJ IDEA.
  User: Focus
  Date: 2017/6/18
  Time: 23:37
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加学习路线</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ext/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/ext/bootstrap/css/bootstrap.min.css" type="text/css"
          rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-datetimepicker.min.css">
    <script src="${pageContext.request.contextPath}/js/bootstrap-datetimepicker.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/locales/bootstrap-datetimepicker.zh-CN.js"></script>
</head>
<script type="text/javascript">
    $(function () {
        <!-- 初始化日期插件-->
        $('#datetimepicker').datetimepicker({
            language: 'zh-CN',//显示中文
            format: 'yyyy-mm-dd hh:ii:ss',//显示格式
            initialDate: new Date(),//初始化当前日期
            autoclose: true,//选中自动关闭
            todayBtn: true//显示今日按钮
        });
    })
</script>
<body>

<div>

    <form style="margin-top: 2%" enctype="multipart/form-data" class="form-horizontal" role="form" name="upfile"
          action="${pageContext.request.contextPath}/addRoute" method="post">


        <div class="form-group">
            <label class="col-sm-1 control-label" for="lessonId">课程名称：</label>
            <div class="col-md-2">
                <select id="lessonId" class="form-control" name="lessonId">
                    <option value="notSelect">请选择所属课程</option>
                    <c:forEach items="${lessonList}" var="lesson">
                        <option value="${lesson.id}">${lesson.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-1 control-label" for="routeName">学习路径名称：</label>
            <div class="col-sm-2">
                <input id="routeName" type="text" name="routeName" class="form-control" placeholder="学习路径名称">
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-1 control-label" for="datetimepicker">发布时间：</label>
            <div class="col-sm-2">
                <input name="time" class="form-control" id="datetimepicker" size="16" type="text"
                       readonly>
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-1 control-label" for="routeCover">学习路径封面：</label>
            <input type="file" id="routeCover" name="routeCover"/>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="routeDetail">学习路径描述：</label>
            <textarea id="routeDetail" style="width: 600px" rows="3" type="text" name="routeDetail"
                      class="form-control"></textarea>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="video">课程视频：</label>
            <input type="file" id="video" name="video"/>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label" for="videoName">视频名称：</label>
            <div class="col-sm-2">
                <input id="videoName" type="text" name="videoName" class="form-control" placeholder="视频名称">
            </div>
        </div>


        <div class="form-group">
            <label class="col-sm-1 control-label" for="ppt">PPT：</label>
            <input type="file" id="ppt" name="ppt"/>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label" for="pptName">PPT名称：</label>
            <div class="col-sm-2">
                <input id="pptName" type="text" name="pptName" class="form-control" placeholder="PPT名称">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="audio">音频：</label>
            <input type="file" id="audio" name="audio"/>
        </div>
        <div class="form-group">
            <label class="col-sm-1 control-label" for="audioName">音频名称：</label>
            <div class="col-sm-2">
                <input id="audioName" type="text" name="audioName" class="form-control" placeholder="音频名称">
            </div>
        </div>


        <input class="btn btn-success col-sm-offset-1" type="submit" value="提交"/>
    </form>
</div>

</body>
</html>
