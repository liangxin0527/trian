package com.dgut.trian.servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

import com.dgut.trian.bean.Admin;
import com.dgut.trian.bean.News;
import com.dgut.trian.bean.Student;
import com.dgut.trian.bean.Teacher;

import com.dgut.trian.service.UserService;
import com.dgut.trian.utils.JsonUtil;
import com.dgut.trian.utils.MD5Utils;
import com.dgut.trian.utils.Message;




@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type="index";
		type=request.getParameter("type");
		UserService userService=new UserService();
		Message message=new Message();
		try {
			if(type.equals("studentLogin")) {
				Student student=new Student();
				student.setUsername(request.getParameter("username"));
				student.setPassword(MD5Utils.md5(request.getParameter("password")));
				int result=userService.studentLogin(student);
				message.setStatus(result);
				if(result==1) {
					student.setPassword(null);
					request.getSession().setAttribute("student", student);
					message.setMessage("登录成功");
				}else if(result==0) {
					message.setMessage("用户名和密码不匹配");
				}
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("teacherLogin")){
				Teacher teacher=new Teacher();
				teacher.setUsername(request.getParameter("username"));
				teacher.setPassword(MD5Utils.md5(request.getParameter("password")));
				int result=userService.teacherLogin(teacher);
				message.setStatus(result);
				if(result==1) {
					teacher.setPassword(null);
					request.getSession().setAttribute("teacher", teacher);
					message.setMessage("登录成功");
				}else if(result==0) {
					message.setMessage("用户名和密码不匹配");
				}
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("adminLogin")){
				Admin admin=new Admin();
				admin.setUsername(request.getParameter("username"));
				admin.setPassword(MD5Utils.md5(request.getParameter("password")));
				int result=userService.adminLogin(admin);
				message.setStatus(result);
				if(result==1) {
					admin.setPassword(null);
					request.getSession().setAttribute("admin", admin);
					message.setMessage("登录成功");
				}else if(result==0) {
					message.setMessage("用户名和密码不匹配");
				}
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("register")) {
				Student student = new Student(); 		
				BeanUtils.populate(student, request.getParameterMap());		
				student.setPassword(MD5Utils.md5(student.getPassword()));
				student.setId(System.currentTimeMillis());
				int result=userService.register(student);
				message.setStatus(result);
				if(result==1) {
					message.setMessage("注册成功");
				}else if(result==0) {
					message.setMessage("注册失败");
				}
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("getStudentById")) {
				Student student1=(Student)request.getSession().getAttribute("student");
				Student student2=userService.getStudentByUsername(student1.getUsername());
				student2.setPassword(null);
				String json=JsonUtil.objectjson(student2);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("update")) {
				Student student=(Student)request.getSession().getAttribute("student");
				Long id=userService.getIdByUsername(student.getUsername());
				student.setId(id);
				String username=request.getParameter("username");
				String realname=request.getParameter("realname");
				String telephone=request.getParameter("telephone");
				student.setUsername(username);
				student.setRealname(realname);
				student.setTelephone(telephone);
				int result=userService.update(student);
				message.setStatus(result);
				if(result==1) {
					message.setMessage("更改成功");
				}else if(result==0) {
					message.setMessage("更改失败");
				}
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("updatePassword")) {
				Student student=(Student)request.getSession().getAttribute("student");
				Long id=userService.getIdByUsername(student.getUsername());
				String oldPassword=request.getParameter("oldPassword");
				String password=request.getParameter("password");
				oldPassword=MD5Utils.md5(oldPassword);
				password=MD5Utils.md5(password);
				int result=userService.changePassword(id,oldPassword,password);
				message.setStatus(result);
				
				if(result==0){
					message.setMessage("原密码错误");
				}
				else{
					message.setMessage("密码修改成功");
				}
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("logout")) {
				HttpSession session=request.getSession();
				session.removeAttribute("username");
				session.invalidate();
				request.getRequestDispatcher("/jsp/index.jsp").forward(request, response);
			}else if(type.equals("updateTeacherPassword")) {
				Teacher teacher=(Teacher)request.getSession().getAttribute("teacher");
				int id=userService.getIdByTachername(teacher.getUsername());
				String oldPassword=MD5Utils.md5(request.getParameter("oldPassword"));
				String password=MD5Utils.md5(request.getParameter("password"));
				int result=userService.changeTeacherPassword(id,oldPassword,password);
				message.setStatus(result);
				
				if(result==0){
					message.setMessage("原密码错误");
				}
				else{
					message.setMessage("密码修改成功");
				}
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("findStudents")) {
				List<Student> students=userService.findStudents();
				request.setAttribute("students", students);
				request.getRequestDispatcher("/admin/user/student.jsp").forward(request, response);
			}
			else if(type.equals("findTeachers")) {
				List<Teacher> teachers=userService.findTeachers();
				request.setAttribute("teachers", teachers);
				request.getRequestDispatcher("/admin/user/teacher.jsp").forward(request, response);
			}else if(type.equals("findAdmins")) {
				List<Admin> admins=userService.findAdmins();
				request.setAttribute("admins", admins);
				request.getRequestDispatcher("/admin/user/admin.jsp").forward(request, response);
			}else if(type.equals("addTeacher")) {
				Teacher teacher=new Teacher();
				teacher.setUsername(request.getParameter("username"));
				teacher.setPassword(MD5Utils.md5(request.getParameter("password")));
				teacher.setRealname(request.getParameter("realname"));
				teacher.setTelephone(request.getParameter("telephone"));
				teacher.setBrief(request.getParameter("brief"));
				userService.addTeacher(teacher);
				request.getRequestDispatcher("/UserServlet?type=findTeachers").forward(request, response);
			}else if(type.equals("addAdmin")) {
				Admin admin=new Admin();
				admin.setUsername(request.getParameter("username"));
				admin.setPassword(MD5Utils.md5(request.getParameter("password")));
				admin.setRealname(request.getParameter("realname"));
				userService.addAdmin(admin);
				request.getRequestDispatcher("/UserServlet?type=findAdmins").forward(request, response);
			}else if(type.equals("deleteAdmin")) {
				int id=Integer.parseInt(request.getParameter("id"));
				userService.deleteAdmin(id);
				request.getRequestDispatcher("/UserServlet?type=findAdmins").forward(request, response);
			}
			else if(type.equals("deleteTeacher")) {
				int id=Integer.parseInt(request.getParameter("id"));
				userService.deleteTeacher(id);
				request.getRequestDispatcher("/UserServlet?type=findTeachers").forward(request, response);
			}else if(type.equals("getOneTeacher")) {
			
				int id=Integer.parseInt(request.getParameter("id"));
				Teacher teacher=userService.getOneTeacher(id);
				request.setAttribute("teacher", teacher);
				request.getRequestDispatcher("/admin/user/edit_teacher.jsp").forward(request, response);
			}else if(type.equals("editTeacher")) {
				Teacher teacher=new Teacher();
				int id=Integer.parseInt(request.getParameter("id"));
				teacher.setUsername(request.getParameter("username"));
				teacher.setTelephone(request.getParameter("telephone"));
				teacher.setRealname(request.getParameter("realname"));
				teacher.setBrief(request.getParameter("brief"));
				userService.editTeacher(teacher,id);
				request.getRequestDispatcher("/UserServlet?type=findTeachers").forward(request, response);
			}
				
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}
