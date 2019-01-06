package com.dgut.trian.service;

import java.sql.SQLException;
import java.util.List;

import com.dgut.trian.bean.Course;
import com.dgut.trian.bean.News;
import com.dgut.trian.dao.NewsDao;

public class NewsService {
	
	NewsDao newsDao=new NewsDao();
	public double getTotalPage(int pageSize) throws Exception {
		return Math.ceil(newsDao.getTotalCount()*1.0/pageSize);
	}
	public List<News> findAllByPage(int currPage,int pageSize) throws Exception{
		return newsDao.findAllByPage(currPage,pageSize);
	}
	
	public News getNewsById(int id) throws Exception{
		return newsDao.getOne(id);
	}
	public int add(News news) throws Exception{
		
		if(newsDao.add(news)>0)
			return 1;
		else
			return 0;
		
	}
	public List<News> findFive() throws SQLException{
		return newsDao.findFive();
	}
	public News getOne(int id) throws SQLException{
		return newsDao.getOne(id);
	}
	public void edit(News news,int id) throws Exception {
		newsDao.edit(news, id);
	}
	public int delete(int id) throws Exception{
		return newsDao.delete(id);
	}
}
