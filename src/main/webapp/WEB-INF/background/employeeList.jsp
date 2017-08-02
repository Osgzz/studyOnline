<%--
  Created by IntelliJ IDEA.
  User: 59309
  Date: 2017/7/17
  Time: 14:52
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息列表</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ext/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/ext/bootstrap/css/bootstrap.min.css" type="text/css"
          rel="stylesheet">
</head>
<body>

<div class="table-responsive">
    <table class="table">
        <caption>用户信息列表</caption>
        <thead>
        <tr>
            <th>用户编号</th>
            <th>用户姓名</th>
            <th>用户昵称</th>
            <th>用户密码</th>
            <th>用户性别</th>
            <th>用户部门</th>
            <th>用户职位</th>
            <th>用户级别</th>
            <th>用户手机</th>
            <th>用户邮箱</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${employeeList}" var="employee">
            <tr>
                <td>${employee.employeeId}</td>
                <td>${employee.employeeName}</td>
                <td>${employee.employeeNickname}</td>
                <td>${employee.employeePassword}</td>
                <td>${employee.employeeGender}</td>
                <td>${employee.deptName}</td>
                <td>${employee.positionName}</td>
                <td>${employee.premissionLevel}</td>
                <td>${employee.employeePhone}</td>
                <td>${employee.employeeEmail}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/toUpdateEmployee?id=${employee.employeeId}">修改</a>
                    <a href="${pageContext.request.contextPath}/delEmployee?id=${employee.employeeId}">删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <nav aria-label="Page navigation">
        <ul class="pagination">
            <li>
                <a href="${pageContext.request.contextPath}/toBookList?start=1&bookId=${bookId}&bookname=${bookname}&publisher=${publisher}&author=${author}"
                   aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
            </li>
            <c:forEach var="i" begin="1" end="${pageCount}" step="1">
                <li>
                    <a href="${pageContext.request.contextPath}/toBookList?start=${i}&bookId=${bookId}&bookname=${bookname}&publisher=${publisher}&author=${author}">${i}</a>
                </li>
            </c:forEach>
            <li>
                <a href="${pageContext.request.contextPath}/toBookList?start=${pageCount}&bookId=${bookId}&bookname=${bookname}&publisher=${publisher}&author=${author}"
                   aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
            </li>
        </ul>
    </nav>
</div>

</body>
</html>
