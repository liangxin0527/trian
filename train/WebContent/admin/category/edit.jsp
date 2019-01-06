<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
<div class="main">
   <jsp:include page="/admin/top.jsp"></jsp:include>
    <div class="container-fluid">
      <div class="page-title">
        <h1>编辑分类</h1>
      </div>
      <div class="row">
       	
        <div class="col-md-4">
          <form action="${pageContext.request.contextPath}/CategoryServlet?type=edit" method="post">
          <input type="hidden" name="id" value="${edit.id }">
            <h2>编辑分类</h2>
            <div class="form-group">
              <label for="name">名称</label>
              <input id="name" class="form-control" name="name" type="text" value="${edit.name}">
            </div>
            <div class="form-group">
              <button class="btn btn-primary" type="submit">更改</button>
            </div>
          </form>
        </div>
        
       </div>
     </div>
</div>

  <jsp:include page="/admin/left.jsp"></jsp:include>
</body>
</html>