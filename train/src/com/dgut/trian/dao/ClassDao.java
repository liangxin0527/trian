package com.dgut.trian.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.dgut.trian.bean.Class;
import com.dgut.trian.bean.Course;
import com.dgut.trian.utils.DataSourceUtils;


public class ClassDao {
	
	public List<Class> findAllByPage(int currPage, int pageSize) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from t_class ORDER BY createdtime DESC limit ?,?";
		return qr.query(sql, new BeanListHandler<>(Class.class),(currPage-1)*pageSize,pageSize);
	}
	public int getTotalCount() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from t_class";
		return ((Long)qr.query(sql, new ScalarHandler())).intValue();
	}
	public List<Class> findTeacherByPage(int currPage, int pageSize,String name) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from t_class WHERE tname=? ORDER BY createdtime DESC limit ?,?";
		return qr.query(sql, new BeanListHandler<>(Class.class),name,(currPage-1)*pageSize,pageSize);
	}
	public int getTeacherTotalPage(String name) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from t_class WHERE tname=?";
		return ((Long)qr.query(sql, new ScalarHandler(),name)).intValue();
	}
	public void add(Class class1) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="INSERT INTO t_class VALUES(?,?,?,?,?,?,?,?,?,?,?);";
		qr.update(sql,null,class1.getName(),class1.getTname(),class1.getCname(),class1.getStarttime(),class1.getEndtime(),class1.getAddress(),class1.getSeason(),class1.getOnsale(),class1.getCreatedtime(),class1.getInput());
	}
	public int close(String closeSeason) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_class SET onsale=0 WHERE season=?";
		return qr.update(sql,closeSeason)>0?1:0;
	}
	public List<Class> getByCourseId(String id) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_Class WHERE cname=?";
		return qr.query(sql,new BeanListHandler<>(Class.class),id);
	}
	
	public void input(int id) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_Class SET input=1 WHERE id=?";
		qr.update(sql,id);
	}
}
