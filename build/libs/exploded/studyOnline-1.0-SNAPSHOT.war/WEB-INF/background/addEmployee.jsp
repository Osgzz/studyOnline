<%--
  Created by IntelliJ IDEA.
  User: 59309
  Date: 2017/7/17
  Time: 13:55
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>新增用户</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ext/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/ext/bootstrap/css/bootstrap.min.css" type="text/css"
          rel="stylesheet">

    <script type="text/javascript">
        $(function () {
            $("#EmployeeListByExcel").click(function () {
                $("#excelModal").modal("show");
                $("#excelModal").removeAttr("style");
            });
        });
    </script>

</head>
<body>

<div>
    <form style="margin-top: 2%" enctype="multipart/form-data" class="form-horizontal" role="form" name="upfile"
          action="${pageContext.request.contextPath}/addEmployee" method="post">

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeeName">员工姓名:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工姓名" name="employeeName" id="employeeName">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeeNickname">员工账号:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工账号" name="employeeNickname" id="employeeNickname">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeePassword">员工密码:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工密码" name="employeePassword" id="employeePassword">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeeGender">员工性别:</label>
            <div class="col-sm-2" id="employeeGender">
                <label for="male">男:</label>
                <input id="male" type="radio" name="employeeGender" value="男">
                <label for="female">女:</label>
                <input id="female" type="radio" name="employeeGender" value="女">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="departmentId">员工部门:</label>
            <div class="col-md-2">
                <select id="departmentId" class="form-control" name="departmentId">
                    <option value="notSelect">请选择所属部门</option>
                    <c:forEach items="${departmentList}" var="department">
                        <option value="${department.id}">${department.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="positionId">员工级别:</label>
            <div class="col-md-2">
                <select id="positionId" class="form-control" name="positionId">
                    <option value="notSelect">请选择级别</option>
                    <c:forEach items="${positionList}" var="position">
                        <option value="${position.id}">${position.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeePhone">员工手机:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工手机" name="employeePhone" id="employeePhone">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-1 control-label" for="employeeMail">员工邮箱:</label>
            <div class="col-sm-2">
                <input class="form-control" type="text" placeholder="员工邮箱" name="employeeMail" id="employeeMail">
            </div>
        </div>

        <input class="btn btn-success col-sm-offset-1" type="submit" value="提交"/>
    </form>

    <button class="btn btn-success col-sm-offset-1">
        <a href="javascript:void(0)" id="EmployeeListByExcel">Excel批量添加</a>
    </button>
</div>

<%--模态框：上传excel文件--%>
<div style="display:none" class="modal fade" id="excelModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
     aria-hidden="true" enctype="multipart/form-data">
    <%--<div style="display:none" class="modal fade" id="excelModal" role="dialog">--%>
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editModalLabel">上传文件</h4>
            </div>
            <form method="post" enctype="multipart/form-data" role="form" action="${pageContext.request.contextPath}/listByExcel">
                <div class="modal-body">

                    <div class="form-group">
                        <label class="col-sm-2 control-label" for="excel">文件：</label>
                        <input type="file" id="excel" name="excel"/>
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type="submit" class="btn btn-primary" value="上传"/>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
