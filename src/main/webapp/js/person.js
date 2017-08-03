(function($){

        /* 搜索框功能实现*/
        $('.search-form').bind('click', function() {
             $('#searchTag').hide();
             //input搜索框输入绑定事件
             $('#search-input').bind('keyup', function() {
                var searchText = $('#search-input').val();
                //输入搜索课程，出现子课程提示
                $.get('/studyOnline-1.0-SNAPSHOT/selectLessonByNameWithJson?searchName='+searchText,function(json){
                    var route = json.lessonWithRouteList[0].routes;
                    var htmlContent = ' ';
                    for (var i=0;i<route.length;i++) {
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

        //当点击浏览器其他位置时，提示框消失
        $(document).bind('click',function() {
            $('#search-area-result').hide();
        });
})(jQuery);