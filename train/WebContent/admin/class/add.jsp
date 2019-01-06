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
        <h1>添加培训班</h1>
      </div>
      <form class="row" action="${pageContext.request.contextPath }/ClassServlet?type=add&cid=${add.id}" method="post">
        <div class="col-md-4">
          <div class="form-group">
            <label for="name">培训班名称</label>
            <input id="name" class="form-control" name="name" type="text">
          </div>
           <div class="form-group">
            <label for="cname">课程名称</label>
            <input id="cname" class="form-control" name="cname" type="text" value="${add.name }" readonly="readonly">
          </div>
          <div class="form-group">
            <label for="tname">培训师名字</label>
            <input id="tname" class="form-control" name="tname" type="text">
          </div>
          <div class="form-group">
            <label for="starttime">开始时间</label>
            <input id="starttime" class="form-control" name="starttime" type="date">
          </div>
           <div class="form-group">
            <label for="endtime">结束时间</label>
            <input id="endtime" class="form-control" name="endtime" type="date" >
          </div>
          <div class="form-group">
            <button class="btn btn-primary" type="submit">保存</button>
          </div>
        </div>
        <div class="col-md-4">
        	 <div class="form-group">
            <label for="address">地址</label>
            <input id="teacher" class="form-control" name="address" type="text">
          </div>
        	 <div class="form-group">
            <label for="status"></label>
            <div class="alert alert-danger">
		        <strong>季度格式:XXXX年春/夏/秋季</strong>
		      </div>
            <label for="season">季度</label>
            <input id="season" class="form-control" name="season" type="text">
          </div>
           <div class="form-group">
            <label for="onsale">是否为当前季度开设的培训班</label>
            <select id="onsale" class="form-control" name="onsale">
              <option value="1">是</option>
              <option value="0">否</option>
            </select>
          </div>
        </div>
      </form>
    </div>
  </div>
  
  <jsp:include page="/admin/left.jsp"></jsp:include>
</body>
</html>