(function($){
        // 当@media(width<768px)时

        /* 搜索框功能实现*/
        $('.search-form').bind('click', function() {
             $('#searchTag').hide();
             //input搜索框输入绑定事件
             $('#search-input').bind('keyup', function() {
                var searchText = $('#search-input').val();
                //输入搜索课程，出现子课程提示
                $.get('/studyOnline-1.0-SNAPSHOT/selectLessonByNameWithJson?',{
                    searchName:searchText
                    },function(json){
                    var route = json.lessonWithRouteList[0].routes;
                    var htmlContent = ' ';
                    for (var i=0;i<route.length;i++) {
                        htmlContent+= '<li><a class=li-item target=_blank href=/studyOnline-1.0-SNAPSHOT/showRoute?id='+route[i].id+'>'+route[i].routeName+'</a></li>';                    
                    }
                    $('#search-area-result').html(htmlContent);
                    $('#search-area-result').css({display: 'block'}); 
                    //点击li就会获取当前的值匹配到搜索框中
                    $("li").click(function() {
                        $('#search-input').val($(this).text());                      
                    });                       

                },'json');
             });
        });
        //点击搜索按钮时,提交表单
        $(".showhide-search").bind('click',function() {
                     var inputText = $('#search-input').val();  
                           if ( inputText == '') {
                            // alert('当前表单值为空');
                            $('#search-input').focus();//光标重定回输入框,并且阻止表单的提交
                            $('#search-area-result').hide();//隐藏表单搜索提示内容;
                             return false;
                        }  else{
                        //表单数据不为空时，提交表单
                     $("#search-form").submit();   
                     // alert('表单值不为空，提交表单');    
                        }   
                    
        });
        //点击搜索按钮，onclick触发searchLesson函数,
        // function searchLesson(){

        //     var inputText = $("#search-input").text();
        //     if ( inputText === ' ') {

        //          event.stopPropagation();
        //     }           
        //     $("#search-form").submit();            
        // }         

        //当点击浏览器其他位置时，提示框消失
        $(document).bind('click',function() {
            $('#search-area-result').hide();
        });
        //为li添加事件代理,点击课程名称跳转到对应的课程播放页
        // $(document).delegate('li', 'click', function() {
        //      location.href = $('.li-item').attr("href");
        // });


         /*轮播图模块的功能实现*/
         var curIndex = 0; //当前index
         imgLen = $(".img-list li").length;//图片总数
     //  alert(imgLen);
     // 定时器自动变换2.5秒每次
         var autoChange = setInterval(function(){ 
             if(curIndex < $(".img-list li").length-1){ 
                  curIndex ++; 
                }else{ 
                  curIndex = 0;
                }
                //调用变换处理函数
                changeTo(curIndex); 
              },2500);
                 
             //左箭头滑入滑出事件处理
             $("#prev").hover(function(){
                    //滑入清除定时器
                    clearInterval(autoChange);
                 },function(){
                    //滑出重置定时器
                    autoChangeAgain();
                 });
                 //左箭头点击处理
             $("#prev").click(function(){
                    //根据curIndex进行上一个图片的处理
                    curIndex = (curIndex>0) ? (--curIndex):(imgLen-1);
                    changeTo(curIndex);
                 })
                 //右箭头滑入滑出事件处理
             $("#next").hover(function(){
                    //滑入清除定时器
                    clearInterval(autoChange);
                 },function(){
                    //滑出重置定时器
                    autoChangeAgain();
                 });
                 //右箭头点击事件处理
             $("#next").click(function(){
                    //根据curIndex进行上一个图片处理
                    curIndex = (curIndex<imgLen-1) ? (++curIndex):0;
                    changeTo(curIndex);
                 })
         
             $(".index-list").find("li").each(function(item){ 
                $(this).hover(function(){ 
                   clearInterval(autoChange);
                   changeTo(item);
                   curIndex = item;
                   },function(){ 
                      autoChangeAgain();
                    });
      });
               //清除定时器时候的充值定时器--封装
         function autoChangeAgain(){
               autoChange = setInterval(function(){
                      if(curIndex<imgLen-1){
                            curIndex++;
                       }else{
                        curIndex=0;
                       }
                       //调用变换处理函数
                       changeTo(curIndex);
                   },2500);
               }
        function changeTo(num){ 
        $(".img-list").find("li").removeClass("imgOn").hide().eq(num).fadeIn().addClass("imgOn");
        $(".info-list").find("li").removeClass("infoOn").eq(num).addClass("infoOn");
        $(".index-list").find("span").removeClass("indexOn").eq(num).addClass("indexOn");
      }

        
        /*jQuery动态创建推荐内容模块*/
           $.getJSON('/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson',
              function(json){
                  // 推荐模块
                for(var i=0;i<6;i++){
                 //初始化
                 //课程id
                 // var vioId = json[i].lessonId;
                 //课程<img />元素
                 var vioCover = '/studyOnline-1.0-SNAPSHOT/img/lessonImage/'+json[i].lessonCover;
                 //课程<vioTitle/>标题
                 var vioTitle = json[i].lessonName;
                 //生成推荐模块<div>标签插入HTML推荐模块中
                 $(".class-list").append(
                       "<div class='re-video-item'><span class='re-vioImg'><a href='/studyOnline-1.0-SNAPSHOT/html/course.html?searchName="+vioTitle+"' target='_blank'><img src="+vioCover+"></a></span><span class='re-vioTitle'>"+vioTitle+"</span></div>");                 
                 }              

                  /*课程模块*/
                 //遍历json数组生成左边栏模块
                 for(var i=0;i<6;i++){
                     var vioDetail = json[i].lessonDetail;     
                     //生成推荐模块<div>标签插入HTML推荐模块中
                     var vioPath = '/studyOnline-1.0-SNAPSHOT/html/course.html?searchName='+json[i].lessonName; //点击“了解更多”跳转到course.html
                    $('.type-content-left').eq(i).append("<h2 class='path-title'>"+vioDetail+"</h2><a  class='path-more' href="+vioPath+" target='_blank'>了解更多 >></a>");//eq()函数指定当前的数据索引添加<h2>标签，否则会遍历出全部的课程名称

                      // $(".type-content-left").empty();
                      
                    /*为左边栏不同的课程模块添加不同背景颜色*/
                     var classData = ["fd","qj","hdr","cj"];
                     $.each(classData,function(index, el) {
                            $(".type-content-left").eq(index).addClass(el);
                     });

                     //获取子课程json数组数据，生成右边栏的课程模块
                     var route = json[i].routes; 
                         for(var j=0;j<route.length;j++){
                               var smallVioCover =  '/studyOnline-1.0-SNAPSHOT/img/routeImage/'+route[j].cover;//获取子课程的cover路径
                               var smallVioTitle = route[j].routeName;//获取子课程的name标题
                               var smallVioId = '/studyOnline-1.0-SNAPSHOT/html/video.html?id='+route[j].id;
                               // $('.type-content').append("<div class='type-content-right'><a class='video-item' href='' target='_blank' ><span class='vioImg' ><img src="+smallVioCover+"></span><span class='vioTitle'>"+smallVioTitle+"</span><div class='vioCover'><i class='icon-play'></i></div><span class='viewCount'>120人</span></a></div>");
                               $('.type-content-right').eq(i).append("<a class='video-item' href="+smallVioId+" target='_blank' ><span class='vioImg' ><img src="+smallVioCover+"></span><span class='vioTitle'>"+smallVioTitle+"</span><div class='vioCover'><i class='icon-play'></i></div><span class='viewCount'>120人</span></a>");
                          }               
                 } 
             })
               

})(jQuery);
