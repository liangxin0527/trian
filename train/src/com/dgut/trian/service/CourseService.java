package com.dgut.trian.service;

import java.sql.SQLException;
import java.util.List;

import com.dgut.trian.bean.Category;
import com.dgut.trian.bean.Course;
import com.dgut.trian.bean.Page;
import com.dgut.trian.bean.Select;
import com.dgut.trian.dao.CategoryDao;
import com.dgut.trian.dao.CourseDao;
import com.sun.xml.internal.org.jvnet.fastinfoset.VocabularyApplicationData;



public class CourseService{
	
	CourseDao courseDao=new CourseDao();
	CategoryDao categoryDao=new CategoryDao();
	public List<Course> findWeight() throws SQLException{
		
		return courseDao.findWeight();
	}
	public List<Course> findNew() throws SQLException{
		
		return courseDao.findNew();
	}
	public double getTotalPage(int pageSize) throws Exception {
		return Math.ceil(courseDao.getTotalCount()*1.0/pageSize);
	}
	public double getTotalPageByCategory(int pageSize,String category_name) throws Exception {
		return Math.ceil(courseDao.getTotalCountByCategory(category_name)*1.0/pageSize);
	}
	
	public double getTotalPageBySearch(int pageSize,String s) throws Exception {
		return Math.ceil(courseDao.getTotalCountBySearch(s)*1.0/pageSize);
	}
	public List<Course> findAllByPage(int currPage,int pageSize) throws Exception{
		return courseDao.findAllByPage(currPage,pageSize);
	}
	
	public List<Course> getCategoryByPage(int currPage,int pageSize,String category_name) throws Exception{
		return courseDao.getCategoryByPage(currPage,pageSize,category_name);
	}
	public List<Course> getSearchByPage(int currPage,int pageSize,String s) throws Exception{
		return courseDao.getSearchByPage(currPage,pageSize,s);
	}
	public String getNameById(int cid) throws SQLException {
		Category category=categoryDao.getById(cid);
		return category.getName();
	}
	public void edit(Course course) throws SQLException {
		
		courseDao.edit(course);
	}
	
	public int add(Course course) throws SQLException {
			
		if(courseDao.add(course)>0)
			   return 1;
		   else
			   return 0;
		
	}
	public int changeSale(int id,int onsale) throws SQLException {
		if(courseDao.changeSale(id,onsale)>0)
			   return 1;
		   else
			   return 0;
		
	}
	public int delete(int id) throws SQLException {
		
	   if(courseDao.delete(id)==1)
		   return 1;
	   else
		   return 0;
	}
	public Course getById(int id) throws SQLException {
		
		return courseDao.getById(id);
	}
	
	
}
