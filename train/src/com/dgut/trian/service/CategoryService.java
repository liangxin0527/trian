package com.dgut.trian.service;

import java.sql.SQLException;
import java.util.List;

import com.dgut.trian.bean.Category;
import com.dgut.trian.dao.CategoryDao;

public class CategoryService{
	
	CategoryDao categoryDao=new CategoryDao();
	public List<Category> fillAll() throws SQLException{
		
		return categoryDao.findAll();
	}
	public void edit(Category category) throws SQLException {
		
		categoryDao.edit(category);
	}
	public void add(String name) throws SQLException {
			
			categoryDao.add(name);
		}
	public void delete(int id) throws SQLException {
		
		categoryDao.delete(id);
	}
	public Category getById(int id) throws SQLException {
		
		return categoryDao.getById(id);
	}
	
}
