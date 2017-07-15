(function($){


        /*搜索框模块的功能实现*/
         $('#search-input').bind('keyup',function(){
                  var jqueryInput = $(this);
                  var searchText = jqueryInput.val();
                  $.get('http://localhost:8008/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson?lessonName='+searchText,function(data){
                         var d = data.lessonName;
                         html = ' ';
                         $.each(function(i, d) {
                              html += '<li>'+d[i].Txt+'</li>';                           
                         });

                          // $('#data-list').html(html);
                          // $('.searchTag').hide();
                          // $('.search-area-result').show();
                  },'json');
         });
         $('#search-input').bind('click',function(){
            $('.searchTag').hide();
            $('.search-area-result').show();
         });
         // $(document).bind('click',function(){
         // 	$('.search-area-result').hide();
         // });
         $(document).delegate('li','click',function(){
             var keyword = $(this).text;
             location.href = 'http://localhost:8008/studyOnline-1.0-SNAPSHOT/search?q'+keyword;
         });



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

        
        /*jQuery动态创建推荐模块*/
        $.getJSON('http://localhost:8008/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson',
              function(json){
                $(".class-list").children().empty();  
                 for(var i=0;i<6;i++){
                      //初始化
                     //课程id
                     // var vioId = json[i].lessonId;
                     //课程<img />元素
                     var vioCover = 'http://localhost:8008/studyOnline-1.0-SNAPSHOT/img/lessonImage/'+json[i].lessonCover;
                     //课程<vioTitle/>标题
                     var vioTitle = json[i].lessonName;
                     //动态插入推荐模块的视频<div>标签
                     $(".class-list").append(
                           "<div class='re-video-item'><span class='re-vioImg'><a href=''><img src="+vioCover+"></a></span><span class='re-vioTitle'>"+vioTitle+"</span></div>");
                 }                          
         });
            /*推荐模块的功能实现*/
            // $('#change').bind('click',function(){

            // });

})(jQuery);
