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
                   	ele_li.appendChild(ele_a);
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

})();