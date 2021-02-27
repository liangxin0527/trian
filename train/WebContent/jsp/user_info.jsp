<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
		<style type="text/css">
	
			td{	
				width: 10px;
				height: 35px;
				border:1px solid #ececec;
				text-align: center;
			}
		</style>
  	</head>
  	<body>
	  	<jsp:include page="/jsp/top.jsp"></jsp:include>
	  	<div class="container">
	  		<div class="row" style="height:90px;"></div>
			<div class="row">
				<div class="col-lg-4"></div>
				<div>
				<div style="margin:0 auto;margin-top:10px;width:500px;">
					<strong>个人中心</strong>
					<button style="width: 100px;height: 24px;font-size: 10px;line-height: 3px;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal1" onclick="editPrivate()">修改个人信息</button>
					<button id="edit-password" style="width: 100px;height: 24px;font-size: 10px;line-height: 3px;" class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">修改密码</button>
					<table id="private_table" class="table table-bordered table-striped">
						
				 	</table>
				 </div>
				</div>
			</div>
			<div class="row" style="height:200px;"></div>
			<div class="row">
				<img style="width: 1170px;" src="${pageContext.request.contextPath}/img/foot.png"/>
			</div>
		</div>
		<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">修改个人信息</h4>
		            </div>
		            <div class="modal-body1" id="update">

		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button id="edit-pri" type="button" class="btn btn-primary" onclick="editCon()">提交更改</button>
		            </div>
		        </div>
		    </div>
		</div>
	    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		        <div class="modal-content">
		            <div class="modal-header">
		                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
		                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
		            </div>
		            <div class="modal-body2">
		            	<div class="container"> 
		            	<div class="row" style="height:50px;"></div>
		            	<div class="row">
		            		<div class="col-m-5"></div>
				            <form id="pass" class="form-horizontal col-md-5">
							  <div class="form-group">
							    <label for="oldPassword" class="col-sm-2 control-label">原密码</label>
							    <div class="col-sm-10">
							      <input name="oldPassword" type="password" class="form-control" id="oldPassword" placeholder="原密码">
							    </div>
							  </div>
							  <div class="form-group">
							    <label for="password" class="col-sm-2 control-label">新密码</label>
							    <div class="col-sm-10">
							      <input name="password" type="password" class="form-control" id="password" placeholder="新密码">
							    </div>
							  </div>
							</form>
						</div>
						<div class="row" style="height:50px;"></div>
					</div>
		            </div>
		            <div class="modal-footer">
		                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		                <button   type="button" class="btn btn-primary" onclick="editPass()">提交更改</button>
		            </div>
		        </div>
		    </div>
		</div>

  	</body>
 	
	<script id="tpl1" type="text/x-handlebars-template">
			<tr>
				<td>学号</td>
				<td>{{id}}</td>
			</tr>
			<tr>
				<td>用户名</td>
				<td>{{username}}</td>
			</tr>
			<tr>
				<td>真实姓名</td>
				<td>{{realname}}</td>
			</tr>
			<tr>
				<td>电话</td>
				<td>{{telephone}}</td>
			</tr>
	</script>
	<script id="tpl2" type="text/x-handlebars-template">
    	<div  class="container"> 
    		<div class="row" style="height:30px;"></div>
	    	<div class="row">
	    		<div class="col-m-5"></div>
	            <form id="pri" class="form-horizontal col-md-5">
				  	<div class="form-group">
				    	<label for="username" class="col-sm-2 control-label">用户名</label>
				    	<div class="col-sm-10">
				      		<input type="text" class="form-control" id="username" name="username"  value="{{username}}">
				    	</div>
				  	</div>
				  	<div class="form-group">
				    	<label for="email" class="col-sm-2 control-label">真实姓名</label>
				    	<div class="col-sm-10">
				      	<input type="realname" class="form-control" id="realname" name="realname" value={{realname}}>
				    	</div>
				  	</div>
				   	<div class="form-group">
				    	<label for="telephone" class="col-sm-2 control-label">电话号码</label>
				    	<div class="col-sm-10">
				      		<input type="text" class="form-control" id="telephone" name="telephone" value="{{telephone}}">
				    	</div>
				  	</div>
				</form>
			</div>
		</div>
		<div class="row" style="height:50px;"></div>
	</script>
	<script>
		function getUrlParam(name) {
	            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
	            var r = window.location.search.substr(1).match(reg); 
	            if (r != null) 
	            	return unescape(r[2]); 
	            return null; 
	    }
	    function getContextPath() {
	      var pathName = document.location.pathname;
	      var index = pathName.substr(1).indexOf("/");
	      var result = pathName.substr(0, index + 1);
	      return result;
	    }
	    function list(){
	    	var url=getContextPath()+"/UserServlet?type=getStudentById"
			$.get(url,function(data){
				var tpl   =  $("#tpl1").html();
				var template = Handlebars.compile(tpl);
				var tr = template(data);
				$("#private_table").html(tr);
			},'json');
		}
	   function editPass(){
			var url=getContextPath()+"/UserServlet?type=updatePassword"
			$.post(url,$('#pass').serialize(),function(data){
				layer.msg(data.message);
			},'json');
			$('#myModal2').modal('hide');
			list();
		}
		function editPrivate(){
			var url=getContextPath()+"/UserServlet?type=getStudentById"
			$.get(url,function(data){
				var tpl   =  $("#tpl2").html();
				var template = Handlebars.compile(tpl);
				var tr = template(data);
				$("#update").html(tr);
			},'json');
		}
		function editCon(){
			var url=getContextPath()+"/UserServlet?type=update"
			$.post(url,$('#pri').serialize(),function(data){
				layer.msg(data.message);
			},'json');
			$('#myModal1').modal('hide');
			window.location.reload();
		}
		
		$(function(){

			list();
		});
		

	</script>
</html>
