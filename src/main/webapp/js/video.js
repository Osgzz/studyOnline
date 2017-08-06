// videojs("ocean-play",{
// 	"techOrder": ["html5","flash","other supported tech"],
// 	"example_option":true,
// 	"autoplay":true
// },function(){

// });
// var myPlayer = videojs('ocean-play');
// videojs("ocean-play").ready(function(){
//     var myPlayer = this;
//     myPlayer.play();
// });

//    var myPlayer = videojs('ocean-play');
//    videojs("ocean-play", {
//    	techOrder: ["html5","flash","other supported tech"],
// autoplay:true
//    },(function(){
//        var myPlayer = this;
//        myPlayer.play();
//    });

// videojs("ocean-play", {
// 	example_option:true,
// });
(function ($) {


    $("#submitDiscuss").click(function () {
        var content = $("#discussContent").val();
        var videoId = $("#videoId").val();
        $.getJSON("/studyOnline-1.0-SNAPSHOT/addDiscuss", {content: content, videoId: videoId}, function (json) {
            alert("发表成功");
            $("#comment").children("li").remove();
            var content = $("#discussContent").val("");
            var discussList = json.discussList;
            for (var i = 0; i < discussList.length; i++) {
                var discuss = discussList[i];
                var empNickName = discuss.empNickName;
                var time = discuss.time;
                var discussText = discuss.content;
                $("#comment").append("<li class='content-item clearfix'><div class='list-avator'><a href='#'><img src='../img/1.png' alt='头像'></a></div><div class='list-main'><ul class='plbg clearfix'><div class='list-nick'><a href='#'>" + empNickName + "</a></div><div class='list-time'><span class='list-time'>" + time + "</span></div></ul><ul class='plul clearfix'><div class='list-content'>" + discussText + "</div><a class='list-reply' name=''>回复</a></ul></div></li>");
            }
        })
    });


    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
        var r = window.location.search.substr(1).match(reg);  //获取url中"?"符后的字符串并正则匹配
        var context = "";
        if (r != null)
            context = r[2];
        reg = null;
        r = null;
        return context == null || context == "" || context == "undefined" ? "" : context;
    }

    var routeId = getUrlParam('id');

    $.getJSON('/studyOnline-1.0-SNAPSHOT/showRoute', {routeId: routeId}, function (json) {
        var videoPath = json.videoPath;
        videoPath = "/studyOnline-1.0-SNAPSHOT/video/" + videoPath;
        $("#ocean-video").append("<source src=" + videoPath + " type='video/mp4'>")
        var videoCoverPath = "/studyOnline-1.0-SNAPSHOT/img/videoSceen/" + json.videoCoverPath;
        $("#ocean-video").attr("poster", videoCoverPath);
        var routeDetail = json.routeDetail;
        var routeName = json.routeName;
        $("#routeDetail").append(routeDetail);
        $("#routeTitle").append(routeName);

        var videoId = json.videoId;
        $("#videoId").val(videoId);
        // $.getJSON('/studyOnline-1.0-SNAPSHOT/showRoute',{discuss:discuss},function (json) {
        //
        //
        // })



        $.getJSON("/studyOnline-1.0-SNAPSHOT/getAllDiscuss", {videoId: videoId}, function (json) {
            $("#comment").children("li").remove();
            var content = $("#discussContent").val("");
            var discussList = json.discussList;
            for (var i = 0; i < discussList.length; i++) {
                var discuss = discussList[i];
                var empNickName = discuss.empNickName;
                var time = discuss.time;
                var discussText = discuss.content;
                $("#comment").append("<li class='content-item clearfix'><div class='list-avator'><a href='#'><img src='../img/1.png' alt='头像'></a></div><div class='list-main'><ul class='plbg clearfix'><div class='list-nick'><a href='#'>" + empNickName + "</a></div><div class='list-time'><span class='list-time'>" + time + "</span></div></ul><ul class='plul clearfix'><div class='list-content'>" + discussText + "</div><a class='list-reply' name=''>回复</a></ul></div></li>");
            }
        });

    });






})(jQuery);
