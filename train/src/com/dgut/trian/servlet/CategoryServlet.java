package com.dgut.trian.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dgut.trian.bean.Category;
import com.dgut.trian.service.CategoryService;
import com.dgut.trian.utils.JsonUtil;


@WebServlet("/CategoryServlet")
public class CategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
    	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String type="index";
		type=request.getParameter("type");
		CategoryService categoryService=new CategoryService();
		try {
			if(type.equals("findAll")) {
					List<Category> categories=categoryService.fillAll();
					request.setAttribute("categories", categories);
					request.getRequestDispatcher("/admin/category/list.jsp").forward(request, response);
										
			}
			else if(type.equals("edit")) {
				int id=Integer.parseInt(request.getParameter("id"));
				String name=request.getParameter("name");
				Category category=new Category();
				category.setId(id);
				category.setName(name);
				categoryService.edit(category);
				request.getRequestDispatcher("/CategoryServlet?type=findAll").forward(request, response);
			}
			else if(type.equals("add")) {
				String name=request.getParameter("name");
				categoryService.add(name);
				request.getRequestDispatcher("/CategoryServlet?type=findAll").forward(request, response);
	
			}
			else if(type.equals("delete")) {
				int id=Integer.parseInt(request.getParameter("id"));
				categoryService.delete(id);
				request.getRequestDispatcher("/CategoryServlet?type=findAll").forward(request, response);
			}
			else if(type.equals("getById")){
				int id=Integer.parseInt(request.getParameter("id"));
				Category edit=new Category();
				edit=categoryService.getById(id);
				request.setAttribute("edit", edit);
				request.getRequestDispatcher("/admin/category/edit.jsp").forward(request, response);
			}
			else if(type.equals("findAllAjax")) {
				List<Category> categories=categoryService.fillAll();
				String json = JsonUtil.listjson(categories);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}
				
		} catch (SQLException e) {
			
			e.printStackTrace();
		}	
	}

}
