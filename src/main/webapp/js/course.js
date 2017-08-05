(function ($) {

    /* 搜索框功能实现*/
    $('.search-form').bind('click', function () {
        $('#searchTag').hide();
        //input搜索框输入绑定事件
        $('#search-input').bind('keyup', function () {
            var searchText = $('#search-input').val();
            //输入搜索课程，出现子课程提示
            $.get('/studyOnline-1.0-SNAPSHOT/selectLessonByNameWithJson?' ,{
                searchName: searchText
                }, function (json) {

                var route = json.lessonWithRouteList[0].routes;
                var htmlContent = ' ';
                for (var i = 0; i < route.length; i++) {
                    htmlContent += '<li><a class=li-item target=_blank href=/studyOnline-1.0-SNAPSHOT/showRoute?id=' + data[i].id + '>' + data[i].routeName + '</a></li>';
                }
                $('#search-area-result').html(htmlContent);
                $('#search-area-result').css({display: 'block'});
                //点击li就会获取当前的值匹配到搜索框中
                $("li").click(function () {
                    $('#search-input').val($(this).text());
                });

            }, 'json');
        });
    });
    //点击搜索按钮时,提交表单
    $(".showhide-search").bind('click', function () {
        var inputText = $('#search-input').val();
        if (inputText == '') {
            // alert('当前表单值为空');
            $('#search-input').focus();//光标重定回输入框,并且阻止表单的提交
            $('#search-area-result').hide();//隐藏表单搜索提示内容;
            return false;
        } else {
            //表单数据不为空时，提交表单
            $("#search-form").submit();
            // alert('表单值不为空，提交表单');
        }

    });

    $(document).bind('click', function () {
        $('#search-area-result').hide();
    });

    /*course.js*/
    //动态获取菜单栏“全部”项的数据
    $.get('/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson', function (data) {
        $("#tab ul.all").append("<li class='course-nav-item on'><a href='/studyOnline-1.0-SNAPSHOT/html/course.html?searchName' target='_self'>全部</a></li>");
        for (var i = 0; i < data.length; i++) {
            var navItem = data[i].lessonName;
            //遍历json数据,tab添加"one"样式,插入遍历到的“虹软技术”大课程菜单选项
            $("#tab ul.all").append("<li class='course-nav-item'><a href='/studyOnline-1.0-SNAPSHOT/html/course.html?searchName=" + data[i].lessonName + "'target='_self'>" + data[i].lessonName + "</a></li>");
        }
    });

    $(".course-nav-item-top.one").click(function () {
        $(".course-nav-item-top.one").addClass('on');//:acitve添加背景色
        $(".course-nav-item-top.all").removeClass('on');//除去背景色
        $(".course-nav-item-top.two").removeClass('on');  //除去背景色   
        //动态获取数据，并切换tab栏为“虹软技术”下对应的课程
        $.get('/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson', function (data) {
            $("#tab ul.all").hide();//tab>all选项隐藏
            $("#tab ul.two").hide();//tab>all选项隐藏           
            //添加li:全部选项
            $("#tab ul.one").children().remove();//初始化tab>one选项
            $("#tab ul.one").append("<li class='course-nav-item on'><a href='/studyOnline-1.0-SNAPSHOT/html/course.html?searchName' target='_self'>全部</a></li>");
            for (var i = 0; i < data.length - 3; i++) {
                var navItem = data[i].lessonName;

                //遍历json数据,tab添加"one"样式,插入遍历到的“虹软技术”大课程菜单选项
                $("#tab ul.one").append("<li class='course-nav-item'><a href='/studyOnline-1.0-SNAPSHOT/html/course.html?searchName=" + data[i].lessonName + "'target='_self'>" + data[i].lessonName + "</a></li>");

            }
            //子菜单栏切换样式的实现
            changeTab();
            //新生成的tab>one选项显示
            $("#tab ul.one").show();
            // //子菜单栏切换样式的实现   
            // changeTab();  
        });
        // $(".course-nav-item.one").css('.course-nav-item.one.on');
    });
    //方向栏下>第一次点击"全部"选项前,也可做分类>下的选项切换
    // changeTab();

    $(".course-nav-item-top.all").click(function () {
        $(".course-nav-item-top.all").addClass('on');//:acitve添加背景色
        $(".course-nav-item-top.one").removeClass('on');//除去背景色
        $(".course-nav-item-top.two").removeClass('on');    //除去背景色
        $("#tab ul.all").show();//tab>all选项显示
        changeTab();

        $("#tab ul.one").hide();//tab>one选项隐藏
        $("#tab ul.two").hide();//tab>two选项隐藏  

    });

    $(".course-nav-item-top.two").click(function () {
        $(".course-nav-item-top.two").addClass('on');//:acitve添加背景色
        $(".course-nav-item-top.one").removeClass('on');//除去背景色
        $(".course-nav-item-top.all").removeClass('on');     //除去背景色    
        //动态获取数据，并切换tab栏为“虹软产品”下对应的课程
        $.get('/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson', function (data) {
            $("#tab ul.all").hide();//tab>all选项隐藏
            $("#tab ul.one").hide();//tab>one选项隐藏           
            //添加li:全部选项
            $("#tab ul.two").children().remove();//初始化tab>one选项             
            $("#tab ul.two").append("<li class='course-nav-item on'><a href='/studyOnline-1.0-SNAPSHOT/html/course.html?searchName' target='_self'>全部</a></li>");
            for (var i = 3; i < data.length; i++) {
                var navItem = data[i].lessonName;
                //遍历json数据,tab添加"one"样式,插入遍历到的“虹软技术”大课程菜单选项
                $("#tab ul.two").append("<li class='course-nav-item'><a href='/studyOnline-1.0-SNAPSHOT/html/course.html?searchName=" + data[i].lessonName + "'target='_self'>" + data[i].lessonName + "</a></li>");
            }
            $(".course-nav-item-top.two").addClass('on');//:acitve添加背景色
            $(".course-nav-item-top.one").removeClass('on');//除去背景色
            $(".course-nav-item-top.all").removeClass('on');     //除去背景色
            //新生成的tab>one选项显示
            $("#tab ul.two").show();
            // //子菜单栏切换样式的实现    
            changeTab();
        });
    });

    //子菜单栏切换样式的实现
    //使用url传参数，然后根据参数判断是否有必要显示class
    function changeTab() {
        $('#tab li a').each(function () {
            if ($($(this))[0].href == String(window.location)) {
                $('#tab li').removeClass("on");
                $(this).parent().addClass('on');

            }
        });
    }


    // changeTab();

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

    function getCharFromUtf8(str) {
        var cstr = "";
        var nOffset = 0;
        if (str == "")
            return "";
        str = str.toLowerCase();
        nOffset = str.indexOf("%e");
        if (nOffset == -1)
            return str;
        while (nOffset != -1) {
            cstr += str.substr(0, nOffset);
            str = str.substr(nOffset, str.length - nOffset);
            if (str == "" || str.length < 9)
                return cstr;
            cstr += utf8ToChar(str.substr(0, 9));
            str = str.substr(9, str.length - 9);
            nOffset = str.indexOf("%e");
        }
        return cstr + str;
    }

//将编码转换成字符
    function utf8ToChar(str) {
        var iCode, iCode1, iCode2;
        iCode = parseInt("0x" + str.substr(1, 2));
        iCode1 = parseInt("0x" + str.substr(4, 2));
        iCode2 = parseInt("0x" + str.substr(7, 2));
        return String.fromCharCode(((iCode & 0x0F) << 12) | ((iCode1 & 0x3F) << 6) | (iCode2 & 0x3F));
    }

    //获取url中的参数
    function getUrlParamWithEncode(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
        var r = window.location.search.substr(1).match(reg); //匹配目标参数
        if(r != null)
            return unescape(getCharFromUtf8(r[2]));  //增加UTF-8解码处理。
        return ""; //返回参数值
    }


    //传递course.html获取的课程参数到后台接口，并获取json数据进行动态数据插入
    var courseParam = getUrlParamWithEncode('searchName');
    // console.log(courseParam);
    var start = getUrlParam('start');

    $.getJSON('/studyOnline-1.0-SNAPSHOT/selectLessonByNameWithJson', {
        searchName: courseParam,
        start: start
    }, function (json) {
        var data = json.lessonWithRouteList;
        for (var i = 0; i < data.length; i++) {
            //获取子课程所有数据
            var route = json.lessonWithRouteList[i].routes;
            // console.log(route);
            //动态插入输出全部课程数模块
            for (var j = 0; j < route.length; j++) {
                //获取大课程名称
                var topCourseName = data[i].lessonName;
                //获取子课程课程名称
                var courseName = route[j].routeName;
                //获取子课程课程描述
                var courseDesc = route[j].detail;
                //获取子课程图片路径
                var courseCover = '/studyOnline-1.0-SNAPSHOT/img/routeImage/' + route[j].cover;

                ////获取子课程视频路径
                var coursePath = '/studyOnline-1.0-SNAPSHOT/html/video.html?id=' + route[j].id;
                $("#course-list ul").append("<div class='index-card-container'><a href=" + coursePath + " target='_blank' class='course-card'><div class='course-card-cover'></div><div class='course-card-text'><div class='course-card-top'><h4>" + topCourseName + "</h4></div><div class='course-card-content'><h3 class='course-card-name'>" + courseName + "</h3><p title=" + courseDesc + ">" + courseDesc + "</p></div></div><div class='course-card-bg' style='background:url(" + courseCover + ")'></div></div></a></div>");
            }
        }
        var pre = json.pre;//上一页
        var next = json.next;//下一页
        var start = json.start;//当前页
        var total = json.pageCount;//分页页数
        $(".page").children().remove();
        $('.page').append("<div class='page-pre'><a href='/studyOnline-1.0-SNAPSHOT/html/course.html?start=" + pre + "&searchName=" + courseParam + " 'target='_self'>上一页</a></div>");
        $('.page').append("<div class='page-list'></div>");
        for (var a = 1; a <= total; a++) {
            $(".page-list").append("<a class = 'text-page-tag' href='/studyOnline-1.0-SNAPSHOT/html/course.html?start=" + a + "&searchName=" + courseParam + " 'target='_self'>" + a + "</a>");
        }
        $('.page').append("<div class='page-next'><a href='/studyOnline-1.0-SNAPSHOT/html/course.html?start=" + next + "&searchName=" + courseParam + " 'target='_self'>下一页</a></div>");


    });


})(jQuery);
