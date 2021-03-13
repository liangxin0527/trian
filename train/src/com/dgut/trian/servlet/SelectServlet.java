package com.dgut.trian.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.dgut.trian.bean.MySelect;
import com.dgut.trian.bean.Score;
import com.dgut.trian.bean.Select;
import com.dgut.trian.bean.Student;
import com.dgut.trian.dao.UserDao;
import com.dgut.trian.service.ClassService;
import com.dgut.trian.service.SelectService;
import com.dgut.trian.service.UserService;
import com.dgut.trian.utils.JsonUtil;
import com.dgut.trian.utils.Message;


@WebServlet("/SelectServlet")
public class SelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type="index";
		type=request.getParameter("type");
		SelectService selectService=new SelectService();
		ClassService classService=new ClassService();
		UserDao userDao=new UserDao();
		Message message=new Message();
		try {
			if(type.equals("add")) {
				Student student=(Student)request.getSession().getAttribute("student");
				if(student == null){
					message.setStatus(0);
					message.setMessage("请先登录");
				}else {
					long id=userDao.getStudentByUsername(student.getUsername()).getId();
					int cid=Integer.parseInt(request.getParameter("id"));
					int result=selectService.add(id,cid);
					if(result==1) {
						message.setStatus(1);
						message.setMessage("选课成功");
					}else {
						message.setStatus(0);
						message.setMessage("选课失败");
					}
				}
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("findAllByPage")) {
				List<Object> select=new ArrayList<Object>();
				int currPage=Integer.parseInt(request.getParameter("currPage"));
				int pageSize=10;
				int totalpage=(int)selectService.getTotalPage(10);
				List<Select> selects=new ArrayList<Select>();
				selects=selectService.findAllByPage(currPage,10);
				select.add(selects);
				select.add(totalpage);
				String json=JsonUtil.listjson(select);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("pay")) {
				int id=Integer.parseInt(request.getParameter("id"));
				int result=selectService.pay(id);
				if(result==1) {
					message.setStatus(1);
					message.setMessage("支付成功");
				}else {
					message.setStatus(0);
					message.setMessage("支付失败");
				}
				String json=JsonUtil.objectjson(message);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("findClassByPage")) {
				int cid=Integer.parseInt(request.getParameter("cid"));
				List<Object> select=new ArrayList<Object>();
				int currPage=Integer.parseInt(request.getParameter("currPage"));
				int pageSize=5;
				int totalpage=(int)selectService.getClassPage(pageSize,cid);
				if(currPage>totalpage)
					currPage=totalpage;
				List<Score> selects=new ArrayList<Score>();
				selects=selectService.findClassByPage(currPage,pageSize,cid);
				select.add(selects);
				select.add(totalpage);
				String json=JsonUtil.listjson(select);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("findMySelects")) {
				Student student=(Student)request.getSession().getAttribute("student");
				UserService userService=new UserService();
				long id=userService.getStudentByUsername(student.getUsername()).getId();
				List<Object> select=new ArrayList<Object>();
				int currPage=Integer.parseInt(request.getParameter("currPage"));
				int pageSize=5;
				int totalpage=(int)selectService.getTotalMySelect(pageSize,id);
				List<Select> selects=new ArrayList<Select>();
				selects=selectService.findMySelects(currPage,pageSize,id);
				List<MySelect> list=new ArrayList<MySelect>();
				for(Select s:selects) {
					MySelect mySelect=new MySelect();
					mySelect.setId(s.getId());
					mySelect.setStudentid(s.getStudentid());
					mySelect.setRealname(s.getRealname());
					mySelect.setCoursename(s.getCoursename());
					mySelect.setClassname(s.getClassname());
					mySelect.setAddress(s.getAddress());
					mySelect.setStarttime(s.getStarttime());
					mySelect.setEndtime(s.getEndtime());
					if(s.getPay()==1)
						mySelect.setPay(true);
					else
						mySelect.setPay(false);
					mySelect.setScore(s.getScore());
					list.add(mySelect);
				}
				select.add(list);
				select.add(totalpage);
				String json=JsonUtil.listjson(select);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("input")) {
				Workbook workbook = null;
				String excleMessage=null;
				ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
		        upload.setHeaderEncoding("UTF-8");
	        	List<FileItem> fileItemList;
				try {
					fileItemList = upload.parseRequest(request);
					for(FileItem fileItem:fileItemList) {
		        		workbook = WorkbookFactory.create(fileItem.getInputStream());
		                Sheet sheet = workbook.getSheetAt(0);
		                int rowNum = sheet.getLastRowNum();
		                for(int i = 1; i <= rowNum; i++) {
		                    Row row = sheet.getRow(i);
		   
		                    String id=row.getCell(0).getStringCellValue();	                    
		                    double lilun=row.getCell(2).getNumericCellValue();
		                    double shijian=row.getCell(3).getNumericCellValue();
		                    double score=lilun*0.4+shijian*0.6;
		                    selectService.setScore(id,score);
		                }
		        	}
				request.getRequestDispatcher("/admin/teacher/class_list.jsp").forward(request, response);
				} catch (FileUploadException | EncryptedDocumentException | InvalidFormatException e) {
					e.printStackTrace();
					request.setAttribute(excleMessage, "解析Excel失败！");
				}finally {
		            if(workbook != null) {
		                try {
		                    workbook.close();
		                } catch (IOException e) {
		                    e.printStackTrace();
		                }
		            }
		        }
			}else if(type.equals("setInput")) {
				int id=Integer.parseInt(request.getParameter("id"));
				classService.setInput(id);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
			}

}
