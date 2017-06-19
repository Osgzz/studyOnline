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
    <title>课程信息管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ext/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/ext/bootstrap/css/bootstrap.min.css" type="text/css"
          rel="stylesheet">
</head>
<body>

<div class="table-responsive">
    <table class="table">
        <caption>课程信息列表</caption>
        <thead>
        <tr>
            <th>课程编号</th>
            <th>课程名称</th>
            <th>是否上线</th>
            <th>操作</th>

        </tr>
        </thead>
        <tbody>
        <c:forEach items="${lessonList}" var="lesson">
            <tr>
                <td>${lesson.id}</td>
                <td>${lesson.name}</td>
                <td><c:if test="${lesson.isshow eq 0}">否</c:if><c:if test="${lesson.isshow eq 1}">是</c:if></td>
                <td>
                    <a target="_blank" href="${pageContext.request.contextPath}/toViewBook?id=${lesson.id}">查看</a>
                    <a href="${pageContext.request.contextPath}/toUpdateLesson?id=${lesson.id}">修改</a>
                    <a href="${pageContext.request.contextPath}/delLesson?id=${lesson.id}">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="${pageContext.request.contextPath}/toBookList?start=1&bookId=${bookId}&bookname=${bookname}&publisher=${publisher}&author=${author}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="i" begin="1" end="${pageCount}" step="1">
                <li><a href="${pageContext.request.contextPath}/toBookList?start=${i}&bookId=${bookId}&bookname=${bookname}&publisher=${publisher}&author=${author}">${i}</a></li>
            </c:forEach>
            <li>
                <a href="${pageContext.request.contextPath}/toBookList?start=${pageCount}&bookId=${bookId}&bookname=${bookname}&publisher=${publisher}&author=${author}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>


</body>
</html>
