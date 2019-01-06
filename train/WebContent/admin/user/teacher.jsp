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
                location.href="${pageContext.request.contextPath}/UserServlet?type=deleteTeacher&id="+id;
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
        <h1>所有培训师</h1>
        <a href="${pageContext.request.contextPath}/admin/user/add_teacher.jsp" class="btn btn-primary btn-xs">添加培训师</a>
      </div>
       <div class="page-action">
			 <ul class="pagination pagination-sm pull-right"></ul>
	    </div>
      <div class="row">  
        <div class="col-md-6">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width=200px>用户名</th>
                <th class="text-center" width=500px>真实姓名</th>
                <th class="text-center" width=500px>电话</th>
                <th class="text-center" width=500px>简介</th>
                <th class="text-center" width=500px>操作</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${teachers }" var="t">
	              <tr>
	                <th class="text-center" width=200px>${t.username }</th>
	                <th class="text-center" width=500px>${t.realname }</th>
	                <th class="text-center" width=500px>${t.telephone }</th>
	                 <th class="text-center" width=500px>${t.brief }</th>
                 
                  <th>
                   
                    <a href="${pageContext.request.contextPath}/UserServlet?type=getOneTeacher&id=${t.id}" class="btn btn-info btn-xs" >编辑</a>
                    <a href="javacript:void(0);" class="btn btn-danger btn-xs" onclick="check(${t.id})">删除</a>
                  </th>               
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