<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Slides &laquo; Admin</title>
</head>
<body>
   <div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">修改密码</h4>
                </div>
                <div class="modal-body2">
                  <div class="container"> 
                  <div class="row" style="height:50px;"></div>
                  <div class="row">
                    <div class="col-m-5"></div>
                    <form id="pass" class="form-horizontal col-md-5">
                <div class="form-group">
                  <label for="oldPassword" class="col-sm-2 control-label">原密码</label>
                  <div class="col-sm-10">
                    <input name="oldPassword" type="password" class="form-control" id="oldPassword" placeholder="原密码">
                  </div>
                </div>
                <div class="form-group">
                  <label for="password" class="col-sm-2 control-label">新密码</label>
                  <div class="col-sm-10">
                    <input name="password" type="password" class="form-control" id="password" placeholder="新密码">
                  </div>
                </div>
              </form>
            </div>
            <div class="row" style="height:50px;"></div>
          </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button   type="button" class="btn btn-primary" onclick="editPass()">提交更改</button>
                </div>
            </div>
        </div>
        </div>
	 <nav class="navbar">
      <button class="btn btn-default navbar-btn fa fa-bars"></button>
      <ul class="nav navbar-nav navbar-right">
      	<li class="fa fa-user" style="padding-top: 15px;padding-bottom: 15px;line-height:20px">
      	<c:if test="${not empty teacher }" >
      		登录用户：${teacher.username }
      	</c:if>
      	<c:if test="${not empty admin }">
      		登录用户：${admin.username }
      	</c:if>
      	</li>

        <c:if test="${not empty teacher }" >
      		<li> <a href="javascript:void(0)" id="edit-password" data-toggle="modal" data-target="#myModal2" ><i class="fa fa-user"></i>修改密码</a></li>
      	</c:if>
          
        <li><a href="${pageContext.request.contextPath}/UserServlet?type=logout"	><i class="fa fa-sign-out"></i>退出</a></li>
      </ul>
    </nav>
    <script type="text/javascript">
    function getContextPath() {
	      var pathName = document.location.pathname;
	      var index = pathName.substr(1).indexOf("/");
	      var result = pathName.substr(0, index + 1);
	      return result;
	    }
       function editPass(){
        var url=getContextPath()+"/UserServlet?type=updateTeacherPassword"
        $.post(url,$('#pass').serialize(),function(data){
          layer.msg(data.message);
        },'json');
        $('#myModal2').modal('hide');
      }
    </script>
</body>
</html>