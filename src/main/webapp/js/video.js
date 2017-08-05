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
        var videoCoverPath = "/studyOnline-1.0-SNAPSHOT/img/videoSceen/"+json.videoCoverPath;
        $("#ocean-video").attr("poster", videoCoverPath);
        var routeDetail=json.routeDetail;
        var routeName=json.routeName;
        $("#routeDetail").append(routeDetail);
        $("#routeTitle").append(routeName);

    })

})(jQuery);
