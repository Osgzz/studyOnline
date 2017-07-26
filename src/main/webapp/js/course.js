(function($){
        /* 搜索框功能实现*/
       $('.search-form').bind('click', function() {
             $('#searchTag').hide();
             //input搜索框输入绑定事件
             $('#search-input').bind('keyup', function() {
                var searchText = $('#search-input').val();
                //输入搜索课程，出现子课程提示
                $.get('/studyOnline-1.0-SNAPSHOT/selectLessonByNameWithJson?searchName='+searchText,function(d){
                    var data = d.lessonWithRouteList[0].routes;
                    var htmlContent = ' ';
                    for (var i=0;i<data.length;i++) {
                        htmlContent+= '<li><a class=li-item target=_blank href=/studyOnline-1.0-SNAPSHOT/showRoute?id='+data[i].id+'>'+data[i].routeName+'</a></li>';
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
      $(".course-nav-item-top.one").click(function() {
      	$(".course-nav-item-top.one").addClass('on');//:acitve添加背景色
      	$(".course-nav-item-top.all").removeClass('on');//除去背景色
      	$(".course-nav-item-top.two").removeClass('on');  //除去背景色   

             //动态获取数据，并切换tab栏为“虹软技术”下对应的课程
      	$.get('/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson', function(data) {
      		$("#tab ul.all").hide();//tab>all选项隐藏
      		$("#tab ul.two").hide();//tab>all选项隐藏      		
      		//添加li:全部选项
      		$("#tab ul.one").children().remove();//初始化tab>one选项
      		$("#tab ul.one").append("<li class='course-nav-item on'><a href='#' target='_self'>全部</a></li>");
      		for(var i=0;i<data.length;i++){
      			var navItem = data[i].lessonName;
      			//遍历json数据,tab添加"one"样式,插入遍历到的“虹软技术”大课程菜单选项
      			$("#tab ul.one").append("<li class='course-nav-item'><a href='#' target='_self'>"+data[i].lessonName+"</a></li>");
      		//获取子课程的数据,tab栏数据可以点击切换选项
      		// var routeData = data[i].routes;
      		// for (var i = routes.length;i++) {
      		// 	routes[i]
      		// }
      		}
      		//新生成的tab>one选项显示
      		$("#tab ul.one").show();   
      		//子菜单栏切换样式的实现	
      		// $(".course-nav-item").click(function(event) {
	       //        	$this = $(this);
	       //        	$(".course-nav-item").hasClass('on');
	       //        	$(".course-nav-item").removeClass('on');
	       //        	$this.addClass('on');
        //                  });     
                          changeTab();	
      	});
         	// $(".course-nav-item.one").css('.course-nav-item.one.on');    	
      });
      //方向栏下>第一次点击"全部"选项前,也可做分类>下的选项切换
      changeTab();
      $(".course-nav-item-top.all").click(function() {
      	$(".course-nav-item-top.all").addClass('on');//:acitve添加背景色
      	$(".course-nav-item-top.one").removeClass('on');//除去背景色
       	$(".course-nav-item-top.two").removeClass('on');    //除去背景色 	
              
             $("#tab ul.all").show();//tab>all选项显示
              changeTab();
	// //子菜单栏切换样式的实现	
	// $(".course-nav-item").click(function(event) {
	//           	$this = $(this);
	//           	$(".course-nav-item").hasClass('on');
	//           	$(".course-nav-item").removeClass('on');
	//           	$this.addClass('on');
 //             });               
       	$("#tab ul.one").hide();//tab>one选项隐藏
       	$("#tab ul.two").hide();//tab>two选项隐藏  
   	     	
      });     

     $(".course-nav-item-top.two").click(function() {
      	$(".course-nav-item-top.two").addClass('on');//:acitve添加背景色
      	$(".course-nav-item-top.one").removeClass('on');//除去背景色
       	$(".course-nav-item-top.all").removeClass('on');     //除去背景色	

       	 //动态获取数据，并切换tab栏为“虹软产品”下对应的课程
      	$.get('/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson', function(data) {
      		$("#tab ul.all").hide();//tab>all选项隐藏
      		$("#tab ul.one").hide();//tab>one选项隐藏      		
      		//添加li:全部选项
      		$("#tab ul.two").children().remove();//初始化tab>one选项      		
      		$("#tab ul.two").append("<li class='course-nav-item on'><a href='#' target='_self'>全部</a></li>");
      		for(var i=0;i<data.length;i++){
      			var navItem = data[i].lessonName;
      			//遍历json数据,tab添加"one"样式,插入遍历到的“虹软技术”大课程菜单选项
      			$("#tab ul.two").append("<li class='course-nav-item'><a href='#' target='_self'>"+data[i].lessonName+"</a></li>");
      		//获取子课程的数据,tab栏数据可以点击切换选项
      		// var routeData = data[i].routes;
      		// for (var i = routes.length;i++) {
      		// 	routes[i]
      		// }
      		}
      		//新生成的tab>one选项显示
      		$("#tab ul.two").show(); 
      		// //子菜单栏切换样式的实现	
      		// $(".course-nav-item").click(function(event) {
	       //        	$this = $(this);
	       //        	$(".course-nav-item").hasClass('on');
	       //        	$(".course-nav-item").removeClass('on');
	       //        	$this.addClass('on');
        //                  }); 
                       changeTab();
      	});
      });  
     //
      function changeTab(){	
      		$(".course-nav-item").click(function(event) {
	              	$this = $(this);
	              	$(".course-nav-item").hasClass('on');
	              	$(".course-nav-item").removeClass('on');
	              	$this.addClass('on');
                         });         	     	
      }   	 

      // 动态获取课程列表的所有数据
      $.getJSON('/studyOnline-1.0-SNAPSHOT/getLessonListWithRouteByJson', function(json) {
      	         
      		for(var i=0;i<json.length;i++){
       		        //获取子课程所有数据
      		        var route = json[i].routes;   
      		        //动态插入输出全部课程数模块  		
      	                     for(var j=0;j<route.length;j++){     				    
      			     //获取大课程名称
      			     var len = 0;
      			     var  topCourseName = json[i].lessonName;
     			           //动态插入大课程标题
      			     // $("#course-list ul").append("<div class='index-card-container'><a href='#' target='_blank' class='course-card'><div class='course-card-text'><div class='course-card-top'><h4>"+topCourseName+"</h4></div></div></a></div>");     			     	
      			           len = len++;
      			           console.log("len");
         		             // for(var j=0; j<route.length;j++){
	               //               //获取子课程课程名称      
	        	                   var courseName = route[j].routeName;
      			       //获取子课程课程描述                                             
                                             var courseDesc = route[j].detail;
      			       //获取子课程图片路径                                             
                                             var courseCover = '/studyOnline-1.0-SNAPSHOT/img/routeImage/'+ route[j].cover;
                                             // var lessonCover = '/studyOnline-1.0-SNAPSHOT/img/routeImage/'+ json[i].lessonCover;

                                             ////获取子课程视频路径  
                                             var coursePath = '/studyOnline-1.0-SNAPSHOT/showRoute?id='+ route[j].id;
                                             $("#course-list ul").append("<div class='index-card-container'><a href='#' target='_blank' class='course-card'><div class='course-card-cover'></div><div class='course-card-text'><div class='course-card-top'><h4>"+topCourseName+"</h4></div><div class='course-card-content'><h3 class='course-card-name'>"+courseName+"</h3><p title="+courseDesc+">"+courseDesc+"</p></div></div><div class='course-card-bg' style='background:url("+courseCover+")'></div></div></a></div>");     			     	

                                             // $("#course-list ul").append("<div class='index-card-container'><a href="+coursePath+" target='_blank' class='course-card'><div class='course-card-text'><div class='course-card-top'><p>"+topCourseName+"</p></div><div class='course-card-content'><h3 class='course-card-name'>"+courseName+"</h3><p title='防抖技术课程简介'>"+courseDesc+"</p></div></div><div class='course-card-cover'></div><div class='course-card-bg'></div></a></div>');
                                             // $(".course-card-content").eq(i-1).children().remove();
                                             // $(".course-card-text").eq(j).eq(i).append("<div class='course-card-content'><h3 class='course-card-name'>"+courseName+"</h3><p title="+courseDesc+">"+courseDesc+"</p></div></div>");
                                             // var courseCardText = '<div class=course-card-content><h3 class=course-card-name>'+courseName+'</h3><p title='+courseDesc+'>'+courseDesc+'</p></div>';
                                             // (course-card-text).insertBefore(".course-card-top");
                                             // $(".course-card").eq(j).eq(i).append("<div class='course-card-cover'></div>");
                                             // $('.course-card-bg').css({
                                             //                                              	background: 'url('+lessonCover+')'
                                             //                                              });	                                             
	                                // $(".course-card").eq(j).eq(i).append("<div class='course-card-bg'></div>");	  			          
     		        
      		      // }
      		  }     			           
      	                       }

      		
      });

})(jQuery);