<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%--
  Created by IntelliJ IDEA.
  User: Focus
  Date: 2017/6/21
  Time: 14:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>虹软中国</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/course.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
</head>
<script type="text/javascript">
    //    通过js计算出能让,rem布局结合在html上根据不同分辨率设置不同的font-size
    //    html的font-size=deviceWidth/12.0
    var deviceWidth = document.documentElement.clientWidth;
    if (deviceWidth > 1200) deviceWidth = 1280;
    document.documentElement.style.fontSize = deviceWidth / 12.0 + 'px';

    function searchLesson() {
        $("#search-form").submit();
    }
</script>
<body>
<div id="header">
    <div class="top-container clearfix" id="t-nav">
        <div id="logo" class="logo">
            <a href="#" target="_self" class="hide-text" title="虹软中国"><img
                    src="${pageContext.request.contextPath}/img/logo.png"></a>
        </div>
        <ul class="nav-item">
            <li><a href="${pageContext.request.contextPath}/html/index.html" target="_self">首页</a></li>
            <li><a href="#" target="_self">课程</a></li>
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
                    <a href="${pageContext.request.contextPath}/html/person.html" target="_self  ">
                        <i class="icon-my">
                        </i>
                    </a>
                </li>
            </ul>

        </div>

        <!-- 搜索框模块 -->
        <div class="search-wrap">
                <!-- 提示标签 -->
                <div id="searchTag" class="searchTag">
                    <a href="" target="_blank">防抖技术</a>
                    <a href="" target="_blank">前景技术</a>
                </div>
<!-- 搜索框 -->
<form class="search-form" action="${pageContext.request.contextPath}/selectLessonByName" target="_blank" id="search-form" method="post">
    <input type="text"  class="search-input"  id="search-input" name="searchName"  autocomplete="off">
    <!-- 搜索icon -->
    <div class="showhide-search">
        <!-- <button type="submit">,只是一个简单的按钮，input+submit可以提交数据 -->
        <a href="javascript:void(0)" onclick="searchLesson()"><i class="icon-search"></i></a>
    </div>
</form>
<!-- 				<ul id="data-list" class="search-area-result">
					<li data-key="暗光高清技术">暗光高清技术</li>
					<li data-key="防抖技术">防抖技术</li>
					<li data-key="人脸技术">人脸技术</li>
					<li data-key="HDR技术">HDR技术</li>
				</ul>	 -->
<div class="suggest" id="search-suggest">
    <ul id="search-area-result">

    </ul>
</div>
</div>
</div>
</div>

<%--<div id="main">
    <div class="wrap">
        <div class="top">
            <div class="course-content">
                <div class="course-nav-row clearfix">
                    <span class="hd l">方向:</span>
                    <div class="bd">
                        <ul>
                            <li class="course-nav-item on"><a href="" target="_self">全部</a></li>
                            <li class="course-nav-item"><a href="" target="_self">虹软技术</a></li>
                            <li class="course-nav-item"><a href="" target="_self">虹软产品</a></li>
                        </ul>
                    </div>
                </div>
                <div class="course-nav-row clearfix">
                    <span class="hd l">分类:</span>
                    <div class="bd">
                        <ul>
                            <li class="course-nav-item on"><a href="" target="_self">全部</a></li>
                            <c:forEach items="${lessonList}" var="lesson">
                                <li class="course-nav-item"><a href="" target="_self">${lesson.name}</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="course-list">
            <ul>
                <c:forEach items="${lessonWithRouteList}" var="lessonWithRoute">
                    <c:forEach items="${lessonWithRoute.routes}" var="route">
                        <div class="index-card-container">
                            <a href="${pageContext.request.contextPath}/showRoute?routeId=${route.id}" target="_blank"
                               class="course-card">
                                <div class="course-card-text">
                                    <div class="course-card-top">
                                        <h4>${lessonWithRoute.lessonName}</h4>
                                    </div>
                                    <div class="course-card-content">
                                        <h3 class="course-card-name">${route.routeName}</h3>
                                        <p title="防抖技术课程简介">${lessonWithRoute.lessonDetail}</p>
                                        <div class="course-card-info">
                                            <span>类型</span>
                                            <span class="course-type">视频</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="course-card-cover"></div>
                                <div class="course-card-bg"
                                     style="background-image: url(${pageContext.request.contextPath}/img/lessonImage/${lessonWithRoute.lessonCover});"></div>
                            </a>
                        </div>
                    </c:forEach>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="page">
        <a href="${pageContext.request.contextPath}/selectLessonByName?start=1">首页</a>
        <c:if test="${not empty pre}"><a
                href="${pageContext.request.contextPath}/selectLessonByName?start=${pre}">上一页</a></c:if>
        <c:forEach var="i" begin="1" end="${pageCount}" step="1">
            <a class="text-page-tag" href="selectLessonByName?start=${i}">${i}</a>
        </c:forEach>
        <c:if test="${not empty next}"><a
                href="${pageContext.request.contextPath}/selectLessonByName?start=${next}">下一页</a></c:if>
        <a href="${pageContext.request.contextPath}/selectLessonByName?start=${pageCount}">尾页</a>
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
</div>--%>



<div id="main">
    <div class="wrap">
        <div class="top">
            <div class="course-content">
                <div class="course-nav-row clearfix">
                    <span class="hd l">方向:</span>
                    <div class="bd">
                        <ul>
                            <li class="course-nav-item-top all on"><a href="#" target="_self">全部</a></li>
                            <li class="course-nav-item-top one"><a href="#" target="_self">虹软技术</a></li>
                            <li class="course-nav-item-top two"><a href="#" target="_self">虹软产品</a></li>
                        </ul>
                    </div>
                </div>
                <div class="course-nav-row clearfix">
                    <span class="hd l">分类:</span>
                    <div class="bd" id="tab">
                        <!-- "全部课程"的子菜单栏 -->
                        <ul class="all">
                            <li class="course-nav-item on"><a href="#" target="_self">全部</a></li>
                            <c:forEach items="${lessonList}" var="lesson">
                                <li class="course-nav-item"><a href="" target="_self">${lesson.name}</a></li>
                            </c:forEach>
                        </ul>
                        <!-- "虹软技术"选项子菜单栏 -->
                        <ul class="one">

                        </ul>
                        <!-- "虹软产品"选项的子菜单栏 -->
                        <ul class="two">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container clearfix">
        <div class="course-list clearfix" id="course-list">
            <ul>
                <c:forEach items="${lessonWithRouteList}" var="lessonWithRoute">
                    <c:forEach items="${lessonWithRoute.routes}" var="route">
                        <div class="index-card-container">
                            <a href="${pageContext.request.contextPath}/showRoute?routeId=${route.id}" target="_blank"
                               class="course-card">
                                <div class="course-card-text">
                                    <div class="course-card-top">
                                        <h4>${lessonWithRoute.lessonName}</h4>
                                    </div>
                                    <div class="course-card-content">
                                        <h3 class="course-card-name">${route.routeName}</h3>
                                        <p title="防抖技术课程简介">${lessonWithRoute.lessonDetail}</p>
                                        <div class="course-card-info">
                                            <span>类型</span>
                                            <span class="course-type">视频</span>
                                        </div>
                                    </div>
                                </div>
                                <div class="course-card-cover"></div>
                                <div class="course-card-bg"
                                     style="background-image: url(${pageContext.request.contextPath}/img/lessonImage/${lessonWithRoute.lessonCover});"></div>
                            </a>
                        </div>
                    </c:forEach>
                </c:forEach>

            </ul>
        </div>
    </div>
    <div class="page">
        <a href="${pageContext.request.contextPath}/selectLessonByName?start=1">首页</a>
        <c:if test="${not empty pre}"><a
                href="${pageContext.request.contextPath}/selectLessonByName?start=${pre}">上一页</a></c:if>
        <c:forEach var="i" begin="1" end="${pageCount}" step="1">
            <a class="text-page-tag" href="selectLessonByName?start=${i}">${i}</a>
        </c:forEach>
        <c:if test="${not empty next}"><a
                href="${pageContext.request.contextPath}/selectLessonByName?start=${next}">下一页</a></c:if>
        <a href="${pageContext.request.contextPath}/selectLessonByName?start=${pageCount}">尾页</a>
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
</body>
</html>
