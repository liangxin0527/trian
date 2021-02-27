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
            content : "你确定要支付吗?",
            icon:3,
            btn : ['是','否'],
            yes : function(){
                location.href="${pageContext.request.contextPath}/SelectServlet?type=pay&id="+id;
            },
        })
    }
  </script> 
</head>
<body>
<div class="main">
   <jsp:include page="/jsp/top.jsp"></jsp:include>
    <div class="container">
      <div class="page-action">
			 <ul class="pagination pagination-sm pull-right"></ul>
	    </div>
      <div class="row">  
        <div class="col-md-12">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width=200px>课程名字</th>
                <th class="text-center" width=150px>班级名字</th>
                <th class="text-center" width=200px>地址</th>
                <th class="text-center" width=200px>开始时间</th>
                <th class="text-center" width=150px>结束时间</th>
                <th class="text-center" width=200px>是否支付</th>
                <th class="text-center" width=100px>成绩</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>
      <div class="row">
      <img style="width: 1170px;" src="${pageContext.request.contextPath}/img/foot.png"/>
     </div>
    </div>
  </div>
  <script id="tpl" type="text/x-handlebars-template"> 
	    {{#each this}}
		<tr>
        <th class="text-center" width=200px>{{coursename}}</th>
        <th class="text-center" width=150px>{{classname}}</th>
        <th class="text-center" width=200px>{{address}}</th>
        <th class="text-center" width=200px>{{starttime}}</th>
        <th class="text-center" width=150px>{{endtime}}</th>
         <th class="text-center" width=100px>
  		   {{#if pay}}
            已支付
            {{else}}
               <a href="javascript:void(0)" class="btn btn-info btn-xs pay"  data-pay={{id}}>支付</a>
          {{/if}}
		    </td>
        <th class="text-center" width=100px>{{score}}</th>
		<tr>
      {{/each}}
	 </script>
  <script>
    function getContextPath() {
      var pathName = document.location.pathname;
      var index = pathName.substr(1).indexOf("/");
      var result = pathName.substr(0, index + 1);
      return result;
    }
    function getHsonLength(json){
        var jsonLength=0;
        for (var i in json) {
            jsonLength++;
        }
        return jsonLength;
    }
  $(function(){

      var $pagination = $(".pagination");
      var currPage=1;
      var url=getContextPath()+"/SelectServlet?type=findMySelects"
      function loadData(page){
        $.get(url,{'currPage':page},function(data){
     	  if(getHsonLength(data[0])==0){
             	$('#courses').append('<div class="alert alert-danger" role="alert">您没有选任何课程"</div>');
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
	                 visiablePages : 1,
	                 initiateStartPageClick: false,
	                 onPageClick: function (e, page) {
	                   loadData(page);
	               } 
	            });
	          	var tpl=$("#tpl").html();
      				var template = Handlebars.compile(tpl);
      				$("tbody").html(template(data[0]));
      		        currPage=page;
                }
	    },'json');
      }
      loadData(currPage);
      
      $('tbody').on('click','.pay',function(){
          var id=$(this).data('pay');
          var url=getContextPath()+"/SelectServlet?type=pay";
          $.get(url,{'id':id},function(data){
              loadData(currPage);
          },'json');
        });
  });
  </script>
</body>
</html>