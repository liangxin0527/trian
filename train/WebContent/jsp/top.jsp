<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
  <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  <script src="${pageContext.request.contextPath}/js/dialog/layer.js"></script>
  <script src="${pageContext.request.contextPath}/js/login.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.twbsPagination.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/js/handlebars-v4.0.12.js"></script>
  <script>
  	function searchC(){
		var coursename=$('#coursename').val();
		window.location.href="${pageContext.request.contextPath}/jsp/search_courses.jsp?s="+encodeURI(encodeURI(coursename));
	}
	$(function(){

		$.get("${pageContext.request.contextPath}/CategoryServlet?type=findAllAjax",function(data){
			
			var $ul=$("#menuId");
			$(data).each(function(){
				$ul.append($("<li><a href='${pageContext.request.contextPath}/jsp/category_courses.jsp?cid="+this.id+"'>"+this.name+"</a></li>"));
			});
		},"json");
	});
</script>
</head>
<body>
<nav class="navbar navbar-default">
		  <div class="container">
		    <div class="navbar-header">
		      <a class="navbar-brand" href="#">
		        <img width=40px height=40px alt="Brand" src="${pageContext.request.contextPath}/img/logo.png">
		      </a>
		    </div>
		    <ul id="menuId" class="nav navbar-nav">
			<li><a href="${pageContext.request.contextPath}/jsp/index.jsp">首页</a></li>		
			</ul>
			<div class="navbar-form navbar-left">
			  <div class="form-group">
			    <input type="text" id="coursename" class="form-control" placeholder="课程名称">
			  </div>
			  <button class="btn btn-default" onclick="searchC()">搜索</button>
			</div>
			<c:if test="${empty student }">
			<button type="button" class="btn btn-default navbar-btn navbar-right" onclick="loginOpen()">
				登录
			</button>
			<button type="button" class="btn btn-default navbar-btn navbar-right" onclick="loginRegister()">
				注册
			</button>
			</c:if>
			<c:if test="${not empty student }">
			<div class="btn-group">
			<button type="button" class="btn btn-default dropdown-toggle navbar-btn navbar-right" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
			${student.username }<span class="caret"></span>
			</button>
			<ul class="dropdown-menu">
			<li><a href="${pageContext.request.contextPath}/jsp/user_info.jsp">个人中心</a></li>
			<li role="separator" class="divider"></li>
			<li><a href="${pageContext.request.contextPath}/jsp/my_selects.jsp">我的选课</a></li>
			<li role="separator" class="divider"></li>
			<li><a href="${pageContext.request.contextPath}/UserServlet?type=logout">安全退出</a></li>
			</ul>
			</div>
			</c:if>
		  </div>
	</nav>
	
	</body>
</html>