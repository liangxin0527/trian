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
        <h1>学员选课</h1>
      </div>
      <div class="page-action">
			<ul class="pagination pagination-sm pull-right"></ul>
	 </div>
      <div class="row">  
        <div class="col-md-12">
          <div class="page-action">
            <!-- show when multiple checked -->
            <a class="btn btn-danger btn-sm" href="javascript:;" style="display: none">批量删除</a>
          </div>
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width="40"><input type="checkbox"></th>
                <th class="text-center" width=200px>学号</th>
                <th class="text-center" width=100px>姓名</th>
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
    </div>
  </div>
  <jsp:include page="/admin/left.jsp"></jsp:include>
  <script id="tpl" type="text/x-jsrender">
	    {{for selects}}
        <th class="text-center" width="40"><input type="checkbox"></th>
        <th class="text-center" width=200px></th>
        <th class="text-center" width=100px>姓名</th>
        <th class="text-center" width=200px>课程名字</th>
        <th class="text-center" width=150px>班级名字</th>
        <th class="text-center" width=200px>地址</th>
        <th class="text-center" width=200px>开始时间</th>
        <th class="text-center" width=150px>结束时间</th>
        <th class="text-center" width=200px>是否支付</th>
        <th class="text-center" width=100px>成绩</th>
      {{/for}}
	 </script>
  <script>
    function getContextPath() {
      var pathName = document.location.pathname;
      var index = pathName.substr(1).indexOf("/");
      var result = pathName.substr(0, index + 1);
      return result;
    }
  $(function(){

      var $pagination = $(".pagination");
      var currPage=1;
      var url=getContextPath()+"SelectServlet?type=findAll"
      function loadData(page){
        $.get(url,function(data){

          if(currPage>data.totalPage){
            loadData(data.totalPage);
            return;
          }

          $pagination.twbsPagination('destroy');
          $pagination.twbsPagination({

                 startPage: page,
                 totalPages: data.totalPage,
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
          var html = $tpl.render({ selects: data.list});
          $('tbody').html(html).fadeIn();
          currentPage=page;

        });
      }
      loadData(currPage);
  });
  </script>
</body>
</html>