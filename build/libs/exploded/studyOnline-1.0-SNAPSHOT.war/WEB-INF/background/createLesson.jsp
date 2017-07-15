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
    <title>新增课程</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ext/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/ext/bootstrap/css/bootstrap.min.css" type="text/css"
          rel="stylesheet">
</head>
<body>

<div>

    <form style="margin-top: 2%" enctype="multipart/form-data" class="form-horizontal" role="form" name="upfile"
          action="${pageContext.request.contextPath}/createLesson" method="post">

        <div class="form-group">
            <label class="col-sm-1 control-label" for="lessonName">课程名称:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="课程名称" name="lessonName" id="lessonName">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="picFile">封面图片:</label>
            <div class="col-sm-2">
                <input type="file" id="picFile" name="picFile"/>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="isshow">是否发布</label>
            <div class="col-sm-2" id="isshow">
                <label for="yes">是:</label>
                <input id="yes" type="radio" name="isshow" value="1">
                <label for="no">否:</label>
                <input id="no" type="radio" name="isshow" value="0">
            </div>
        </div>
        <div class="form-group">
            <label for="detail" class="control-label col-sm-1">课程描述:</label>
            <textarea style="width: 600px" id="detail" name="detail" class="form-control col-sm-6"
                      rows="3">${lesson.detail}</textarea>
        </div>
        <input class="btn btn-success col-sm-offset-1" type="submit" value="提交"/>
    </form>
</div>

</body>
</html>
