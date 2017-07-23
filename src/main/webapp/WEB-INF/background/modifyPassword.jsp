<%--
  Created by IntelliJ IDEA.
  User: 59309
  Date: 2017/7/21
  Time: 15:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/person.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
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
                    <a href="${pageContext.request.contextPath}/toPersonMessage" target="_blank">
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
                    <div class="amount-info">
                        <a href="${pageContext.request.contextPath}/toPersonMessage?id=${employee.id}">个人信息</a>
                        <span class="arr"><i class="icon-arr"></i></span>
                    </div>
                    <div class="amount-info">
                        <a href="${pageContext.request.contextPath}/toModifyPassword?id=${employee.id}">修改密码</a>
                        <span class="arr"><i class="icon-arr"></i></span>
                    </div>
                </div>
            </div>

            <div class="right-wrap">
                <div class="setting-wrap">
                    <div class="edit-form"></div>
                    <div class="info-title clearfix">
                        <h2>修改密码</h2>
                    </div>
                    <span class="line"></span>

                    <form class="info-wrap" id="information-form" action="${pageContext.request.contextPath}/modifyPassword?id=${employee.id}" method="post">

                        <div class="info-box clearfix">
                            <label class="pull-left">原密码</label>
                            <div class="pull-left">
                                <input type="password"  class="form-input" name="originalPassword">
                            </div>
                        </div>
                        <div class="info-box clearfix">
                            <label class="pull-left">新密码</label>
                            <div class="pull-left">
                                <input type="password" class="form-input" name="newPassword">
                            </div>
                        </div>
                        <div class="info-box clearfix">
                            <label class="pull-left">再次输入新密码</label>
                            <div class="pull-left">
                                <input type="password" class="form-input" name="newPasswordAgain">
                            </div>
                        </div>
                        <div class="info-box clearfix">
                            <div class="pull-left">
                                <input class="btn btn-success col-sm-offset-1" type="submit" value="提交"/>
                                <a id="cancel" href="${pageContext.request.contextPath}/toModifyPassword?id=${employee.id}" class="btn btn-danger">取消</a>
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


</body>
</html>
