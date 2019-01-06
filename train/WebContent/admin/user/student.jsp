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
        <h1>所有学员</h1>
      </div>
       <div class="page-action">
			 <ul class="pagination pagination-sm pull-right"></ul>
	    </div>
      <div class="row">  
        <div class="col-md-10">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width=200px>用户名</th>
                <th class="text-center" width=500px>真实姓名</th>
                <th class="text-center" width=500px>电话</th>
              </tr>
            </thead>
            <tbody>
            	<c:forEach items="${students }" var="s">
	              <tr>
	                <th class="text-center" width=200px>${s.username }</th>
	                <th class="text-center" width=500px>${s.realname }</th>
	                <th class="text-center" width=500px>${s.telephone }</th>
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