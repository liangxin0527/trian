package com.dgut.trian.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.dgut.trian.bean.News;
import com.dgut.trian.dao.NewsDao;
import com.dgut.trian.service.NewsService;
import com.dgut.trian.utils.JsonUtil;
import com.dgut.trian.utils.Message;
import com.dgut.trian.utils.UUIDUtils;

@WebServlet("/NewsServlet")
public class NewsServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String type="index";
		type=request.getParameter("type");
		NewsService newsService=new NewsService();
		Message message=new Message();
		try {
			if(type.equals("findAllByPage")){
				List<Object> newss=new ArrayList<Object>();
				int currPage=Integer.parseInt(request.getParameter("currPage"));
				int pageSize=5;
				int totalpage;
				totalpage = (int)newsService.getTotalPage(pageSize);
			
				if(currPage>totalpage)
					currPage=totalpage;
				List<News> news=new ArrayList<News>();
				news=newsService.findAllByPage(currPage,pageSize);
				newss.add(news);
				newss.add(totalpage);
				String json=JsonUtil.listjson(newss);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("add")) {
				News news=new News();
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				news.setTitle(title);
				news.setContent(content);
				news.setCreatedtime(UUIDUtils.getDate());
				newsService.add(news);
				request.getRequestDispatcher("/admin/news/list.jsp").forward(request, response);
			}else if(type.equals("getNewsById")){
				int id=Integer.parseInt(request.getParameter("id"));
				News news=newsService.getNewsById(id);
				request.setAttribute("news", news);
				request.getRequestDispatcher("/admin/news/edit.jsp").forward(request, response);
			}else if(type.equals("edit")){
				int id=Integer.parseInt(request.getParameter("id"));
				News news=new News();
				String title=request.getParameter("title");
				String content=request.getParameter("content");
				news.setTitle(title);
				news.setContent(content);
				newsService.edit(news,id);
				request.setAttribute("news", news);
				request.getRequestDispatcher("/admin/news/list.jsp").forward(request, response);
			}
			else if(type.equals("delete")) {
				int id=Integer.parseInt(request.getParameter("id"));			
				newsService.delete(id);
				request.getRequestDispatcher("/admin/news/list.jsp").forward(request, response);
			}else if(type.equals("findFive")) {
				
				List<News> news=newsService.findFive();
				String json=JsonUtil.listjson(news);
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().println(json);
			}else if(type.equals("getOne")) {
				int id=Integer.parseInt(request.getParameter("id"));
				News news=newsService.getOne(id);
				request.setAttribute("news", news);
				request.getRequestDispatcher("/jsp/news.jsp").forward(request, response);
			}
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
