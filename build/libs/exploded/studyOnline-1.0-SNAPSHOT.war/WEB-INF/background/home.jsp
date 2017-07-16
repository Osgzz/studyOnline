<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Focus
  Date: 2017/5/6
  Time: 16:07
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
    <link href="${pageContext.request.contextPath}/ext/bootstrap/css/bootstrap.min.css" type="text/css"
          rel="stylesheet">

    <style>
        .panel-group {
            max-height: 100%;
            overflow: auto;
        }

        .leftMenu {
            margin: 10px;
            margin-top: 5px;
        }

        .leftMenu .panel-heading {
            font-size: 14px;
            padding-left: 20px;
            height: 36px;
            line-height: 36px;
            color: white;
            position: relative;
            cursor: pointer;
        }

        /*转成手形图标*/
        .leftMenu .panel-heading span {
            position: absolute;
            right: 10px;
            top: 12px;
        }

        .leftMenu .menu-item-left {
            padding: 2px;
            background: transparent;
            border: 1px solid transparent;
            border-radius: 6px;
        }

        .leftMenu .menu-item-left:hover {
            background: #C4E3F3;
            border: 1px solid #1E90FF;
        }

        .webTitle span {
            margin-left: 2%;
            margin-top: 50%;
            font-size: 2.5em;
            color: #ffffff;
        }


    </style>
    <script type="text/javascript">
        $(function () {

            $("#modifypwd").click(function () {
                $("#username").val("${username}");
                $("#oldPassword").val("");
                $("#newPassword").val("");
                $("#checkNewPassword").val("");
                $("#editModal").modal("show");
                $("#editModal").removeAttr("style");
            });


            $("#submit").click(function () {

                var username = $("#username").val();
                var oldPassword = $("#oldPassword").val();
                var newPassword = $("#newPassword").val();
                var checkNewPassword = $("#checkNewPassword").val();


                $.getJSON("${pageContext.request.contextPath}/modifyAdminPwd",
                    {
                        username: username,
                        oldPassword: oldPassword,
                        newPassword: newPassword,
                        checkNewPassword: checkNewPassword
                    }
                    ,
                    function (json) {
                        var message = json.message;

                        alert(message);
                    });
            });


            <!--右侧标签页的首次加载-->
            $('#myTab').find('a:first').tab('show');

            $(".panel-heading").click(function (e) {
                /*切换折叠指示图标*/
                $(this).find("span").toggleClass("glyphicon-chevron-down");
                $(this).find("span").toggleClass("glyphicon-chevron-up");
            });
        });

        <!--点击左侧菜单，右标签页动态增加并且显示内容-->
        function addTab(title, address) {
            var tabId = "#" + title;
            var tab = $('#myTab');
            var content = $("#content");

            <!--根据id判断该页是否已经存在标签页，已存在则展开显示它，不存在就添加到标签页里-->
            if (document.getElementById(title)) {
                $("a[href=\'" + tabId + "\']").tab('show');
            } else {
                tab.append("<li style='margin: 1px'><a style='padding: 12px;margin-bottom: -14px;margin-right: -2px' href=" + tabId + " data-toggle='tab'>" + title + "</a><span style='float: right;color: rgba(21,177,0,0.8);font-size: 13px'  class='glyphicon glyphicon-refresh'  onclick='refreshTab(\"" + title + "\",\"" + address + "\")'></span><span style='float: right;color: #ff3b4c;font-size: 13px'  class='glyphicon glyphicon-remove'  onclick='closeTab(\"" + title + "\")'></span></li>");

                content.append("<div  class='tab-pane fade' id=" + title + ">" + "<iframe scrolling='yes' frameborder='0' style='width: 100%;height: 100%' src=" + address + "></iframe>" + "</div>");

                $("a[href=\'" + tabId + "\']").tab('show');
            }
        }

        //刷新标签页
        function refreshTab(title, address) {
            var tabId = "#" + title;
            $(tabId).children().remove();
            var content = $("#content");
            $(tabId).append("<iframe scrolling='yes' frameborder='0' style='width: 100%;height: 100%' src=" + address + "></iframe>");
            $("a[href=\'" + tabId + "\']").tab('show');
        }


        //关闭标签页
        function closeTab(title) {
            var shouldClose = $("a[href=\'#" + title + "\']").parent();
            //删除包含该title的a标签的父标签，li标签，连同button一起删除
            shouldClose.remove();
            //删除该标签对应的内容
            $("#" + title + "").remove();

//            激活标签页最后一标签
            $('#myTab a:last').tab('show');
        }

    </script>
</head>
<body>

<%--导航栏--%>
<div class="container">

    <nav class="navbar navbar-default navbar-fixed-top navbar-inverse" role="navigation">
        <div class="navbar-header logo">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#example-navbar-collapse">
                <span class="sr-only">切换导航</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <img class="navbar-left" src="${pageContext.request.contextPath}/img/logo4.png">
        </div>

        <div class="collapse navbar-collapse" id="example-navbar-collapse">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#">首页</a></li>
            </ul>
            <div style="margin-right: 0.7%">
                <form method="post" action="${pageContext.request.contextPath}/logout"
                      class="navbar-form navbar-right"
                      role="search">
                    <div class="form-group">
                        <p style="color: #ffffff;padding-top: 10%;">用户：${username}</p>
                    </div>
                    <button type="submit" class="btn btn-primary">注销</button>
                </form>
            </div>
        </div>

    </nav>
</div>
<hr>
<hr>

<div class="row">
    <%--侧边栏--%>
    <div class="col-md-2">
        <div class="panel-group table-responsive" role="tablist">

            <%--账号管理模块--%>
            <div class="panel panel-primary leftMenu">
                <!-- 利用data-target指定要折叠的分组列表 -->
                <div class="panel-heading" id="collapseListGroupHeading1" data-toggle="collapse"
                     data-target="#collapseListGroup1" role="tab">
                    <h4 class="panel-title">
                        账号管理
                        <span class="glyphicon glyphicon-chevron-up right"></span>
                    </h4>
                </div>
                <!-- .panel-collapse和.collapse标明折叠元素 .in表示要显示出来 -->
                <div id="collapseListGroup1" class="panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="collapseListGroupHeading1">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <!-- 利用data-target指定URL -->
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span><a href="javascript:void(0)"
                                                                                           id="modifypwd">管理员密码修改</a>
                            </button>
                        </li>

                        <li class="list-group-item">
                            <!-- 利用data-target指定URL -->
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span><a href="javascript:void(0)"
                                                                                           id="employeeList">用户信息列表</a>
                            </button>
                        </li>
                        <li class="list-group-item">
                            <!-- 利用data-target指定URL -->
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span><a href="javascript:void(0)"
                                                                                           id="addEmployee">新增用户</a>
                            </button>
                        </li>

                    </ul>
                </div>
            </div>

            <%--课程管理--%>
            <div class="panel panel-primary leftMenu">
                <div class="panel-heading" id="collapseListGroupHeading2" data-toggle="collapse"
                     data-target="#collapseListGroup2" role="tab">
                    <h4 class="panel-title">
                        课程管理
                        <span class="glyphicon glyphicon-chevron-down right"></span>
                    </h4>
                </div>
                <div id="collapseListGroup2" class="panel-collapse collapse" role="tabpanel"
                     aria-labelledby="collapseListGroupHeading2">
                    <ul class="list-group">
                        <li class="list-group-item">
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span><a href="javascript:void(0)"
                                                                                           onclick="addTab('新增课程', 'toCreateLesson')">新增课程</a>
                            </button>
                        </li>
                        <li class="list-group-item">
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span><a
                                    href="javascript:void(0)"
                                    onclick="addTab('课程信息管理', 'toLessonList')">课程信息管理</a>
                            </button>
                        </li>
                        <li class="list-group-item">
                            <button class="menu-item-left">
                                <span class="glyphicon glyphicon-triangle-right"></span><a href="javascript:void(0)"
                                                                                           onclick="addTab('添加子课程', 'toAddRoute')">添加子课程</a>
                            </button>
                        </li>


                    </ul>
                </div>
            </div>
        </div>
    </div>


    <%--右侧内容区--%>
    <div class="container col-md-10">
        <hr>
        <ul id="myTab" class="nav nav-tabs">
            <li><a href="#home" data-toggle="tab">首页</a></li>
        </ul>
        <div class="tab-content" id="content">
            <div class="tab-pane active fade in" id="home">欢迎来到虹软线上培训后台管理系统</div>
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
                <h4 class="modal-title" id="editModalLabel">管理员密码修改</h4>
            </div>
            <form method="post" role="form">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="username">管理员账号：</label>
                        <input readonly id="username" type="text" name="username" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="oldPassword">旧密码：</label>
                        <input id="oldPassword" type="password" name="oldPassword" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="newPassword">新密码：</label>
                        <input id="newPassword" type="password" name="newPassword" class="form-control">
                    </div>
                    <div class="form-group">
                        <label for="checkNewPassword">新密码确认：</label>
                        <input id="checkNewPassword" type="password" name="checkNewPassword" class="form-control">
                    </div>

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <input id="submit" type="button" class="btn btn-primary" value="修改"/>
                </div>
            </form>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>


</body>
</html>