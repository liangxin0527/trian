package com.dgut.trian.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.IOUtils;

import com.dgut.trian.bean.Category;
import com.dgut.trian.bean.Course;
import com.dgut.trian.bean.Page;
import com.dgut.trian.bean.Select;
import com.dgut.trian.constant.Constant;
import com.dgut.trian.service.CategoryService;
import com.dgut.trian.service.CourseService;
import com.dgut.trian.utils.JsonUtil;
import com.dgut.trian.utils.Message;
import com.dgut.trian.utils.UUIDUtils;
import com.dgut.trian.utils.UploadUtils;
import com.sun.mail.handlers.message_rfc822;
import com.sun.xml.internal.ws.api.model.wsdl.editable.EditableWSDLBoundFault;



@WebServlet("/CourseServlet")
public class CourseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		String type="index";
		type=request.getParameter("type");
		CourseService courseService=new CourseService();
		Message message=new Message();
		try {
			if(type.equals("edit")) {
				HashMap<String, Object> map = new HashMap<>();
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List<FileItem> list = upload.parseRequest(request);
				
				for (FileItem fi : list) {
					if(fi.isFormField()){
						map.put(fi.getFieldName(),fi.getString("utf-8"));
					}else{
						String name = fi.getName();
						String realName = UploadUtils.getRealName(name);
						String uuidName = UploadUtils.getUUIDName(realName);
						String path = this.getServletContext().getRealPath("/courseimages");
						File dir = new File(path);
						if (!dir.exists()) {
							dir.mkdirs();
						}
						InputStream is = fi.getInputStream();
						FileOutputStream os = new FileOutputStream(new File(path, uuidName));
						
						IOUtils.copy(is, os);
						os.close();
						is.close();
						
						fi.delete();
						
						map.put(fi.getFieldName(), "courseimages/"+uuidName);
						
					}
					
				}
				
				Course course = new Course();
				BeanUtils.populate(course,map);
				courseService.edit(course);
				request.getRequestDispatcher("/admin/course/list.jsp").forward(request, response);
				//request.getRequestDispatcher("/CourseServlet?type=findAll").forward(request, response);
			}
			else if(type.equals("add")) {
				HashMap<String, Object> map = new HashMap<>();
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List<FileItem> list = upload.parseRequest(request);
				
				for (FileItem fi : list) {
					if(fi.isFormField()){
						map.put(fi.getFieldName(),fi.getString("utf-8"));
					}else{
						String name = fi.getName();
						String realName = UploadUtils.getRealName(name);
						String uuidName = UploadUtils.getUUIDName(realName);
						String path = this.getServletContext().getRealPath("/courseimages");
						File dir = new File(path);
						if (!dir.exists()) {
							dir.mkdirs();
						}
						InputStream is = fi.getInputStream();
						FileOutputStream os = new FileOutputStream(new File(path, uuidName));
						
						IOUtils.copy(is, os);
						os.close();
						is.close();
						
						fi.delete();
						
						map.put(fi.getFieldName(), "courseimages/"+uuidName);
						
					}
					
				}
				
				Course course = new Course();
				BeanUtils.populate(course,map);
				course.setCreatedtime(UUIDUtils.getDate());
				int result=courseService.add(course);
				message.setStatus(result);			
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
	
			}
			else if(type.equals("delete")) {
				int id=Integer.parseInt(request.getParameter("id"));
				int result=courseService.delete(id);
				message.setStatus(result);
				if(result==1)
					message.setMessage("删除成功");
				else
					message.setMessage("删除失败");
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}
			else if(type.equals("getById")){
				int id=Integer.parseInt(request.getParameter("id"));
				Course edit=new Course();
				edit=courseService.getById(id);
				request.setAttribute("edit", edit);
				request.getRequestDispatcher("/admin/course/edit.jsp").forward(request, response);
			}
			else if(type.equals("findAllByPage")){
				List<Object> course=new ArrayList<Object>();
				int currPage=Integer.parseInt(request.getParameter("currPage"));
				int pageSize=4;
				int totalpage=(int)courseService.getTotalPage(pageSize);
				if(currPage>totalpage)
					currPage=totalpage;
				List<Course> courses=courseService.findAllByPage(currPage,pageSize);
				course.add(courses);
				course.add(totalpage);
				String json=JsonUtil.listjson(course);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}
			else if(type.equals("getByIdToAdd")) {
				int id=Integer.parseInt(request.getParameter("id"));
				Course add=new Course();
				add=courseService.getById(id);
				request.setAttribute("add", add);
				request.getRequestDispatcher("/admin/class/add.jsp").forward(request, response);
			}
			else if(type.equals("findWeight")) {
				List<Course> courses=courseService.findWeight();
				String json = JsonUtil.listjson(courses);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);	
			}
			else if(type.equals("findNew")) {
				List<Course> courses=courseService.findNew();
				String json = JsonUtil.listjson(courses);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);	
			}else if(type.equals("getCategoryByPage")) {
				int cid=Integer.parseInt(request.getParameter("cid"));
				String category_name=courseService.getNameById(cid);
				List<Object> course=new ArrayList<Object>();
				List<Course> courses=new ArrayList<Course>();
				int currPage=Integer.parseInt(request.getParameter("currPage"));
				if(currPage==0)
					currPage=1;
				int pageSize=2;
				int totalpage=(int)courseService.getTotalPageByCategory(pageSize,category_name);
				if(currPage>totalpage)
					currPage=totalpage;
				if(totalpage!=0)
					courses=courseService.getCategoryByPage(currPage,pageSize,category_name);
				course.add(courses);
				course.add(totalpage);
				String json=JsonUtil.listjson(course);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);	
			}else if(type.equals("search")){
				String s=request.getParameter("s");
				List<Object> course=new ArrayList<Object>();
				List<Course> courses=new ArrayList<Course>();
				int currPage=Integer.parseInt(request.getParameter("currPage"));
				if(currPage==0)
					currPage=1;
				int pageSize=4;
				int totalpage=(int)courseService.getTotalPageBySearch(pageSize,s);
				if(currPage>totalpage)
					currPage=totalpage;
				if(totalpage!=0)
					courses=courseService.getSearchByPage(currPage,pageSize,s);
				course.add(courses);
				course.add(totalpage);
				String json=JsonUtil.listjson(course);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);	
			}else if(type.equals("changeSale")) {
				int onsale=Integer.parseInt(request.getParameter("onsale"));
				int id=Integer.parseInt(request.getParameter("id"));
				if(onsale==0)
					onsale=1;
				else
					onsale=0;
				int result=courseService.changeSale(id,onsale);
				message.setStatus(result);
				if(result==1)
					message.setMessage("更新成功");
				else
					message.setMessage("更新失败");
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);	
			}else if(type.equals("edit")) {
				HashMap<String, Object> map = new HashMap<>();
				
				DiskFileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List<FileItem> list = upload.parseRequest(request);
				
				for (FileItem fi : list) {
					if(fi.isFormField()){
						map.put(fi.getFieldName(),fi.getString("utf-8"));
					}else{
						String name = fi.getName();
						String realName = UploadUtils.getRealName(name);
						String uuidName = UploadUtils.getUUIDName(realName);
						String path = this.getServletContext().getRealPath("/courseimages");
						File dir = new File(path);
						if (!dir.exists()) {
							dir.mkdirs();
						}
						InputStream is = fi.getInputStream();
						FileOutputStream os = new FileOutputStream(new File(path, uuidName));
						
						IOUtils.copy(is, os);
						os.close();
						is.close();
						
						fi.delete();
						
						map.put(fi.getFieldName(), "courseimages/"+uuidName);
						
					}
					
				}
				
				Course course = new Course();
				BeanUtils.populate(course,map);
				course.setCreatedtime(UUIDUtils.getDate());
				courseService.add(course);
			}
				
		} catch (SQLException e) {
			
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}

}
