<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Focus
  Date: 2017/6/21
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>虹软中国</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>
</head>
<script type="text/javascript">
    function searchLesson() {
        $("#searchForm").submit();
    }
</script>
<body>
<div id="header">
    <div class="top-container clearfix" id="t-nav">
        <div id="logo" class="logo">
            <a href="/" target="_self" class="hide-text" title="虹软中国"><img
                    src="${pageContext.request.contextPath}/img/logo.png"></a>
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
                    <a href="#" target="_blank">
                        <i class="icon-my">
                        </i>
                    </a>
                </li>
            </ul>

        </div>

        <!-- 搜索框模块 -->
        <div class="search-wrap">
            <form id="searchForm" action="${pageContext.request.contextPath}/selectLessonByName" method="post"
                  target="_blank">
                <!-- 提示标签 -->
                <div id="searchTag" class="searchTag">
                    <a href="" target="_blank">防抖技术</a>
                    <a href="" target="_blank">前景技术</a>
                </div>

                <!-- 搜索框 -->
                <div class="search-area" data-search="top-banner">

                    <input name="searchName" id="search-input" class="search-input" type="text">
                    <ul id="data-list" class="search-area-result">
                        <li data-key="暗光高清技术">暗光高清技术</li>
                        <li data-key="防抖技术">防抖技术</li>
                        <li data-key="人脸技术">人脸技术</li>
                        <li data-key="HDR技术">HDR技术</li>
                    </ul>
                </div>
                <!-- 搜索icon -->
                <div class="showhide-search">
                    <a href="javascript:void(0)" onclick="searchLesson()"><i class="icon-search"></i></a>
                </div>
            </form>
        </div>
    </div>
    <div class="mainer">
        <div class="middle-container" id="m-nav">
            <!-- 导航条 -->
            <ul class="clearfix main-nav">
                <!-- 一级菜单 -->
                <li class="m-nav-item"><a href="" target="_self">虹软技术</a>
                    <div class="sub-nav">
                        <!-- 二级菜单 -->
                        <ul>
                            <li><a href="" target="_self">暗光高清拍摄技术</a></li>
                            <li><a href="" target="_self">防抖技术</a></li>
                            <li><a href="" target="_self">全景技术</a></li>
                            <li><a href="" target="_self">人脸技术</a></li>
                            <li><a href="" target="_self">HDR技术</a></li>
                            <li><a href="" target="_self">手势识别技术</a></li>
                            <li><a href="" target="_self">场景检测与物体识别技术</a></li>
                            <li><a href="" target="_self">体感技术</a></li>
                            <li><a href="" target="_self">3D立体成像技术</a></li>
                            <li><a href="" target="_self">AR/VR技术</a>
                            <li>
                            <li><span class="more-li"><a href="" target="_blank">更多>></a></span></li>
                        </ul>

                    </div>
                </li>
                <!-- 一级菜单 -->
                <li class="m-nav-item"><a href="" target="_self">虹软产品</a>
                    <div class="sub-nav">
                        <!-- 二级菜单 -->
                        <ul>
                            <li><a href="" target="_self">单摄像头智能手机解决方案</a></li>
                            <li><a href="" target="_self">双摄像头智能手机解决方案</a></li>
                            <li><a href="" target="_self">360度全景相机结局方案</a></li>
                            <li><a href="" target="_self">智能冰箱解决方案</a></li>
                            <li><a href="" target="_self">深度相机解决方案</a></li>
                            <li><a href="" target="_self">智能行车记录仪解决方案</a></li>
                            <li><a href="" target="_self">投影仪解决方案</a></li>
                            <li><a href="" target="_self">互联网视频直播解决方案</a></li>
                            <li><span class="more-li"><a href="" target="_blank">更多>></a></span></li>
                        </ul>

                    </div>
                </li>
            </ul>
        </div>
    </div>
</div>


<div id="main">
    <!-- 轮播图 -->
    <div class="imgBox">
        <div id="img-list" style="left:-1200px;">
            <ul>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/main5.jpg"
                                                    alt="单摄像头智能手机课程"></a></li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/main1.jpg" alt="防抖技术课程"></a>
                </li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/main2.jpg"
                                                    alt="暗光高清技术课程"></a></li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/main3.jpg" alt="全景技术课程"></a>
                </li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/main4.jpg"
                                                    alt="HDR技术课程"></a></li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/main5.jpg"
                                                    alt="单摄像头智能手机"></a></li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/main1.jpg" alt="防抖技术课程"></a>
                </li>
            </ul>
        </div>

        <!-- 轮播图圆心按钮 -->
        <div id="arcBox" class="point-button">
            <span index="1" class="on"></span>
            <span index="2"></span>
            <span index="3"></span>
            <span index="4"></span>
            <span index="5"></span>
        </div>

        <a href="javascript:;" id="prev" class="arrow">&lt;</a>
        <a href="javascript:;" id="next" class="arrow">&gt;</a>
    </div>

    <!-- 推荐模块 -->
    <div class="recomBox">
        <!-- 推荐模块 标题栏 -->
        <div class="title-list clearfix">
            <p class="more-title">更多精彩内容，请点击<span class="change"><a href="" target="_self">换一换<i
                    class="icon-refresh"></i></a></span></p>
            <h4 class="like">猜你喜欢</h4>
        </div>
        <!-- 推荐模块 视频栏 -->
        <div class="class-list clearfix">
            <c:forEach items="${lessonList}" var="lesson">
                <a class="video-item" href="#" title="${lesson.lessonName}">
                    <span class="vioImg"><img
                            src="${pageContext.request.contextPath}/img/lessonImage/${lesson.lessonCover}"></span>
                    <span class="vioTitle">${lesson.lessonName}</span>
                </a>
            </c:forEach>
        </div>
    </div>
    <c:forEach items="${lessonList}" var="lesson" varStatus="n">
        <c:if test="${n.index < 3 }">
            <div class="typeBox">
                <!-- 防抖技术课程模块  -->
                <div class="type-content fd clearfix">
                    <!-- 左边栏 -->
                    <div class="type-content-left fd">
                        <div class="type-content-recommend">
                            <h2 class="path-title">${lesson.lessonName}课程学习路径</h2>
                            <a class="path-more" href="" target="_blank">了解更多 >></a>

                        </div>
                    </div>
                    <!-- 右边栏 -->
                    <div class="type-content-right">
                        <!-- 大图 -->
                        <a class="main-video-item" href="#" target="" title="${lesson.lessonName}课程">
                            <span class="main-vioImg"><img
                                    src="${pageContext.request.contextPath}/img/lessonImage/${lesson.lessonCover}"></span>
                            <span class="main-vioTitle">${lesson.lessonName}课程</span>
                            <span class="viewCount">0</span>
                            <div class="vioCover-max"><i class="icon-play"></i></div>
                        </a>
                        <!-- 小图 -->
                        <c:forEach items="${lesson.routes}" var="route">
                            <a class="video-item"
                               href="${pageContext.request.contextPath}/showRoute?routeId=${route.id}"
                               target="_blank" title="${route.routeName}">
                                <span class="vioImg"><img
                                        src="${pageContext.request.contextPath}/img/routeImage/${route.cover}"></span>
                                <span class="vioTitle">${route.routeName}</span>
                                <div class="vioCover"><i class="icon-play"></i></div>
                                <span class="viewCount">0</span>
                            </a>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </c:if>

    </c:forEach>
    <div class="more">
        <a class="load-more" href="${pageContext.request.contextPath}/moreLesson" target="_self">更多课程>></a>
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

<script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>
</body>

</html>
