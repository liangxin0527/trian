<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/index.css">
	<script src="${pageContext.request.contextPath}/js/jquery.js"></script>
</head>
<body>
	
	<jsp:include page="/jsp/top.jsp"></jsp:include>
	<div class="container">
		<div id="courses"></div>
		<div class="page-action">
			 <ul class="pagination pagination-sm pull-right"></ul>
	    </div>
		<div class="row">
		 	<img style="width: 1170px;" src="${pageContext.request.contextPath}/img/foot.png"/>
		</div>
	</div>
	<script id="tpl" type="text/x-handlebars-template"> 
	{{#each this}}
	<a href="${pageContext.request.contextPath}/jsp/course_info.jsp?id={{id}}">
	<div class="col-lg-3  col-md-4 col-sm-6 info"  style="cursor:pointer;">
		    <div class="thumbnail" style="height:240px">
		      <img height="135" width="240" style="height: 150px;" src="${pageContext.request.contextPath}/{{picture}}">
		      <div class="caption">
		        <h3 style="font-size: 16px;color: #07111B;line-height: 4px;" >{{name}}</h3>
		        <p sytle="font-size: 12px;color: #4D555D;line-height: 20px;">￥{{price}}</p>
		      </div>
 			</div>	
	</div>
	{{/each}}
	</script>  
     <script>
	 function getContextPath() {
      var pathName = document.location.pathname;
      var index = pathName.substr(1).indexOf("/");
      var result = pathName.substr(0, index + 1);
      return result;
    }
    function getUrlParam(name) {
        var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); 
        var r = window.location.search.substr(1).match(reg); 
        if (r != null) 
          return unescape(r[2]); 
      return null; 
    }
    function getHsonLength(json){
        var jsonLength=0;
        for (var i in json) {
            jsonLength++;
        }
        return jsonLength;
    }
  $(function(){
  	  var s = decodeURI(getUrlParam("s"));
      var $pagination = $(".pagination");
      var currPage=1;
      var url=getContextPath()+"/CourseServlet?type=search&s="+s;

      function loadData(page){
        $.get(url,{'currPage':page},function(data){
          if(getHsonLength(data[0])==0){
          	$('#courses').append('<div class="alert alert-danger" role="alert">没有课程"</div>');
          }else{
	          if(currPage>data[1]){
	            loadData(data[1]);
	            return;
	          }

	          $pagination.twbsPagination('destroy');
	          $pagination.twbsPagination({

	                 startPage: page,
	                 totalPages: data[1],
	                 first:"首页",
	                 last: "尾页",
	                 prev:"上一页",
	                 next:"下一页",
	                 visiablePages : 2,
	                 initiateStartPageClick: false,
	                 onPageClick: function (e, page) {
	                   loadData(page);
	               } 
	            });
		        var tpl=$("#tpl").html();
				var template = Handlebars.compile(tpl);
				$("#courses").html(template(data[0]));
		        currPage=page;
		  }
	        },'json');
      }
      loadData(currPage);
      
  });
	  
	</script>
</body>
</html>