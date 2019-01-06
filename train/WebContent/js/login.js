
function getContextPath() {
    var pathName = document.location.pathname;
    var index = pathName.substr(1).indexOf("/");
    var result = pathName.substr(0, index + 1);
    return result;
}

function loginCheck () {
    	
    var username = $('input[name="username"]').val();
    var password = $('input[name="password"]').val();
    var list = document.getElementsByName("login")
  	for(var i =0 ; i<list.length; i++ ){
  		if( list[i].checked == true ){
  		  if(list[i].value=="学生"){
  			var url =getContextPath()+"/UserServlet?type=studentLogin";
  	        var data = {'username':username,'password':password};
  	        $.post(url,data,function(result){
  	            if(result.status == 0) {
  	                $('#error').append('<div class="alert alert-danger" role="alert">用户名和密码不匹配</div>');
  	            }
  	            if(result.status == 1) {
  	            	layer.open({
  	                  content : result.message,
  	                  icon : 1,
  	                  yes : function(){
  	                      location.href="/train/jsp/index.jsp";
  	                  },
  	              });
  	            }

  	        },'JSON');
  		  }else if(list[i].value=="教师"){
  			var url =getContextPath()+"/UserServlet?type=teacherLogin";
  	        var data = {'username':username,'password':password};
  	        $.post(url,data,function(result){
  	            if(result.status == 0) {
  	                $('#error').append('<div class="alert alert-danger" role="alert">用户名和密码不匹配</div>');
  	            }
  	            if(result.status == 1) {
  	            	layer.open({
  	                  content : result.message,
  	                  icon : 1,
  	                  yes : function(){
  	                      location.href="/train/admin/index.jsp";
  	                  },
  	              });
  	            }

  	        },'JSON');
  	      }else if(list[i].value=="管理员"){
  			var url =getContextPath()+"/UserServlet?type=adminLogin";
  	        var data = {'username':username,'password':password};
  	        $.post(url,data,function(result){
  	            if(result.status == 0) {
  	                $('#error').append('<div class="alert alert-danger" role="alert">用户名和密码不匹配</div>');
  	            }
  	            if(result.status == 1) {
  	            	layer.open({
  	                  content : result.message,
  	                  icon : 1,
  	                  yes : function(){
  	                      location.href="/train/admin/index.jsp";
  	                  },
  	              });
  	            }

  	        },'JSON');
  		 }
  		}
  	}
}
function registerCheck(){

    var username = $('input[name="Rusername"]').val();
    var password = $('input[name="Rpassword"]').val();
    var url=getContextPath()+"/UserServlet?type=register";
    $.post(url,{'username':username,'password':password},function(data){
    	if(data.status == 1) {
          	layer.open({
                content : data.message,
                icon : 1,
                yes : function(){
                    location.href="/train/jsp/index.jsp";
                },
            });
          }
    },'json');
}
function loginOpen(){
		layer.open({
		  type: 1,
		  title:'',
		  area: ['388px', '380px'],
		  content: '<div  style="padding: 42px 40px;">\
		  <ul id="myTab" class="nav nav-tabs">\
			<li class="active">\
				<a href="#login" data-toggle="tab">\
					登录\
				</a>\
			</li>\
			<li><a href="#register" data-toggle="tab">注册</a></li>\
		  </ul>\
<div id="myTabContent" class="tab-content">\
		<div class="tab-pane fade in active" id="login">\
			<form class="login-wrap" style="padding: 24px 0 0 0">\
			<div style="width:200px;">\
			<div style="float:left;padding: 0 0 10px 20px">学员<input name="login" type="radio" value="学生" checked="checked"><br></div>\
			<div style="float:left;padding: 0 0 10px 20px">教师<input name="login" type="radio" value="教师"></div>\
		    <div style="float:left;padding: 0 0 10px 20px">管理员<input name="login" type="radio" value="管理员"></div>\
			</div>\
		    <div class="form-group">\
		      <label for="username" class="sr-only"></label>\
		      <input  name="username" type="text" class="form-control" placeholder="用户名" autofocus>\
		    </div>\
		    <div class="form-group">\
		      <label for="password" class="sr-only"></label>\
		      <input  name="password" type="password" class="form-control" placeholder="密码">\
		    </div>\
		    <div id="error"></div>\
		    <a class="btn btn-primary btn-block" style="height:45px;border-radius: 4px;line-height:33px" onclick="loginCheck()">登 录</a>\
		  </form>\
		</div>\
	  <div class="tab-pane fade" id="register">\
		  <form class="login-wrap" style="padding: 36px 0 0 0">\
	      <div class="form-group">\
	        <label for="Rusername" class="sr-only">用户名</label>\
	        <input  type="text" name="Rusername" class="form-control" placeholder="用户名">\
	      </div>\
	      <div class="form-group">\
	        <label for="Rpassword" class="sr-only">密码</label>\
	        <input  type="password" name="Rpassword" class="form-control" placeholder="密码">\
	      </div>\
	      <a class="btn btn-primary btn-block" style="height:45px;border-radius: 4px;line-height:33px" onclick="registerCheck()">注册</a>\
	    </form>\
	  </div>\
</div>\
</div>'
		});
}

function loginRegister(){
	layer.open({
		  type: 1,
		  title:'',
		  area: ['388px', '380px'],
		  content: '<div  style="padding: 42px 40px;">\
		  <ul id="myTab" class="nav nav-tabs">\
			<li>\
				<a href="#login" data-toggle="tab">\
					登录\
				</a>\
			</li>\
			<li  class="active"><a href="#register" data-toggle="tab">注册</a></li>\
		  </ul>\
<div id="myTabContent2" class="tab-content">\
		<div class="tab-pane fade" id="login">\
			<form class="login-wrap" style="padding: 24px 0 0 0">\
			<div style="width:200px;">\
			<div style="float:left;padding: 0 0 10px 20px">学员<input name="login" type="radio" value="学生"><br></div>\
			<div style="float:left;padding: 0 0 10px 20px">教师<input name="login" type="radio" value="教师" checked></div>\
		    <div style="float:left;padding: 0 0 10px 20px">管理员<input name="login" type="radio" value="管理员" checked></div>\
			</div>\
		    <div class="form-group">\
		      <label for="username" class="sr-only"></label>\
		      <input  type="text" class="form-control" placeholder="用户名" autofocus>\
		    </div>\
		    <div class="form-group">\
		      <label for="password" class="sr-only"></label>\
		      <input  type="password" class="form-control" placeholder="密码">\
		    </div>\
		    <a class="btn btn-primary btn-block" style="height:45px;border-radius: 4px;line-height:33px">登 录</a>\
		  </form>\
		</div>\
	  <div class="tab-pane fade  in active" id="register">\
		  <form class="login-wrap" style="padding: 36px 0 0 0">\
	      <div class="form-group">\
	        <label for="Rusername" class="sr-only">用户名</label>\
	        <input  name="Rusername" type="text" class="form-control" placeholder="用户名">\
	      </div>\
	      <div class="form-group">\
	        <label for="Rpassword" class="sr-only">密码</label>\
	        <input  name="Rpassword" type="password" class="form-control" placeholder="密码">\
	      </div>\
	      <a class="btn btn-primary btn-block" style="height:45px;border-radius: 4px;line-height:33px" onclick="registerCheck()">注册</a>\
	    </form>\
	  </div>\
</div>\
</div>'
		});
}