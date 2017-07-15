(function(){
	var sign = { };

	//获取dom
	sign.getDom = function(){
		var signWrap = document.getElementById('sign-wrap') || null,
		       loginTitl = signWrap.getElementsByClassName('login-titl')[0] || null,
		       registerTitl = signWrap.getElementsByClassName('register-titl')[0] || null,
		       login = signWrap.getElementsByClassName('login-form')[0] || null,
		       register= signWrap.getElementsByClassName('register-form')[0] || null;

		 sign.dom = {
		       "signWrap" : signWrap,
		       "loginTitl" : loginTitl,
		       "registerTitl" : registerTitl,
		       "login" : login,
		       "register": register
		 };

             }

	//tab选项栏
	sign.tab = function(){
                       
		sign.dom.loginTitl.onclick = function(){
			sign.dom.registerTitl.className = "login-titl";
			this.className = "login-titl on";

			sign.dom.login.style.display = "block";
			sign.dom.register.style.display = "none";
		}

		sign.dom.registerTitl.onclick =function(){
			sign.dom.loginTitl.className = "register-titl";
			this.className = "register-titl on";
	                         
			sign.dom.register.style.display = "block";
			sign.dom.login.style.display = "none";

		}
	}


	//显示
	 sign.show = function(state){
	             if(state === 0) {//登录
	             	sign.dom.registerTitl.className = "register-titl";
	             	sign.dom.loginTitl.className = "login-titl on";

	             	sign.dom.login.style.display = "block";
	             	sign.dom.register.style.display = "none";
	             }else{ //注册
	                          
	                     sign.dom.loginTitl.className="login-titl";
	                     sign.dom.registerTitl.className = "register-titl on";

			sign.dom.register.style.display = "block";
			sign.dom.login.style.display = "none";
	             }	

	             sign.dom.signWrap.style.display = "block";
	 }

	 //隐藏
	 sign.hide = function(){
	 	sign.dom.signWrap.style.display = "none";
	 }

	 //初始化
	 sign.init = function(){
	 	sign.getDom();
	 	sign.tab();
	 }

	 sign.init();

})();