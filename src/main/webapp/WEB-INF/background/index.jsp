<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Focus
  Date: 2017/5/5
  Time: 22:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>虹软在线培训系统后台管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/ext/bootstrap/js/bootstrap.min.js"></script>
    <link href="${pageContext.request.contextPath}/ext/bootstrap/css/bootstrap.min.css" type="text/css" rel="stylesheet">

    <style>






        .signin {
            width:477px;
            height:479px;
            margin:0 auto;

            position:absolute;
            top:50%;
            left:50%;
            margin-top:-239px;
            margin-left:-238px;
        }
        .signin-head {
            margin:0 auto;
            padding-top:30px;
            width:120px;
        }
        .form-signin {
            max-width: 330px;
            padding: 43px 15px 15px 15px;
            margin: 0 auto;
        }
        .form-signin .checkbox {
            margin-bottom: 10px;
        }
        .form-signin .checkbox {
            font-weight: normal;
        }
        .form-signin .form-control {
            position: relative;
            font-size: 16px;
            height: auto;
            padding: 10px;
            -webkit-box-sizing: border-box;
            -moz-box-sizing: border-box;
            box-sizing: border-box;
        }
        .form-signin .form-control:focus {
            z-index: 2;
        }
        .form-signin input[type="text"] {
            margin-bottom: 14px;
            border-radius: 0;

            padding-left:60px;
            color:#FFFFFF;
        }
        .form-signin input[type="password"] {
            margin-bottom: 10px;
            border-radius: 0;

            padding-left:60px;
            color:#FFFFFF;
        }
        .form-signin button {
            border-radius: 0;
        }












        body {
            background: url(${pageContext.request.contextPath}/img/backgrouud.jpg) #f8f6e9;
        }


        h2 {
            color: #ffffff;
        }

        .container{
            width: 550px;
        }

        .btn{
            width: 490px;
        }

        .row{
            margin-left: auto;
            margin-right: auto;
            width: 100%;
        }

    </style>
    <script type="text/javascript">
        $(function () {
            $("#reset").click(function () {
                    $(".username").val("");
                    $(".password").val("");
                }
            )
        })
    </script>

</head>
<body>

<div class="container">
    <div class="row">
        <form action="${pageContext.request.contextPath}/shiro/login" method="post">
            <div class="col-lg-12 text-center" style="margin-top: 50%">
                <h2>虹软在线培训系统后台管理</h2>
            </div>
            <div class="col-lg-12">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-user"></span></div>
                        <input type="text" class="form-control username" name="username" placeholder="请输入账户名"
                               required="required"
                               autofocus="autofocus"/>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="form-group">
                    <div class="input-group">
                        <div class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></div>
                        <input type="password" class="form-control password" name="password" placeholder="请输入密码"
                               required="required"
                               autofocus="autofocus"/>
                    </div>
                </div>
            </div>

            <c:if test="${msg !=null }">
                <div class="col-lg-12"><p style="color: #ff2f2f">账号密或码错误</p></div>
            </c:if>
            <div class="col-lg-12" style="margin-top: 3%">
                <input id="submit" type="submit" class="btn btn-success col-lg-12" value="登录">
            </div>
            <div class="col-lg-12">
                <input id="reset" type="button" class="btn btn-warning col-lg-12" value="重置">
            </div>
        </form>
    </div>
</div>
</body>
</html>
