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
        <h1>班级学生</h1>
        <a href="${pageContext.request.contextPath}/admin/teacher/class_list.jsp" class="btn btn-primary btn-xs">返回班级列表</a>
      </div>
      <div class="page-action">
			 <ul class="pagination pagination-sm pull-right"></ul>
	    </div>
      <div class="row">  
        <div class="col-md-8">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width=200px>学号</th>
                <th class="text-center" width=100px>姓名</th>
                <th class="text-center" width=100px>成绩</th>
              </tr>
            </thead>
            <tbody>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
  <jsp:include page="/admin/left.jsp"></jsp:include>
  <script id="tpl" type="text/x-jsrender">
	    {{for selects}}
		<tr>
        <th class="text-center" width=200px>{{:studentId}}</th>
        <th class="text-center" width=100px>{{:studentName}}</th>
        <th class="text-center" width=100px>{{:score}}</th>
		<tr>
      {{/for}}
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
  $(function(){

      var cid=getUrlParam('cid');
      var $pagination = $(".pagination");
      var currPage=1;
      var url=getContextPath()+"/SelectServlet?type=findClassByPage&cid="+cid;
      function loadData(page){
        $.get(url,{'currPage':page},function(data){

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
          var html = $('#tpl').render({ selects: data[0]});
          $('tbody').html(html).fadeIn();
          currPage=page;

        },'json');
      }
      loadData(currPage);
     
  });
  </script>
</body>
</html>