package com.dgut.trian.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.dgut.trian.bean.Course;
import com.dgut.trian.utils.DataSourceUtils;


public class CourseDao {
	
	public List<Course> findWeight() throws SQLException{
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_course ORDER BY weight DESC LIMIT 0,8;";
		return qr.query(sql, new BeanListHandler<>(Course.class));
	}
	public List<Course> findNew() throws SQLException{
		
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_course ORDER BY createdtime DESC LIMIT 0,8;";
		return qr.query(sql, new BeanListHandler<>(Course.class));
	}
	
	public List<Course> getCategoryByPage(int currPage, int pageSize,String category_name) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from t_course WHERE category_name=? ORDER BY createdtime DESC limit ?,?";
		return qr.query(sql, new BeanListHandler<>(Course.class),category_name,(currPage-1)*pageSize,pageSize);
	}
	
	public List<Course> getSearchByPage(int currPage, int pageSize,String s) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from t_course WHERE  name LIKE ? ORDER BY createdtime DESC limit ?,?";
		return qr.query(sql, new BeanListHandler<>(Course.class),'%'+s+'%',(currPage-1)*pageSize,pageSize);
	}
	public List<Course> findAllByPage(int currPage, int pageSize) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from t_course ORDER BY createdtime DESC limit ?,?";
		return qr.query(sql, new BeanListHandler<>(Course.class),(currPage-1)*pageSize,pageSize);
	}
	public int getTotalCount() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from t_course";
		return ((Long)qr.query(sql, new ScalarHandler())).intValue();
	}
	public int getTotalCountByCategory(String category_name) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from t_course WHERE category_name=?";
		return ((Long)qr.query(sql, new ScalarHandler(),category_name)).intValue();
	}
	public int getTotalCountBySearch(String s) throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from t_course WHERE  name LIKE ?";
		return ((Long)qr.query(sql, new ScalarHandler(),'%'+s+'%')).intValue();
	}
	public void edit(Course course) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_course SET name=?,brief=?,category_name=?,price=?,picture=?,weight=? WHERE id=?;";
		qr.update(sql,course.getName()+"",course.getBrief()+"",course.getCategory_name()+"",course.getPrice(),course.getPicture()+"",course.getWeight(),course.getId());
	}
	
	public int add(Course course) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="INSERT INTO t_course values(?,?,?,?,?,?,?,?,?,?)";
		return qr.update(sql,null,course.getName(),course.getCategory_name(),course.getPrice(),course.getBrief(),1,0,course.getPicture(),course.getWeight(),course.getCreatedtime())>0?1:0;
	}
	public void setCourseOpen(int cid) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE  t_course SET open=1 WHERE id=?;";
		qr.update(sql,cid);
	}
	public int  delete(int id) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="DELETE FROM t_course WHERE id=?;";
		return qr.update(sql,id)>0?1:0;
	}
	public int  changeSale(int id,int onsale) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_course SET onsale=? WHERE id=?;";
		return qr.update(sql,onsale,id)>0?1:0;
	}
	public Course getById(int id) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_course WHERE id=? LIMIT 1";
		return qr.query(sql,new BeanHandler<>(Course.class),id);
	}
	public List<Course> getByIdList(int id) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_course WHERE id=? LIMIT 1";
		return qr.query(sql,new BeanListHandler<>(Course.class),id);
	}
}
