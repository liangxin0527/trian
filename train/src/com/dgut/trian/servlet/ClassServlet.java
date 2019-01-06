package com.dgut.trian.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgut.trian.bean.Class;
import com.dgut.trian.bean.Course;
import com.dgut.trian.bean.Page;
import com.dgut.trian.bean.Teacher;
import com.dgut.trian.constant.Constant;
import com.dgut.trian.dao.UserDao;
import com.dgut.trian.service.ClassService;
import com.dgut.trian.utils.JsonUtil;
import com.dgut.trian.utils.Message;
import com.dgut.trian.utils.UUIDUtils;



@WebServlet("/ClassServlet")
public class ClassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type="index";
		type=request.getParameter("type");
		ClassService classService=new ClassService();
		UserDao userDao=new UserDao();
		Message message=new Message();
		try {
			if(type.equals("findAllByPage")) {
				List<Object> class1=new ArrayList<Object>();
				int currPage=Integer.parseInt(request.getParameter("currPage"));
				int pageSize=2;
				int totalpage=(int)classService.getTotalPage(pageSize);
				if(currPage>totalpage)
					currPage=totalpage;
				List<Class> class1s=classService.findAllByPage(currPage,pageSize);
				class1.add(class1s);
				class1.add(totalpage);
				String json=JsonUtil.listjson(class1);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
										
			}else if(type.equals("findTeacherByPage")) {
				Teacher teacher=(Teacher)request.getSession().getAttribute("teacher");
				String name=userDao.getTeacherByUsername(teacher.getUsername()).getRealname();
				List<Object> class1=new ArrayList<Object>();
				int currPage=Integer.parseInt(request.getParameter("currPage"));
				int pageSize=4;
				int totalpage=(int)classService.getTeacherTotalPage(pageSize,name);
				if(currPage>totalpage)
					currPage=totalpage;
				List<Class> class1s=classService.findTeacherByPage(currPage,pageSize,name);
				class1.add(class1s);
				class1.add(totalpage);
				String json=JsonUtil.listjson(class1);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
				
			}else if(type.equals("add")) {
				String name=request.getParameter("name");
				String cname=request.getParameter("cname");
				String tname=request.getParameter("tname");
				String starttime=request.getParameter("starttime");
				String endtime=request.getParameter("endtime");
				String address=request.getParameter("address");
				String season=request.getParameter("season");
				int onsale=Integer.parseInt(request.getParameter("onsale"));
				int cid=Integer.parseInt(request.getParameter("cid"));
				Class class1=new Class(name, tname, cname, starttime, endtime, address, season, onsale,UUIDUtils.getDate());
				classService.add(class1,cid);
				request.getRequestDispatcher("/admin/class/list.jsp").forward(request, response);
			
			}else if(type.equals("close")) {
				String closeSeason=request.getParameter("closeSeason");
				int result=classService.close(closeSeason);
				message.setStatus(result);
				if(result==1)
					message.setMessage("关闭成功");
				else
					message.setMessage("关闭失败");
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("getById")) {
				int id=Integer.parseInt(request.getParameter("id"));
				Map<String, Object> map=new HashMap<String, Object>();
				map=classService.getById(id);
				String json=JsonUtil.mapjson(map);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

}
