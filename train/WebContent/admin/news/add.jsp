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
    
</script>
</head>
<body>
	 <div class="main">
    	<jsp:include page="/admin/top.jsp"></jsp:include>
    <div class="container-fluid">
      <div class="page-title">
        <h1>添加新闻</h1>
        <a href="${pageContext.request.contextPath}/admin/news/list.jsp" class="btn btn-primary btn-xs">返回新闻列表</a>
      </div>
      <form action="${pageContext.request.contextPath}/NewsServlet?type=add" method="post">
      <div class="row">
      	<div class="col-md-8">
      	<div class="form-group">
            <label for="title">标题</label>
            <input id="title" class="form-control" name="title" type="text" placeholder="课程名称">
          </div>
      		<div class="form-group">
            <label for="content">内容</label>
            <textarea id="content" class="form-control input-lg" name="content" cols="30" rows="15" placeholder="简介"></textarea>
           </div>
          <div class="form-group">
            <button class="btn btn-primary" type="submit" onclick="submit()">添加</button>
          </div>
      </div>
       </div>
       </form>
    </div>
  </div>
  
  <jsp:include page="/admin/left.jsp"></jsp:include>
</body>
</html>