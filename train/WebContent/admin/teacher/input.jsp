<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript">
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
        var r = window.location.search.substr(1).match(reg); 
        if (r != null) 
          return unescape(r[2]); 
      return null; 
    }
    function bodyInit() {
        if('${excleMessage}') {
            alert('${excleMessage}');
        }
    }
 </script>
</head>
<body onload="bodyInit();">
<div class="main">
   <jsp:include page="/admin/top.jsp"></jsp:include>
    <div class="container-fluid">
        <h1>录入成绩</h1>
      
      <div class="row">  
        <div class="col-md-6">
          <form  method="post" enctype="multipart/form-data" action="${pageContext.request.contextPath }/SelectServlet?type=input">
			       <div class="form-group">
              <div class="col-sm-10">
                  <input name="excel" type="file" class="form-control" >
              </div>
              </div>
               <div class="form-group">
            		<button class="btn btn-primary" type="submit">上传</button>
          		</div>
		      </form>
        </div>
      </div>
      <div class="row">
        <div class="alert alert-danger" role="alert">请按学号，姓名，理论成绩，实践成绩作为表头的第一行上传一个excel文件</div>
      </div>
    </div>
  </div>

  <jsp:include page="/admin/left.jsp"></jsp:include>
</body>
</html>