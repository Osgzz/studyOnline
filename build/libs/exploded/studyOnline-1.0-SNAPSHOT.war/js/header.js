(function(){

           var header = { };

           header.getDom = function(){
                     var searchTag = document.getElementById("searchTag") || null;
           	     var dataList = document.getElementById("data-list") || null;
                     var searchInput = document.getElementById("search-input") || null;

                     // /*get ‘虹软技术’ ‘虹软产品’ 菜单节点*/
                     // var navItem = document.getElementsByClassName("m-nav-item")[0] || null;
                     // /*get 二级菜单栏 ‘sub-nav’ 的节点*/
                     // var subNav = document.getElementsByClassName("sub-nav")[0] || null;

                           
                      header.dom = {
                            "searchTag" : searchTag,
                            "dataList" : dataList,
                            "searchInput" : searchInput,
                      };
           }

           header.tab = function(){
           	//点击search的input框，searchTag隐藏；否则，dataList列表隐藏
           	header.dom.searchInput.onclick = function(){
           		header.dom.searchTag.style.display = "none";
           		header.dom.dataList.style.display = "block";
           	}
            	header.dom.searchInput.onblur = function(){
           		header.dom.searchTag.style.display = "block";
           		header.dom.dataList.style.display = "none";
           	}          	
           }
          
          /*搜索框向下拉伸列表的实现*/
           header.search = function(){
		var data = ["防抖技术","人脸技术","HDR技术","暗光高清拍照技术"];//后台取得数据

		header.dom.searchInput.onkeyup = function(e){
                               
                     var val = this.value;

                     //获取输入框里匹配的数据
                     var srdata = [];
                     for(var i=0;i<data.length;i++){
                   	    console.log(data[i].indexOf(val));
                        if(val.trim().length>0&&data[i].indexOf(val)>-1){
                        	srdata.push(data[i]);
                        }
                   }

                     //在追加新数据之前，需要对前数据做初始化，再显示数据列表，如果数据为空，则不显示
                     // header.dom.dataList.style.visibility = "visible";
                      header.dom.dataList.style.display = "block";                                  
                      header.dom.dataList.innerHTML = " ";

                      if(srdata.length == 0){
                          	 // header.dom.dataList.style.visibility = "hidden";
                          	  header.dom.dataList.style.display = "none";
                      }

                      //将搜索到的数据添加到显示数据列表，每个li添加点击事件，点击后将数据放入搜索框内，数据列表隐藏
                      var self = this;
                      for(var i=0; i<srdata.length;i++){
                   	      var ele_li = document.createElement("li");
                   	      var ele_a = document.createElement("a");
                   	      ele_a.setAttribute("href","javascript:;");
                   	      ele_a.textContent = srdata[i];
                           //点击li，将value添加到列表中，数据列表隐藏
                   	      ele_a.onclick = function(){
                                self.value = this.textContent;
                                // header.dom.searchTag.style.display = "none";
                                 // header.dom.dataList.style.visibility = "hidden";
                                 header.dom.dataList.style.display = "none";
                   	}

                   	//将生成的字节点加入到主界面中
                   	ele_i.appendChild(ele_a);
                   	header.dom.dataList.appendChild(ele_li);
                   }

		}           	
           }
     

           header.init = function(){
       	          header.getDom();
       	          header.tab();
                     header.search();    	
           }


           header.init();


           /*轮播图的实现*/



window.onload = function () {
          //获取元素，父容器，列表，小圆点，两个箭头
            var container = document.getElementsByClassName('imgBox')[0];
            var list = document.getElementById('img-list');
            var buttons = document.getElementById('arcBox').getElementsByTagName('span');
            var prev = document.getElementById('prev');
            var next = document.getElementById('next');
            var index = 1;//小圆点序号
            var len = 5;//图片个数
            var animated = false;//存放动画运行状态，优化功能(正在动画，点击无效)
            var interval = 3500;//自动播放时间间隔
            var timer;

            //滑动动画效果
            function animate (offset) {
                if (offset == 0) {
                    return;
                }
                animated = true;
                var time = 220;//位移总的时间
                var inteval = 10;//位移间隔事件
                var speed = offset/(time/inteval);//每次位移量=总偏移量/次数
                var left = parseInt(list.style.left) + offset;//left属性的目标值
                //go()功能是判断是否位移和实现位移
                var go = function (){
                  //符合位移条件，进行位移
                    if ( (speed > 0 && parseInt(list.style.left) < left) || (speed < 0 && parseInt(list.style.left) > left)) {
                        list.style.left = parseInt(list.style.left) + speed + 'px';
                        setTimeout(go, inteval);//继续位移，递归
                    }
                    else {
                      //不符合位移条件，把当前left值置为目标值
                        list.style.left = left + 'px';
                        //如当前在辅助图上，就归位到真的图上
                        if(left>-200){
                            list.style.left = -1200 * len + 'px';
                        }
                        if(left<(-1200 * len)) {
                            list.style.left = '-1200px';
                        }
                        animated = false;
                    }
                }
                go();
            }


            //切换时点亮小圆点
            function showButton() {
              //遍历所有小圆点，置灰已前点亮的小圆点
                for (var i = 0; i < buttons.length ; i++) {
                    if( buttons[i].className == 'on'){
                        buttons[i].className = '';
                        break;//跳出循环
                    }
                }
                //点亮当前小圆点
                buttons[index - 1].className = 'on';
            }
            //开始自动播放
            function play() {
                timer = setTimeout(function () {
                    next.onclick();
                    play();
                }, interval);
            }
            //停止自动播放
            function stop() {
                clearTimeout(timer);
            }
            //点击右箭头事件，向左移动
            next.onclick = function () {
                if (animated) {
                    return;//正在切换，点击无效
                }
                //小圆点index归位
                if (index == 5) {
                    index = 1;
                }
                else {
                    index += 1;
                }
                //小圆点跟随箭头移动
                showButton();
                if (!animated){
                  animate(-1200);
                }
            }
            //点击左箭头事件，向右移动
            prev.onclick = function () {
                if (animated) {
                    return;//正在切换，点击无效
                }
                //小圆点index归位
                if (index == 1) {
                    index = 5;
                }
                else {
                    index -= 1;
                }
                //小圆点跟随箭头移动
                showButton();
                if (!animated){
                  animate(-1200);
                }
            }
            //给每一个小圆点添加点击事件
            for (var i = 0; i < buttons.length; i++) {
                buttons[i].onclick = function () {
                    if (animated) {
                        return;//正在切换，点击无效
                    }
                    if(this.className == 'on') {
                        return;//点击当前小圆点，不执行后面的代码
                    }
                    //小圆点跳跃切换
                   //获取不是自带属性的index的属性值
                    var myIndex = parseInt(this.getAttribute('index'));
                   //求偏移量
                    var offset = -1200 * (myIndex - index);
                    if (!animated) {
                      animate(offset);
                    }
                    //更新小圆点index值
                    index = myIndex;
                    //点亮小圆点
                    showButton();
                }
            }


 
            //鼠标移入停止自动播放，鼠标移出开始自动播放
            container.onmouseover = stop;
            container.onmouseout = play;

            play();
        }


})();
