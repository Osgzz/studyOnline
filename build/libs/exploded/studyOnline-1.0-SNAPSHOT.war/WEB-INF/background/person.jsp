<%--
  Created by IntelliJ IDEA.
  User: 59309
  Date: 2017/7/17
  Time: 21:10
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <meta charset="UTF-8">
    <title>个人设置</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/person.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ext/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/ext/bootstrap/css/bootstrap.min.css" type="text/css"
          rel="stylesheet">

    <script type="text/javascript">
        $(function () {

            $("#modifyPerson").click(function () {
                <%--$("#id").val("${employee.id}");--%>
                <%--$("#name").val("${employee.name}");--%>
                <%--$("#gender").val("${employee.gender}");--%>
                <%--$("#department").val("${employee.deptId}");--%>
                <%--$("#position").val("${employee.positionId}");--%>
                <%--$("#nickname").val("${employee.nickname}");--%>
                <%--$("#phone").val("${employee.phone}");--%>
                <%--$("#email").val("${employee.email}");--%>
                $("#editModal").modal("show");
                $("#editModal").removeAttr("style");
            });

            <%--$("#submit").click(function () {--%>

            <%--var id = $("#id").val();--%>
            <%--var name = $("#name").val();--%>
            <%--var gender = $("#gender").val();--%>
            <%--var department = $("#department").val();--%>
            <%--var position = $("#position").val();--%>
            <%--var nickname = $("#nickname").val();--%>
            <%--var phone = $("#phone").val();--%>
            <%--var email = $("#email").val();--%>

            <%--$.getJSON("${pageContext.request.contextPath}/modifyPersonInfo",--%>
            <%--{--%>
            <%--id: id,--%>
            <%--name: name,--%>
            <%--gender: gender,--%>
            <%--department: department,--%>
            <%--position:position,--%>
            <%--nickname:nickname,--%>
            <%--phone:phone,--%>
            <%--email:email--%>
            <%--}--%>
            <%--,--%>
            <%--function (json) {--%>
            <%--var message = json.message;--%>

            <%--alert(message);--%>
            <%--});--%>
            <%--});--%>
        });
    </script>

</head>

<body>

<div id="header">
    <div class="top-container clearfix" id="t-nav">
        <div id="logo" class="logo">
            <a href="/" target="_self" class="hide-text" title="虹软中国"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
        </div>
        <ul class="nav-item">
            <li><a href=" " target="_self">首页</a></li>
            <li><a href=" " target="_self">课程</a></li>
        </ul>
        <!-- logined模块-->
        <div class="login-area">
            <ul class="clearfix logined">
                <!-- 提醒icon -->
                <li class="remind-wrap">
                    <i class="msg-remind"></i>
                    <a href="#" target="_blank">
                        <i class="icon-remind">
                        </i>
                    </a>
                </li>
                <!-- 个人icon -->
                <li class="my-wrap">
                    <a href="" target="_blank">
                        <i class="icon-my">
                        </i>
                    </a>
                </li>
            </ul>

        </div>

        <!-- 搜索框模块 -->
        <div class="search-wrap" >
            <!-- 提示标签 -->
            <div id="searchTag" class="searchTag">
                <a href="" target="_blank">防抖技术</a>
                <a href="" target="_blank">前景技术</a>
            </div>
            <!-- 搜索框 -->
            <form class="search-form" action="#" target="self" id="search-form">
                <input type="text"  class="search-input"  id="search-input" name="q"  >
                <!-- 搜索icon -->
                <div class="showhide-search">
                    <!-- <button type="submit">,只是一个简单的按钮，input+submit可以提交数据 -->
                    <input type="submit" class="search-input-button" value=""/><i class="icon-search"></i>
                </div>
            </form>
            <ul id="data-list" class="search-area-result">
                <li data-key="暗光高清技术">暗光高清技术</li>
                <li data-key="防抖技术">防抖技术</li>
                <li data-key="人脸技术">人脸技术</li>
                <li data-key="HDR技术">HDR技术</li>
            </ul>
        </div>
    </div>

    <div class="mainer">
        <div class="middle-container" id="m-nav">
            <div class="left-wrap">
                <div class="avator-wrap">
                    <div class="avator-mode"><img src="${pageContext.request.contextPath}/img/1.png"></div>
                    <div class="desc-mode"><p>Siesta</p></div>
                </div>
                <div class="amount-wrap">
                    <h2>账号管理</h2>
                    <span class="line"></span>
                    <div class="amount-info clearfix">
                        <a href="${pageContext.request.contextPath}/toPerson?id=${employee.id}">个人信息</a>
                        <span class="arr"><i class="icon-arr"></i></span>
                    </div>
                    <div class="amount-info clearfix">
                        <a href="${pageContext.request.contextPath}/toModifyPassword?id=${employee.id}">修改密码</a>
                        <span class="arr"><i class="icon-arr"></i></span>
                    </div>
                </div>
            </div>

            <div class="right-wrap">
                <div class="setting-wrap">
                    <div class="edit-form"></div>
                    <div class="info-title clearfix">
                        <h2>个人信息</h2>
                        <a class="edit-info" href="javascript:void(0)" id="modifyPerson"><i class="icon-edit">编辑</i></a>
                    </div>
                    <span class="line"></span>

                    <form class="info-wrap" id="information-form" action="${pageContext.request.contextPath}/updatePerson" method="post">

                        <div class="info-box clearfix">
                            <label class="pull-left">员工编号</label>
                            <div class="pull-left">
                                <input type="text"  class="form-input" name="id" disabled>${employee.id}
                            </div>
                        </div>
                        <div class="info-box clearfix">
                            <label class="pull-left">姓名</label>
                            <div class="pull-left">
                                <input type="text" class="form-input" name="name" disabled>${employee.name}
                            </div>
                        </div>
                        <div class="info-box clearfix">
                            <label class="pull-left">性别</label>
                            <div class="pull-left">
                                <input type="audio" class="form-input" name="gender">${employee.gender}
                            </div>
                        </div>
                        <div class="info-box clearfix">
                            <label class="pull-left">部门</label>
                            <div class="pull-left">
                                <c:forEach items="${departmentList}" var="dept">
                                    <c:if test="${dept.id==employee.deptId}">
                                        <input type="text" class="form-input" name="department">${dept.name}
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="info-box clearfix">
                            <label class="pull-left">级别</label>
                            <div class="pull-left">
                                <c:forEach items="${positionList}" var="posit">
                                    <c:if test="${posit.id==employee.positionId}">
                                        <input type="text" class="form-input" name="position">${posit.name}
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                        <div class="info-box clearfix">
                            <label class="pull-left">昵称</label>
                            <div class="pull-left">
                                <input type="audio" class="form-input" name="nickname" >${employee.nickname}
                            </div>
                        </div>

                        <div class="info-box clearfix">
                            <label class="pull-left">手机号码</label>
                            <div class="pull-left">
                                <input type="audio" class="form-input" name="phone">${employee.phone}
                            </div>
                        </div>
                        <div class="info-box clearfix">
                            <label class="pull-left">邮箱地址</label>
                            <div class="pull-left">
                                <input type="audio" class="form-input" name="email" >${employee.email}
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </div>
    <div id="footer">
        <div class="foot-container">
            <div class="footer-link">
                <a href="http://www.arcsoft.com.cn" target="_blank" title="虹软官网">虹软官网</a>
                <a href="http://weibo.com/arcsoftchina" target="_blank" title="虹软微博">虹软微博</a>
            </div>
            <div class="footer-copyright">
                <p>©&nbsp;2017&nbsp;arcsoft.com&nbsp;&nbsp;浙ICP备11037259号-3</p>
            </div>
        </div>
    </div>
</div>

<%--模态框：修改管理员账号信息--%>
<div style="display:none" class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="editModalLabel">编辑个人信息</h4>
            </div>
            <form method="post" role="form" action="${pageContext.request.contextPath}/modifyPersonInfo">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="employeeId">员工编号：</label>
                        <input readonly id="employeeId" type="text" name="employeeId" class="form-control" readonly  value="${employee.id}">
                    </div>
                    <div class="form-group">
                        <label for="name">姓名：</label>
                        <input id="name" type="text" name="name" class="form-control" readonly value="${employee.name}">
                    </div>
                    <div class="form-group">
                        <label for="gender">性别:</label>
                        <div id="gender">
                            <label for="male">男:</label>
                            <input id="male" type="radio" name="gender" value="男" <c:if test="${employee.gender eq '男'}">checked</c:if> >
                            <label for="female">女:</label>
                            <input id="female" type="radio" name="gender" value="女" <c:if test="${employee.gender eq '女'}">checked</c:if> >
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="department">部门:</label>
                        <div>
                            <select id="department" class="form-control" name="department">
                                <c:forEach items="${departmentList}" var="dept">
                                    <option value="${dept.id}" <c:if test="${dept.id==employee.deptId}">selected="selected"</c:if>>
                                            ${dept.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="position">级别:</label>
                        <div>
                            <select id="position" class="form-control" name="position">
                                <c:forEach items="${positionList}" var="posit">
                                    <option value="${posit.id}" <c:if test="${posit.id==employee.positionId}">selected="selected"</c:if>>
                                            ${posit.name}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="nickname">昵称：</label>
                        <input id="nickname" type="text" name="nickname" class="form-control" value="${employee.nickname}">
                    </div>
                    <div class="form-group">
                        <label for="phone">手机号码：</label>
                        <input id="phone" type="text" name="phone" class="form-control" value="${employee.phone}">
                    </div>
                    <div class="form-group">
                        <label for="email">邮箱：</label>
                        <input id="email" type="text" name="email" class="form-control" value="${employee.email}">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input type="submit" class="btn btn-primary" value="修改"/>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
