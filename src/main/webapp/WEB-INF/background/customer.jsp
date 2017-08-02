<!doctype html>
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
    /* 通过js计算出能让,rem布局结合在html上根据不同分辨率设置不同的font-size
      html的font-size=deviceWidth/12.0*/
    var deviceWidth = document.documentElement.clientWidth;
    if (deviceWidth > 1200) deviceWidth = 1280;
    document.documentElement.style.fontSize = deviceWidth / 12.0 + 'px';

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
            <li><a href="#" target="_self">首页</a></li>
            <li><a href="course.html" target="_self">课程</a></li>
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
                    <a href="${pageContext.request.contextPath}/toPersonMessage?id=${employee.id}" target="_blank">
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
            <form id="searchForm" action="${pageContext.request.contextPath}/selectLessonByName" method="post"
                  target="_blank">
                <input type="text" class="search-input" id="search-input" name="searchName" autocomplete="off">
                <!-- 搜索icon -->
                <div class="showhide-search">
                    <!-- <button type="submit">,只是一个简单的按钮，input+submit可以提交数据 -->
                    <a href="javascript:void(0)" class="search-input-button" onclick="searchLesson()"><i
                            class="icon-search"></i></a>
                </div>
            </form>
            <div class="suggest" id="search-suggest">
                <ul id="search-area-result">

                </ul>
            </div>
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
                            <li><a href="" target="_self">场景检测与物体识别技术</a></li>
                            <li><a href="" target="_self">体感技术</a></li>
                            <li><a href="" target="_self">3D立体成像技术</a></li>
                            <li><a href="" target="_self">AR/VR技术</a>
                            <li>
                        </ul>
                        <span class="more-li"><a href="" target="_blank">更多>></a></span>

                    </div>
            </ul>
        </div>
    </div>
</div>


<div id="main">
    <!-- 轮播图 -->
    <div class="imgBox">
        <div class="banner">
            <ul class="img-list">
                <li class="imgOn"><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/防抖.png"
                                                                  alt="防抖技术课程"
                                                                  background-size="cover"></a></li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/暗夜.jpg" alt="暗光高清技术课程"
                                                    background-size="cover"></a></li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/全景.png" alt="全景技术课程"
                                                    background-size="cover"></a></li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/HDR.png" alt="HDR技术课程"
                                                    background-size="cover"></a></li>
                <li><a href="" target="_blank"><img src="${pageContext.request.contextPath}/img/体感.png" alt="体感技术"
                                                    background-size="cover"></a></li>
            </ul>
            <a href="javascript:;" id="prev" class="arrow">&lt;</a>
            <a href="javascript:;" id="next" class="arrow">&gt;</a>

            <div class="text-bg"></div>
            <ul class="info-list">
                <li class="infoOn">防抖技术课程</li>
                <li>暗光高清技术课程</li>
                <li>全景技术课程</li>
                <li>HDR技术课程</li>
                <li>体感技术课程</li>
            </ul>
            <!-- 轮播图圆心按钮-->
            <div class="index-list clearfix">
                <span index="1" class="indexOn"></span>
                <span index="2"></span>
                <span index="3"></span>
                <span index="4"></span>
                <span index="5"></span>
            </div>
        </div>
    </div>

    <!-- 推荐模块 -->
    <div class="recomBox">
        <!-- 推荐模块 标题栏 -->
        <div class="title-list clearfix">
            <p class="like">猜你喜欢</p>
            <p class="more-title">更多精彩内容，请点击<span class="change">换一换<a><i class="icon-refresh"></i></a></span></p>
        </div>
        <!-- 推荐模块 视频栏 -->
        <div class="class-list clearfix">
            <c:forEach items="${lessonList}" var="lesson">
                <%--            <c:forEach items="${lessonList}" var="lesson">
                            <a class="video-item" href="#" title="${lesson.lessonName}">
                                    <span class="vioImg"><img
                                            src="${pageContext.request.contextPath}/img/lessonImage/${lesson.lessonCover}"></span>
                                <span class="vioTitle">${lesson.lessonName}</span>
                            </a>
                        </c:forEach>--%>
                <div class='re-video-item'><span class='re-vioImg'>
                    <a href='${pageContext.request.contextPath}/showRoute?id=${lesson.lessonId}'>
                        <img src="${pageContext.request.contextPath}/img/lessonImage/${lesson.lessonCover}">
                    </a></span>
                    <span class='re-vioTitle'>${lesson.lessonName}</span>
                </div>
            </c:forEach>
        </div>
    </div>


    <%-- <c:forEach items="${lessonList}" var="lesson" varStatus="n">
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

     </c:forEach>--%>

    <!-- 课程模块 -->
    <div class="typeBox">
        <div class="type-content">
            <!-- 左侧边栏-防抖技术课程模块 -->
            <div class="type-content-left fd"></div>
            <!-- 右侧边栏 -->
            <div class="type-content-right clearfix">

            </div>
            <!-- 左侧边栏-暗夜高清课程模块-->
            <div class="type-content-left qj"></div>
            <!-- 右侧边栏 -->
            <div class="type-content-right clearfix">

            </div>
            <!-- 左侧边栏-hdr课程模块 -->
            <div class="type-content-left hdr"></div>
            <!-- 右侧边栏 -->
            <div class="type-content-right clearfix">

            </div>
            <!-- 左侧边栏-体感技术课程模块 -->
            <div class="type-content-left cj"></div>
            <!-- 右侧边栏 -->
            <div class="type-content-right clearfix">

            </div>
        </div>
        <!-- 防抖技术课程模块   -->
        <!-- 		<div class="type-content fd clearfix"> -->

        <!-- 左边栏  -->

        <!-- 			<div class="type-content-left fd"> -->
        <!-- 				<div class="type-path">
                            <h2 class="path-title">防抖技术课程学习路径</h2>
                            <a  class="path-more" href="" target="_blank">了解更多 >></a>
                                     </div> -->
        <!--                                	</div> -->

        <!-- 右边栏-->
        <!--                               	 <div class="type-content-right">  -->
        <!--小图-->
        <!--                                                   <a class="video-item" href="" target="_blank" title="单摄像头智能手机">
                                                               <span class="vioImg"><img src="../img/2.png"></span>
                                                                   <span class="vioTitle">防抖技术课程1</span>
                                                                   <div class="vioCover"><i class="icon-play"></i></div>
                                                                   <span class="viewCount">120人</span>
                                                 </a>
                                                          <a class="video-item" href="" target="_blank" title="单摄像头智能手机">
                                                               <span class="vioImg"><img src="../img/3.png"></span>
                                                                   <span class="vioTitle">防抖技术课程2</span>
                                                                   <div class="vioCover"><i class="icon-play"></i></div>
                                                                   <span class="viewCount">120人</span>
                        </a>
                                                          <a class="video-item" href="" target="_blank" title="单摄像头智能手机">
                                                               <span class="vioImg"><img src="../img/4.png"></span>
                                                                   <span class="vioTitle">防抖技术课程3</span>
                                                                   <div class="vioCover"><i class="icon-play"></i></div>
                                                                   <span class="viewCount">120人</span>
                        </a>
                        <a class="video-item" href="" target="_blank" title="单摄像头智能手机">
                                                               <span class="vioImg"><img src="../img/5.png"></span>
                                                                   <span class="vioTitle">防抖技术课程4</span>
                                                                   <div class="vioCover"><i class="icon-play"></i></div>
                                                                   <span class="viewCount">120人</span>
                        </a>  -->

        <!--                                        </div>
                                  -->
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

<%--<script type="text/javascript" src="${pageContext.request.contextPath}/js/header.js"></script>--%>
</body>

</html>
