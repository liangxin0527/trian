<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/handlebars-v4.0.12.js"></script>
	<script src="${pageContext.request.contextPath}/js/dialog/layer.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/login.js"></script>
</head>
<body>
	
	<jsp:include page="/jsp/top.jsp"></jsp:include>
	<div class="container-fluid">
		<div id="course" class="row" style="width: 100%;height: 475px;background:url(${pageContext.request.contextPath}/img/info.jpg) no-repeat -190px 5px;text-align: center;">

		</div>
		<div id="select" class="row" >
			<!-- <div class="alert alert-warning" role="alert" style="width:500px; text-align: center;margin: 100px auto;color: #f04646;font-size: 20px;">当前课程未目前未开设任何培训班，敬请期待哦！
			</div> -->
		</div>
	</div>
	<div class="row">
		<img src="${pageContext.request.contextPath}/img/foot.png"/>
	</div>
	<script id="tpl1" type="text/x-handlebars-template">
		{{#each this}}
		<h1 style="font-size: 40px; color: #fff;text-shadow: 0 2px 4px rgba(28,31,33,.6);margin-top:100px">{{name}}</h1>
		<div style="width:470px;height:170px;font-size: 16px;color: rgba(28,31,33,.6);margin:50px auto 0 auto">{{brief}}</div>
		<div style="margin:0 auto;font-size: 24px;color: #f20d0d;" >￥{{price}}.00</div>
		{{/each}}
	</script>
	<script id="tpl2" type="text/x-handlebars-template">
	<table class="table table-striped table-bordered table-hover" style="margin: 100px auto;">
		<thead>
        <th class="text-center" width=500px>培训班名称</th>
        <th class="text-center" width=200px>教师名字</th>
        <th class="text-center" width=180px>开始时间</th>
        <th class="text-center" width=180px>结束时间</th>
        <th class="text-center" width=150px>地址</th>
        <th class="text-center" width=200px>开设季度</th>
        <th class="text-center" width=300px>选课</th>
		</thead>
		<tbody>
			{{#each this }}
			<tr>
			<th class="text-center" width=500px>{{name}}</th>
	        <th class="text-center" width=200px>{{tname}}</th>
	        <th class="text-center" width=180px>{{starttime}}</th>
	        <th class="text-center" width=180px>{{endtime}}</th>
	        <th class="text-center" width=150px>{{address}}</th>
	        <th class="text-center" width=200px>{{season}}</th>
	        {{#if name}}
	        {{#compare onsale 1}}
	        	<th class="text-center" width=300px>
					<button type="button" class="btn btn-primary" onclick="enroll({{id}})">选课</button>
				</th>
	        {{else}}
	        	<th class="text-center" width=200px>敬请期待</th>
	        {{/compare}}
	        {{/if}}
	        {{/each}}
			</tr>
		</tbody>
	</table>
	</script>
	<script>
		Handlebars.registerHelper("compare",function(v1,v2,options){
	      if(v1==v2){
	        return options.fn(this);
	      }else{
	        return options.inverse(this);
	      }
    	});
	 function getContextPath() {
	      var pathName = document.location.pathname;
	      var index = pathName.substr(1).indexOf("/");
	      var result = pathName.substr(0, index + 1);
	      return result;
	    }
    function getUrlParam(name) {
       var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
       var r = window.location.search.substr(1).match(reg); 
       if (r != null) 
       	return unescape(r[2]); 
       return null; 
   	}
   	function enroll(id){
   		layer.open({
	        content : '您确定选这门课?',
	        icon : 1,
	        yes : function(){
	        	var url=getContextPath()+"/SelectServlet?type=add";
				$.get(url,{id :id},function(data){
					if(data.status==1){
						layer.open({
				            content : data.message+"，可到我的选课支付",
				            icon:3,
				            btn : ['确定'],
			        	});
					}else{
						loginOpen();
					}
				},'json');
	        },
		});
	}
	$(function(){
		var id=getUrlParam('id');
		var url=getContextPath()+"/ClassServlet?type=getById"
		$.get(url,{'id':id},function(data){
			var tpl1=$("#tpl1").html();
			var template = Handlebars.compile(tpl1);
			$("#course").html(template(data.course));
			if(data.classes==null){
				$('#select').append("666");
			}else{
				var tpl2=$("#tpl2").html();
				var template = Handlebars.compile(tpl2);
				$("#select").html(template(data.classes));
			}
		},'json')

		
	});
	</script>
</body>
</html>