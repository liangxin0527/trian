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
        <h1>我的培训班</h1>
      </div>
        <div class="page-action">
       <ul class="pagination pagination-sm pull-right"></ul>
      </div>
      <div class="row">  
        <div class="col-md-12">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width=300px>培训班名称</th>
                <th class="text-center" width=30px>课程名称</th>
                <th class="text-center" width=180px>开始时间</th>
                <th class="text-center" width=180px>结束时间</th>
                <th class="text-center" width=150px>地址</th>
                <th class="text-center" width=200px>开设季度</th>
                <th class="text-center" width=300px>当前季度是否开设</th>
                <th class="text-center" width=300px>操作</th>
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
   {{for courses}}
      <tr>
        <tr>
          <th class="text-center" width=300px>{{:name }}</td>
          <th class="text-center" width=300px>{{:cname }}</td>
          <th class="text-center" width=180px>{{:starttime}}</td>
          <th class="text-center" width=200px>{{:endtime}}</td>
          <th class="text-center" width=150px>{{:address }}</td>
          <th class="text-center" width=150px>{{:season }}</td>
          <th class="text-center" width=300px>
           {{if onsale==1}}
              是
            {{/if}}
            {{if onsale==0}}
              否
            {{/if}}
          </td>
		<th class="text-center" width=300px>
      {{if input==0}}
      <a href="${pageContext.request.contextPath}/admin/teacher/input.jsp">
       <button type="button" class="btn btn-success btn-xs" onclick="score({{:id}})">录入成绩</button>
     </a>
      {{/if}}
	<a href="${pageContext.request.contextPath}/admin/teacher/student_list.jsp?cid={{:id}}" class="btn btn-primary btn-xs">查看班级</a>
		</td>	
        </tr>
      {{/for}}
   </script>
  <script>
    function getContextPath() {
      var pathName = document.location.pathname;
      var index = pathName.substr(1).indexOf("/");
      var result = pathName.substr(0, index + 1);
      return result;
    }
    function score(id){
      var url=getContextPath()+"/SelectServlet?type=setInput&id="+id;
      $.get(url,function(){

      });
    }
  $(function(){

      var $pagination = $(".pagination");
      var currPage=1;
      var url=getContextPath()+"/ClassServlet?type=findTeacherByPage";
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
                 visiablePages : 3,
                 initiateStartPageClick: false,
                 onPageClick: function (e, page) {
                   loadData(page);
               } 
            });
          var html = $('#tpl').render({ courses: data[0]});
          $('tbody').html(html).fadeIn();
          currPage=page;

        },'json');
      }
      loadData(currPage);

});
      
  </script>
</body>
</html>