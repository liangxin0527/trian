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
    function getContextPath() {
      var pathName = document.location.pathname;
      var index = pathName.substr(1).indexOf("/");
      var result = pathName.substr(0, index + 1);
      return result;
    }
    function submit(){
    	   var formData = new FormData();
         var title=$("#title").val();
        var content=$("#content").val();
     		  var url=getContextPath()+"/NewsServlet?type=add";
          $.ajax({  
            type : "POST",  
            url : url, 
            data : {'title':title,'content':content},
            async: false,  
            cache: false,
            dataType:'json',
            contentType: false,  
            processData: false,
            success : function(data) {  
            	window.location.href="${pageContext.request.contextPath}/admin/news/list.jsp";
            } 
          });
    }
	$(function(){
		$.get("${pageContext.request.contextPath}/CategoryServlet?type=findAllAjax",function(data){
			
			var $category=$("#category_name");
  			$(data).each(function(){
  				$category.append("<option value='"+this.name+"'>"+this.name+"</option>")
  			});
		  },"json");

	});
</script>
</head>
<body>
	 <div class="main">
    	<jsp:include page="/admin/top.jsp"></jsp:include>
    <div class="container-fluid">
      <div class="page-title">
        <h1>编辑新闻</h1>
        <a href="${pageContext.request.contextPath}/admin/news/list.jsp" class="btn btn-primary btn-xs">返回新闻列表</a>
      </div>
      <div class="row">
      <form action="${pageContext.request.contextPath}/NewsServlet?type=edit&id=${news.id}" method="post">
      	<div class="col-md-8">
      	<div class="form-group">
            <label for="title">标题</label>
            <input id="title" class="form-control" name="title" type="text" value="${news.title }">
          </div>
      		<div class="form-group">
            <label for="content">内容</label>
            <textarea id="content" class="form-control input-lg" name="content" cols="30" rows="15">
            	${news.content}
            </textarea>
           </div>
          <div class="form-group">
            <button class="btn btn-primary" type="submit" onclick="submit()">更改</button>
          </div>
      	</div>
       </form>
        	
    </div>
    </div>
  </div>
  
  <jsp:include page="/admin/left.jsp"></jsp:include>
</body>
</html>