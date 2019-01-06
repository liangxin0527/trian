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
		<div class="row">
			<div class="col-lg-7  col-md-6 col-sm-4">
				<div class="slider">
				  <ul>
				    <li><a href="#"><img src="${pageContext.request.contextPath}/img/11.jpg" alt=""></a></li>
				    <li><a href="#"><img src="${pageContext.request.contextPath}/img/12.jpg" alt=""></a></li>
				    <li><a href="#"><img src="${pageContext.request.contextPath}/img/13.jpg" alt=""></a></li>
				  </ul>
				  <!--箭头-->
				  <div class="arrow">
				    <span class="arrow-left">&lt;</span>
				    <span class="arrow-right">&gt;</span>
				  </div>
				</div>
			</div>
			<div class="col-lg-5">
				
					<div class="knowcon_right innr">
						<div class="nows_con">
	<h2>最新动态<span>ITCAST</span><a href="http://www.itcast.cn/newsvideo/newslist.html" rel="nofollow" target="_blank">查看更多&gt;&gt;</a></h2>
	<ul id="news">
	</ul>
</div>
</div>
			</div>
	   </div>
		 <div class="row">
		 	<img src="${pageContext.request.contextPath}/img/shizhan.png"/>
		 </div>
		 
		  <div class="row" id="weight">

		  </div>
		  <div class="row">
		 	<img src="${pageContext.request.contextPath}/img/xinshang.png"/>
		 </div>
		 <div class="row" id="new">
		  </div>
		   <div class="row">
		 	<img src="${pageContext.request.contextPath}/img/foot.png"/>
		 </div>
	</div>
	<script id="tpl" type="text/x-handlebars-template"> 
	{{#each this}}
	<a href="${pageContext.request.contextPath}/jsp/course_info.jsp?id={{id}}">
	<div class="col-lg-3  col-md-4 col-sm-6 info"  style="cursor:pointer;">
		    <div class="thumbnail" style="height:240px">
		      <img height="135" width="240" src="${pageContext.request.contextPath}/{{picture}}">
		      <div class="caption">
		        <h3 style="font-size: 16px;color: #07111B;line-height: 4px;" >{{name}}</h3>
		        <p sytle="font-size: 12px;color: #4D555D;line-height: 20px;">￥{{price}}</p>
		      </div>
 			</div>	
	</div>
	{{/each}}
	</script>
	<script id="tp2" type="text/x-handlebars-template"> 
	{{#each this}}
		<li class="red f1 clears"><a href="${pageContext.request.contextPath}/NewsServlet?type=getOne&id={{id}}" rel="nofollow" target="_blank"><b>{{@index}}</b></a>
		<p><a href="${pageContext.request.contextPath}/NewsServlet?type=getOne&id={{id}}" target="_blank">{{title}}</a></p>
		</li>
	{{/each}}
	</script>    
     <script>
	  $(function () {  
	    var count = 0;  
	    $(".arrow-right").click(function () {
	      count++;
	      if(count == $(".slider li").length){
	        count = 0;
	      }
	      console.log(count);
	      $(".slider li").eq(count).fadeIn().siblings("li").fadeOut();
	    });
	    $(".arrow-left").click(function () {
	      count--;
	      if(count == -1){
	        count = $(".slider li").length - 1;
	      }
	      $(".slider li").eq(count).fadeIn().siblings("li").fadeOut();
	    });
	    
	    $.get('${pageContext.request.contextPath}/CourseServlet?type=findWeight',function(data){
	    	
				var tpl=$("#tpl").html();
				var template = Handlebars.compile(tpl);
				$("#weight").html(template(data));
				
			},"json");
	    
	    $.get('${pageContext.request.contextPath}/CourseServlet?type=findNew',function(data){
	    	
				var tpl=$("#tpl").html();
				var template = Handlebars.compile(tpl);
				$("#new").html(template(data));
				
			},"json");
	    $.get('${pageContext.request.contextPath}/NewsServlet?type=findFive',function(data){
	    	
				var tpl=$("#tp2").html();
				var template = Handlebars.compile(tpl);
				$("#news").html(template(data));
				
			},"json");
	  });
	  
	</script>
</body>
</html>