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
            content : "你确定删除吗?",
            icon:3,
            btn : ['是','否'],
            yes : function(){
                location.href="${pageContext.request.contextPath}/NewsServlet?type=delete&id="+id;
            },
        })
    }
  </script>
</head>
<body>
<div class="main">
   <jsp:include page="/admin/top.jsp"></jsp:include>
    <div class="container-fluid">
      <div class="page-title">
        <h1>所有新闻</h1>
        <a href="${pageContext.request.contextPath}/admin/news/add.jsp" class="btn btn-primary btn-xs">添加新闻</a>
      </div>
       <div class="page-action">
			 <ul class="pagination pagination-sm pull-right"></ul>
	    </div>
      <div class="row">  
        <div class="col-md-12">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width=200px>标题</th>
                <th class="text-center" width=500px>内容</th>
                <th class="text-center" width=150px>创建时间</th>
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
   {{for news}}
      <tr data-id={{: id }}>
        <th class="text-center" width=500px>{{:title}}</th>
        <th class="text-center" width=200px>{{:content}}</th>
        <th class="text-center" width=150px>{{:createdtime}}</th>
        <th class="text-center" width=300px>
          <a href="${pageContext.request.contextPath}/NewsServlet?type=getNewsById&id={{:id}}" class="btn btn-info btn-xs">编辑</a>
          <a href="javacript:void(0);" class="btn btn-danger btn-xs" onclick="check({{:id}})">删除</a>
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
   
  $(function(){

      var $pagination = $(".pagination");
      var currPage=1;
      var url=getContextPath()+"/NewsServlet?type=findAllByPage"
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
          var html = $('#tpl').render({ news: data[0]});
          $('tbody').html(html).fadeIn();
          currPage=page;

        },'json');
      }

      loadData(currPage);

      $('tbody').on('click','.btn-delete',function(){
        var tr=$(this).parent().parent();
        var id=parseInt(tr.data('id'));
        var url=getContextPath()+"/NewsServlet?type=delete";
        var index =layer.open({
            content : "你确定要删除吗？",
            icon:3,
            btn : ['是','否'],
            yes : function(){
            	$.get(url,{'id':id},function(data){
            		layer.close(index);
            		loadData(currPage);
            	});	
            },
        });
      });

  });
  </script>
</body>
</html>