<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
  <title>Slides &laquo; Admin</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin.css">
  <script src="${pageContext.request.contextPath}/js/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  <script src="${pageContext.request.contextPath}/js/dialog/layer.js"></script>
  <script src="${pageContext.request.contextPath}/js/jquery.twbsPagination.js"></script>
   <script src="${pageContext.request.contextPath}/js/jsrender.js"></script>
</head>
<body>
	
  <div class="aside">
    <div class="profile">
      <img class="avatar" src="${pageContext.request.contextPath}/img/admin.png">
      <h3 class="name">DGUT培训机构后台系统</h3>
    </div>
    <ul class="nav">
      <c:if test="${ not empty admin}">
      <li>
        <a href="${pageContext.request.contextPath}/admin/index.jsp"><i class="fa fa-dashboard"></i>仪表盘</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/CategoryServlet?type=findAll"><i class="fa fa-users"></i>课程分类管理</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/admin/course/list.jsp"><i class="fa fa-users"></i>课程管理</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/admin/class/list.jsp">
        <i class="fa fa-users"></i>培训班管理</a>
      </li>
      <li>
        <a href="${pageContext.request.contextPath}/admin/select/list.jsp"><i class="fa fa-users"></i>选课管理</a>
      </li>
      <li><a href="${pageContext.request.contextPath}/UserServlet?type=findAdmins"><i class="fa fa-users"></i>管理员列表</a></li>
      <li><a href="${pageContext.request.contextPath}/UserServlet?type=findTeachers"><i class="fa fa-users"></i>培训师列表</a></li>
      <li><a href="${pageContext.request.contextPath}/UserServlet?type=findStudents"><i class="fa fa-users"></i>学员列表</a></li>
      <li>
        <a href="${pageContext.request.contextPath}/admin/news/list.jsp"><i class="fa fa-users"></i>新闻管理</a>
      </li>
      </c:if>
      <c:if test="${ not empty teacher}">
      	<li>
        <a href="${pageContext.request.contextPath}/admin/teacher/class_list.jsp"><i class="fa fa-users"></i>我的班级</a>
      </li>
      </c:if>
    </ul>
  </div>

</body>
</html>
