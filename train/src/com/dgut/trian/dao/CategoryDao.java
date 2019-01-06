package com.dgut.trian.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.dgut.trian.bean.Category;
import com.dgut.trian.utils.DataSourceUtils;

public class CategoryDao {
	
	public List<Category> findAll() throws SQLException{
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_course_category;";
		return qr.query(sql, new BeanListHandler<>(Category.class));
	}
	
	public void edit(Category category) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_course_category SET name=? WHERE id=?;";
		qr.update(sql,category.getName(),category.getId());
	}
	
	public void add(String name) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="INSERT INTO t_course_category(name) VALUES(?);";
		qr.update(sql,name);
	}
	public void delete(int id) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="DELETE FROM t_course_category WHERE id=?;";
		qr.update(sql,id);
	}
	public Category getById(int id) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_course_category WHERE id=? LIMIT 1";
		return qr.query(sql,new BeanHandler<>(Category.class),id);
	}
}
