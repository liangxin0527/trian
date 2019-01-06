<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  <script>
    function getContextPath() {
      var pathName = document.location.pathname;
      var index = pathName.substr(1).indexOf("/");
      var result = pathName.substr(0, index + 1);
      return result;
    }
	$(function(){
		$.get("${pageContext.request.contextPath}/CategoryServlet?type=findAllAjax",function(data){
			
			var $category=$("#category_name");
  			$(data).each(function(){
  				$category.append("<option value='"+this.name+"'>"+this.name+"</option>")
  			});
		  },"json");

	});
</script>
</head>
<body>
	 <div class="main">
    	<jsp:include page="/admin/top.jsp"></jsp:include>
    <div class="container-fluid">
      <div class="page-title">
        <h1>编辑课程</h1>
        <a href="${pageContext.request.contextPath}/admin/course/list.jsp" class="btn btn-primary btn-xs">返回课程列表</a>
      </div>
      <div class="row">
     <form action="${pageContext.request.contextPath}/CourseServlet?type=edit" method="post" enctype="multipart/form-data">
      	<div class="col-md-8">
      	<input id="id" name="id" type="hidden" value="${edit.id}">
      	<div class="form-group">
            <label for="name">课程名称</label>
            <input id="name" class="form-control" name="name" type="text" value="${edit.name}">
        </div>
      	<div class="form-group">
            <label for="brief">简介</label>
            <textarea id="brief" class="form-control input-lg" name="brief" cols="30" rows="10">${edit.brief}</textarea>
        </div>
        <div class="form-group">
            <button class="btn btn-primary" type="submit" onclick="submit()">更改</button>
          </div>
      	</div>
        <div class="col-md-4">
          
          <div class="form-group">
            <label for="category_name">分类</label>
            <select id="category_name" class="form-control" name="category_name">
              
            </select>
          </div>
          <div class="form-group">
            <label for="price">价格</label>
            <input id="price" class="form-control" name="price" type="text" value="${edit.price}">
          </div>
           <div class="form-group">
            <label for="picture">图片</label>
            <input id="picture" class="form-control" name="picture" type="file" >
          </div>
           <div class="form-group">
            <label for="weight">权重<strong>（0表示最低权重，向上递增权重越大）</strong></label>
            <input id="weight" class="form-control" name="weight" type="text" value="${edit.weight}">
          </div>
        </div>
       </form> 	
    </div>
    </div>
  </div>
  
  <jsp:include page="/admin/left.jsp"></jsp:include>
</body>
</html>