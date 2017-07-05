<%--
  Created by IntelliJ IDEA.
  User: Focus
  Date: 2017/6/21
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>虹软中国</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/video.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/normalize.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/video-js-5.11.4/video-js.css">
</head>
<body>
<div id="header">
    <div class="container clearfix">
        <div class="video-title">
            <a href="${pageContext.request.contextPath}/backToCustomer" class="video-back">
                <span><i class="icon-back"></i></span>
            </a>
            <div class="video-info">
                <span class="video-name">${route.routeName}</span>
                <div class="video-intro">课程介绍
                    <span class="video-downitem"><em class="f-c3">简介：</em>${route.routeDetail}</span>
                </div>
            </div>
        </div>

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

    </div>
</div>
<div id="main">
    <div class="video-stage">
        <div class="video-container">
            <div class="video-wrap">
                <!--   controls表示控制条，prload：预加载，poster表示最初的显示的图片。data-set支持用json来设置一些参数。source不用说了，track指的是字幕。 -->
                <div class="video-box">
                    <video id="ocean-video" class="video-js vjs-default-skin vjs-fluid vjs-big-play-centered" controls
                           preload="none" width="100%" height="100%" poster="${pageContext.request.contextPath}/img/videoSceen/${route.videoCoverPath}"
                           data-setup='{"techOrder": ["html5", "flash", "other supported tech"]}'>
                        <source src="${pageContext.request.contextPath}/video/${route.videoPath}" type="video/mp4">
                        <track kind="captions"
                               src="${pageContext.request.contextPath}/video-js-5.11.4/examples/shared/example-captions.vtt"
                               srclang="en" label="English"></track>
                        <track kind="subtitles"
                               src="${pageContext.request.contextPath}/video-js-5.11.4/examples/shared/example-captions.vtt"
                               srclang="en" label="English"></track>
                        <p class="vjs-no-js">To view this video please enable JavaScript, and consider upgrading to a
                            web browser that <a href="http://videojs.com/html5-video-support/" target="_blank">supports
                                HTML5 video</a></p>
                    </video>
                </div>
            </div>
        </div>
    </div>

    <div class="comment-container">
        <div class="comment-area">
            <span class="comment-title">评论</span>
            <div class="comment-dis" id="content">
                <div class="my-comment clearfix">
                    <a href="" class="user-head">
                        <img src="${pageContext.request.contextPath}/img/1.png" alt="头像">
                    </a>
                    <div class="comment-input">
                        <textarea class="input-holder" placeholder="扯淡、吐槽、表扬、鼓励……想说啥就说啥！"></textarea>
                    </div>
                    <div class="input-btm">
                        <input class="comment-btn" type="button" value="发表评论">
                    </div>
                </div>
                <div id="comment-list">
                    <div class="list-container">
                        <ul>
                            <li class="content-item clearfix">
                                <div class="list-avator">
                                    <a href="" target="_blank">
                                        <img src="${pageContext.request.contextPath}/img/1.png" alt="头像">
                                    </a>
                                </div>
                                <div class="list-main">
                                    <ul class="plbg clearfix">
                                        <div class="list-nick">
                                            <a href="">路人甲</a>
                                        </div>
                                        <div class="list-time">
                                            <span class="list-time">2天前</span>
                                        </div>
                                    </ul>
                                    <ul class="plul clearfix">
                                        <div class="list-content">
                                            这个评论厉害了@
                                        </div>
                                        <ul class="plbg plbg2 clearfix">
                                            <div class="list-nick">
                                                <a href="">路人乙</a>
                                            </div>
                                            <div class="list-time">
                                                <span class="list-time">2天前</span>
                                            </div>
                                        </ul>
                                        <ul class="plul plul2 clearfix">
                                            <div class="list-content">
                                                来自于第二个的回复@
                                            </div>
                                        </ul>
                                        <a class="list-reply" name="">回复</a>
                                    </ul>
                                </div>
                            </li>
                            <li class="content-item clearfix">
                                <div class="list-avator">
                                    <a href="" target="_blank">
                                        <img src="${pageContext.request.contextPath}/img/1.png" alt="头像">
                                    </a>
                                </div>
                                <div class="list-main">
                                    <ul class="plbg clearfix">
                                        <div class="list-nick">
                                            <a href="">路人甲</a>
                                        </div>
                                        <div class="list-time">
                                            <span class="list-time">2天前</span>
                                        </div>
                                    </ul>
                                    <ul class="plul clearfix">
                                        <div class="list-content">
                                            这个评论厉害了@
                                        </div>
                                        <a class="list-reply" name="">回复</a>
                                    </ul>
                                </div>
                            </li>
                            <li class="content-item clearfix">
                                <div class="list-avator">
                                    <a href="" target="_blank">
                                        <img src="${pageContext.request.contextPath}/img/1.png" alt="头像">
                                    </a>
                                </div>
                                <div class="list-main">
                                    <ul class="plbg clearfix">
                                        <div class="list-nick">
                                            <a href="">路人甲</a>
                                        </div>
                                        <div class="list-time">
                                            <span class="list-time">2天前</span>
                                        </div>
                                    </ul>
                                    <ul class="plul clearfix">
                                        <div class="list-content">
                                            这个评论厉害了@
                                        </div>
                                        <a class="list-reply" name="">回复</a>
                                    </ul>
                                </div>
                            </li>
                            <li class="content-item clearfix">
                                <div class="list-avator">
                                    <a href="" target="_blank">
                                        <img src="${pageContext.request.contextPath}/img/1.png" alt="头像">
                                    </a>
                                </div>
                                <div class="list-main">
                                    <ul class="plbg clearfix">
                                        <div class="list-nick">
                                            <a href="">路人甲</a>
                                        </div>
                                        <div class="list-time">
                                            <span class="list-time">2天前</span>
                                        </div>
                                    </ul>
                                    <ul class="plul clearfix">
                                        <div class="list-content">
                                            这个评论厉害了@
                                        </div>
                                        <a class="list-reply" name="">回复</a>
                                    </ul>
                                </div>
                            </li>
                            <li class="content-item clearfix">
                                <div class="list-avator">
                                    <a href="" target="_blank">
                                        <img src="${pageContext.request.contextPath}/img/1.png" alt="头像">
                                    </a>
                                </div>
                                <div class="list-main">
                                    <ul class="plbg clearfix">
                                        <div class="list-nick">
                                            <a href="">路人甲</a>
                                        </div>
                                        <div class="list-time">
                                            <span class="list-time">2天前</span>
                                        </div>
                                    </ul>
                                    <ul class="plul clearfix">
                                        <div class="list-content">
                                            这个评论厉害了@
                                        </div>
                                        <a class="list-reply" name="">回复</a>
                                    </ul>
                                </div>
                            </li>
                            <li class="content-item clearfix">
                                <div class="list-avator">
                                    <a href="" target="_blank">
                                        <img src="${pageContext.request.contextPath}/img/1.png" alt="头像">
                                    </a>
                                </div>
                                <div class="list-main">
                                    <ul class="plbg clearfix">
                                        <div class="list-nick">
                                            <a href="">路人甲</a>
                                        </div>
                                        <div class="list-time">
                                            <span class="list-time">2天前</span>
                                        </div>
                                    </ul>
                                    <ul class="plul clearfix">
                                        <div class="list-content">
                                            这个评论厉害了@
                                        </div>
                                        <ul class="plbg plbg2 clearfix">
                                            <div class="list-nick">
                                                <a href="">路人乙</a>
                                            </div>
                                            <div class="list-time">
                                                <span class="list-time">2天前</span>
                                            </div>
                                        </ul>
                                        <ul class="plul plul2 clearfix">
                                            <div class="list-content">
                                                来自于第二个的回复@
                                            </div>
                                            <a class="list-reply" name="">回复</a>
                                        </ul>
                                        <a class="list-reply" name="">回复</a>
                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="list-page">
                        <a href="">首页</a>
                        <a href="">上一页</a>
                        <a class="text-page-tag" href="">1</a>
                        <a class="text-page-tag" href="">2</a>
                        <a href="">下一页</a>
                        <a href="">尾页</a>
                    </div>
                </div>
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
<!-- <script type="text/javascript" src="../js/video.js"></script> -->
<script type="text/javascript" src="${pageContext.request.contextPath}/video-js-5.11.4/ie8/videojs-ie8.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/video-js-5.11.4/video.js"></script>
<script type="text/javascript">
    videojs.options.flash.swf = "video-js.swf";
</script>

</body>
</html>