(function($){


        /*搜索框模块的功能实现*/
         // $('#search-input').bind('keyup',function(){
         //          var jqueryInput = $(this);
         //          var searchText = jqueryInput.val();
         //          $.get('http://localhost:8008/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson?lessonName='+searchText,function(data){
         //                 var d = data.lessonName;
         //                 html = ' ';
         //                 $.each(function(i, d) {
         //                      html += '<li>'+d[i].Txt+'</li>';                           
         //                 });

         //                  // $('#data-list').html(html);
         //                  // $('.searchTag').hide();
         //                  // $('.search-area-result').show();
         //          },'json');
         // });
         // $('#search-input').bind('click',function(){
         //    $('.searchTag').hide();
         //    $('.search-area-result').show();
         // });
         // // $(document).bind('click',function(){
         // // 	$('.search-area-result').hide();
         // // });
         // $(document).delegate('li','click',function(){
         //     var keyword = $(this).text;
         //     location.href = 'http://localhost:8008/studyOnline-1.0-SNAPSHOT/search?q'+keyword;
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
        $.getJSON('http://localhost:8008/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson',
              function(json){
                $(".class-list").children().empty();  
                 for(var i=0;i<7;i++){
                      //初始化
                     //课程id
                     // var vioId = json[i].lessonId;
                     //课程<img />元素
                     var vioCover = 'http://localhost:8008/studyOnline-1.0-SNAPSHOT/img/lessonImage/'+json[i].lessonCover;
                     //课程<vioTitle/>标题
                     var vioTitle = json[i].lessonName;

                     //生成推荐模块<div>标签插入HTML推荐模块中
                     $(".class-list").append(
                           "<div class='re-video-item'><span class='re-vioImg'><a href=''><img src="+vioCover+"></a></span><span class='re-vioTitle'>"+vioTitle+"</span></div>");
                    $("#type").append("<div class='type-content-right' id='course-list'><a class='main-video-item' href='' target='_blank'><span class='main-vioImg'><img src="+vioCover+"></span><span class='main-vioTitle'>"+vioTitle+"</span><span class='viewCount'>120人</span><div class='vioCover-max'><i class='icon-play'></i></div></a></div>");
                    // $("#course-list").empty();
                         var data = json[i].routes; //获取子课程json数组数据
                             for(var j=0;j<6;j++){
                               var smallVioCover =  'http://localhost:8008/studyOnline-1.0-SNAPSHOT/img/routeImage/'+data[j].cover;//获取子课程的cover路径
                               var smallVioTitle = data[j].routeName;//获取子课程的name标题
                               $('#course-list').append("<a class='video-item' href='' target='_blank' ><span class='vioImg' ><img src="+smallVioCover+"></span><span class='vioTitle'>"+smallVioTitle+"</span><div class='vioCover'><i class='icon-play'></i></div><span class='viewCount'>120人</span></a> ")
                          }
                 } 

                 // var data = json[i].routes;

         });
            /*推荐模块的功能实现*/
            // $('#change').bind('click',function(){

            // });

        /*jQuery动态创建课程模块内容*/
        // $.getJSON('http://localhost:8008/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson',
        //       function(json){
        //         $("#course-list").children().empty();
        //          for(var j=0;j<6;j++){
        //              //课程<img />元素
        //              var vioImg = $("img").attr("src",'http://localhost:8008/studyOnline-1.0-SNAPSHOT/img/lessonImage/'+data[i].lessonCover);
        //              //课程<vioTitle/>标题
        //              var vioTitle = data[i].lessonName;
        //              //生成课程模块<a>标签插入到HTML课程模块           
        //              $('#vioImg').append('vioImg');
        //              $('#vioTitle').append('vioTitle');
        //         }
        //       }
        //   )


})(jQuery);
