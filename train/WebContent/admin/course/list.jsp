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
        <h1>所有课程</h1>
        <a href="${pageContext.request.contextPath}/admin/course/add.jsp" class="btn btn-primary btn-xs">添加课程</a>
      </div>
       <div class="page-action">
			 <ul class="pagination pagination-sm pull-right"></ul>
	    </div>
      <div class="row">  
        <div class="col-md-12">
          <table class="table table-striped table-bordered table-hover">
            <thead>
              <tr>
                <th class="text-center" width=500px>名称</th>
                <th class="text-center" width=200px>分类名称</th>
                <th class="text-center" width=150px>价格</th>
                <th class="text-center" width=500px>描述</th>
                <th class="text-center" width=200px>图片</th>
                <th class="text-center" width=150px>权重</th>
                <th class="text-center" width=200px>是否上架</th>
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
      <tr data-id={{: id }}>
        <th class="text-center" width=500px>{{:name }}</td>
        <th class="text-center" width=200px>{{:category_name }}</td>
        <th class="text-center" width=150px>{{:price }}</td>
        <th class="text-center" width=500px>课程简介详情</td>
        <th class="text-center" width=200px><img width="80px" height="80px" src="${pageContext.request.contextPath}/{{:picture }}"/></td>
        <th class="text-center" width=150px>{{:weight }}</td>
        {{if onsale=='0'}}
        <th class="text-center" width=200px>
        <button type="button" class="btn btn-default btn-xs onSale" data-onsale={{:onsale}}>上架</button>
        </td>
        {{/if}}
       	{{if onsale=='1'}}
         <th class="text-center" width=200px>
        <button type="button" class="btn btn-default btn-xs onSale" data-onsale={{:onsale}}>下架</button>
        </td>
        {{/if}}
        <th class="text-center" width=300px>
          <a href="${pageContext.request.contextPath}/CourseServlet?type=getById&id={{:id}}" class="btn btn-info btn-xs">编辑</a>
          {{if open=='0'}}	 
          <a href="javascript:void(0)" class="btn btn-danger btn-xs btn-delete">删除</a>
          {{/if}}
          <a href="${pageContext.request.contextPath}/CourseServlet?type=getByIdToAdd&id={{:id}}" class="btn btn-success btn-xs">开设课程</a>
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
    function onSale(onsale){
      var url=getContextPath()+"/CourseServlet?type=changeSale&onsale="+onsale;
      $.get(url,function(data){

      });
    }
  $(function(){

      var $pagination = $(".pagination");
      var currPage=1;
      var url=getContextPath()+"/CourseServlet?type=findAllByPage"
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
                 visiablePages : 2,
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

      $('tbody').on('click','.btn-delete',function(){
        var tr=$(this).parent().parent();
        var id=parseInt(tr.data('id'));
        var url=getContextPath()+"/CourseServlet?type=delete";
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
    $('tbody').on('click','.onSale',function(){
        var onsale=$(this).data('onsale');
        var id=$(this).parent().parent().data('id');
        var url=getContextPath()+"/CourseServlet?type=changeSale";
        $.get(url,{'id':id,'onsale':onsale},function(data){
            loadData(currPage);
        },'json');
      });
  });
  </script>
</body>
</html>