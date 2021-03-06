<%@ page language="java" contentType="text/html; char+-set=UTF-8"
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
   
</script>
</head>
<body>
	 <div class="main">
    	<jsp:include page="/admin/top.jsp"></jsp:include>
    <div class="container-fluid">
      <div class="page-title">
        <h1>编辑培训师</h1>
        <a href="${pageContext.request.contextPath}/UserServlet?type=findTeachers" class="btn btn-primary btn-xs">返回培训师列表</a>
      </div>
      <div class="row">
      	<div class="col-md-8">
      	<form action="${pageContext.request.contextPath}/UserServlet?type=editTeacher&id=${teacher.id}" method="post">
      	<div class="form-group">
            <label for="username">用户名</label>
            <input id="username" class="form-control" name="username" type="text" value="${teacher.username}">
          </div>
          <div class="form-group">
            <label for="realname">真实姓名</label>
            <input id="realname" class="form-control" name="realname" type="text" value="${teacher.realname}">
          </div>
           <div class="form-group">
            <label for="telephone">电话</label>
            <input id="telephone" class="form-control" name="telephone" type="text" value="${teacher.telephone}">
          </div>
           <div class="form-group">
            <label for="brief">简介</label>
            <input id="brief" class="form-control" name="brief" type="text" value="${teacher.brief }">
          </div>
          <div class="form-group">
            <button class="btn btn-primary" type="submit" onclick="submit()">更改</button>
          </div>
          </form>
      	</div>
    </div>
    </div>
  </div>
  
  <jsp:include page="/admin/left.jsp"></jsp:include>
</body>
</html>