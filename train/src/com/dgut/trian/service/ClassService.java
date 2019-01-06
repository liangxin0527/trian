package com.dgut.trian.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import com.dgut.trian.bean.Class;
import com.dgut.trian.bean.Course;
import com.dgut.trian.dao.ClassDao;
import com.dgut.trian.dao.CourseDao;





public class ClassService{
	
	ClassDao classDao=new ClassDao();
	
	public double getTotalPage(int pageSize) throws Exception {
		return Math.ceil(classDao.getTotalCount()*1.0/pageSize);
	}
	public List<Class> findAllByPage(int currPage,int pageSize) throws Exception{
		return classDao.findAllByPage(currPage,pageSize);
	}
	public double getTeacherTotalPage(int pageSize,String name) throws Exception {
		return Math.ceil(classDao.getTeacherTotalPage(name)*1.0/pageSize);
	}
	public List<Class> findTeacherByPage(int currPage,int pageSize,String name) throws Exception{
		return classDao.findTeacherByPage(currPage,pageSize,name);
	}
	public Map<String, Object> getById(int id) throws SQLException{
		
		Map<String, Object>  map=new HashMap<String, Object>();
		CourseDao courseDao=new CourseDao();
		ClassDao classDao=new ClassDao();
		List<Course> course=courseDao.getByIdList(id);
		map.put("course", course);
		List<Class> classes=new ArrayList<Class>();
		String name=null;
		for (Course c : course) {
			name=c.getName();
		}
		classes=classDao.getByCourseId(name);
		map.put("classes",classes);
		
		return map;
		
	}
	public void add(Class class1,int cid) throws SQLException {
		
		CourseDao courseDao=new CourseDao();
		courseDao.setCourseOpen(cid);
		classDao.add(class1);
	}
	public int close(String closeSeason) throws SQLException {
		if(classDao.close(closeSeason)>0)
			return 1;
		else 
			return 0;
	}
	public void setInput(int id) throws SQLException {
		classDao.input(id);
	}
	
}
