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
	<div class="container" style="text-align: center;">
		<div class="row">
			<h1>${news.title}</h1>
		</div>
		<div class="row">
			${news.createdtime}
		</div>
		<div class="row">
			<div class="col-lg-3"></div>
			<div class="col-lg-6">${news.content}</div>
			<div class="col-lg-4"></div>
		</div>
		 <div class="row">
		 	<img style="width: 1170px;" src="${pageContext.request.contextPath}/img/foot.png"/>
		 </div>
	</div>
	
</body>
</html>