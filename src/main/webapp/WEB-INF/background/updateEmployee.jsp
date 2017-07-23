<%--
  Created by IntelliJ IDEA.
  User: 59309
  Date: 2017/7/19
  Time: 21:15
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改学员基本信息</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ext/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/ext/bootstrap/css/bootstrap.min.css" type="text/css"
          rel="stylesheet">
</head>
<body>

<div>
    <form style="margin-top: 2%" enctype="multipart/form-data" class="form-horizontal" role="form" name="upfile"
          action="${pageContext.request.contextPath}/updateEmployee" method="post">

        <input type="hidden" name="id" value="${employee.id}">
        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeeName">员工姓名:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工姓名" name="employeeName" id="employeeName" value="${employee.name}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeeNickname">员工账号:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工账号" name="employeeNickname" id="employeeNickname" value="${employee.nickname}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeePassword">员工密码:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工密码" name="employeePassword" id="employeePassword" value="${employee.password}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeeGender">员工性别:</label>
            <div class="col-sm-2" id="employeeGender">
                <label for="male">男:</label>
                <input id="male" type="radio" name="employeeGender" value="男" <c:if test="${employee.gender eq '男'}">checked</c:if> >
                <label for="female">女:</label>
                <input id="female" type="radio" name="employeeGender" value="女" <c:if test="${employee.gender eq '女'}">checked</c:if> >
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="departmentId">员工部门:</label>
            <div class="col-md-2">
                <select id="departmentId" class="form-control" name="departmentId">
                    <c:forEach items="${departmentList}" var="department">
                        <option value="${department.id}" <c:if test="${department.id==employee.deptId}">selected="selected"</c:if>>
                                ${department.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="positionId">员工级别:</label>
            <div class="col-md-2">
                <select id="positionId" class="form-control" name="positionId">
                    <c:forEach items="${positionList}" var="position">
                        <option value="${position.id}" <c:if test="${position.id==employee.positionId}">selected="selected"</c:if>>
                                ${position.name}
                        </option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeePhone">员工手机:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工手机" name="employeePhone" id="employeePhone" value="${employee.phone}">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeeMail">员工邮箱:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工邮箱" name="employeeMail" id="employeeMail" value="${employee.email}">
            </div>
        </div>

        <input class="btn btn-success col-sm-offset-1" type="submit" value="提交"/>
        <a id="cancel" href="${pageContext.request.contextPath}/toEmployeeList" class="btn btn-danger">取消</a>
    </form>
</div>

</body>
</html>
