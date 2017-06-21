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
</head>
<body>
<div id="header">
    <div class="top-container clearfix" id="t-nav">
        <div id="logo" class="logo">
            <a href="#" target="_self" class="hide-text" title="虹软中国"><img src="${pageContext.request.contextPath}/img/logo.png"></a>
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
        <div class="search-wrap" >
            <!-- 搜索框 -->
            <div class="search-area" data-search="top-banner">
                <input id="search-input" class="search-input"  type="text" value=" ">
            </div>
            <!-- 搜索icon -->
            <div class="showhide-search">
                <a href="" target="_blank"><i class="icon-search"></i></a>
            </div>
        </div>
    </div>
</div>
<div id="main">
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
                            <li class="course-nav-item"><a href="" target="_self">暗光高清拍摄</a></li>
                            <li class="course-nav-item"><a href="" target="_self">防抖</a></li>
                            <li class="course-nav-item"><a href="" target="_self">全景</a></li>
                            <li class="course-nav-item"><a href="" target="_self">人脸</a></li>
                            <li class="course-nav-item"><a href="" target="_self">HDR</a></li>
                            <li class="course-nav-item"><a href="" target="_self">手势识别</a></li>
                            <li class="course-nav-item"><a href="" target="_self">场景检测与物体识别</a></li>
                            <li class="course-nav-item"><a href="" target="_self">体感</a></li>
                            <li class="course-nav-item"><a href="" target="_self">3D立体成像</a></li>
                            <li class="course-nav-item"><a href="" target="_self">AR/VR</a></li>
                            <li class="course-nav-item"><a href="" target="_self">单摄像头</a></li>
                            <li class="course-nav-item"><a href="" target="_self">双摄像头</a></li>
                            <li class="course-nav-item"><a href="" target="_self">全景相机</a></li>
                            <li class="course-nav-item"><a href="" target="_self">智能冰箱</a></li>
                            <li class="course-nav-item"><a href="" target="_self">深度相机</a></li>
                            <li class="course-nav-item"><a href="" target="_self">行车记录仪</a></li>
                            <li class="course-nav-item"><a href="" target="_self">投影仪</a></li>
                            <li class="course-nav-item"><a href="" target="_self">视频直播</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="course-list">
            <ul>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/1.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/2.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/3.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/4.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                    <span class="course-type">PPT</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/5.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/1.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/2.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/3.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/4.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                    <span class="course-type">PPT</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/5.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/1.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/2.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}img/3.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/4.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                    <span class="course-type">PPT</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/5.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/1.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/2.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/3.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/4.png);"></div>
                    </a>
                </div>
                <div class="index-card-container">
                    <a href="" target="_blank" class="course-card">
                        <div class="course-card-text">
                            <div class="course-card-top">
                                <h4>防抖技术</h4>
                            </div>
                            <div class="course-card-content">
                                <h3 class="course-card-name">防抖技术课程标题</h3>
                                <p title="防抖技术课程简介">防抖技术课程简介防抖技术课程简介</p>
                                <div class="course-card-info">
                                    <span>类型</span>
                                    <span class="course-type">视频</span>
                                    <span class="course-type">PPT</span>
                                </div>
                            </div>
                        </div>
                        <div class="course-card-cover"></div>
                        <div class="course-card-bg" style="background-image: url(${pageContext.request.contextPath}/img/5.png);"></div>
                    </a>
                </div>
            </ul>
        </div>
    </div>
    <div class="page">
        <a href="">首页</a>
        <a href="">上一页</a>
        <a class="text-page-tag" href="">1</a>
        <a class="text-page-tag" href="">2</a>
        <a class="text-page-tag" href="">3</a>
        <a class="text-page-tag" href="">4</a>
        <a class="text-page-tag" href="">5</a>
        <a class="text-page-tag" href="">6</a>
        <a class="text-page-tag" href="">7</a>
        <a  href="">下一页</a>
        <a  href="">尾页</a>
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
