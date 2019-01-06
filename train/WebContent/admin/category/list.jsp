<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <script>
    function check(id){
      layer.open({
            content : "你确定删除吗?",
            icon:3,
            btn : ['是','否'],
            yes : function(){
                location.href="${pageContext.request.contextPath}/CategoryServlet?type=delete&id="+id;
            },
        })
    }
  </script>
</head>
<body>
<div class="main">
   <jsp:include page="/admin/top.jsp"></jsp:include>
    <div class="container-fluid">
      <div class="page-title">
        <h1>分类目录</h1>
      </div>
      <div class="row">
      
        <div class="col-md-4">
          <form action="${pageContext.request.contextPath}/CategoryServlet?type=add" method="post">
            <h2>添加新分类目录</h2>
            <div class="form-group">
              <label for="name">名称</label>
              <input id="name" class="form-control" name="name" type="text" placeholder="分类名称">
            </div>
            <div class="form-group">
              <button class="btn btn-primary" type="submit">添加</button>
            </div>
          </form>
        </div>
        
        <div class="col-md-8">
          <div class="page-action">
            <!-- show when multiple checked -->
            <a class="btn btn-danger btn-sm" href="javascript:;" style="display: none">批量删除</a>
          </div>
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width="400">名称</th>
                <th class="text-center">操作</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${categories}" var="c">
	              <tr>
	                <td class="text-center">${c.name }</td>
	                <td class="text-center">
	                  <a href="${pageContext.request.contextPath}/CategoryServlet?type=getById&id=${c.id}" class="btn btn-info btn-xs">编辑</a>
	                  <a href="javacript:void(0);" class="btn btn-danger btn-xs" onclick="check(${c.id})">删除</a>
	                </td>
	              </tr>
              </c:forEach>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

  <jsp:include page="/admin/left.jsp"></jsp:include>
</body>
</html>