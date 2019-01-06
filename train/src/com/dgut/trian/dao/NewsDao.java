package com.dgut.trian.dao;

import java.sql.SQLException;
import java.util.List;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.dgut.trian.bean.News;
import com.dgut.trian.utils.DataSourceUtils;
import com.sun.org.apache.bcel.internal.generic.NEW;

public class NewsDao {
	
	public int getTotalCount() throws Exception {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from t_news";
		return ((Long)qr.query(sql, new ScalarHandler())).intValue();
	}
	public List<News> findAllByPage(int currPage, int pageSize) throws Exception {
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from t_news ORDER BY createdtime DESC limit ?,?";
		return qr.query(sql, new BeanListHandler<>(News.class),(currPage-1)*pageSize,pageSize);
	}
	
	
	public int add(News news) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="INSERT INTO t_news VALUES(null,?,?,?);";
		return qr.update(sql,news.getTitle(),news.getContent(),news.getCreatedtime())>0?1:0;
	}
	public void edit(News news,int id) throws Exception{
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_news SET title=?,content=? WHERE id=?;";
		qr.update(sql,news.getTitle(),news.getContent(),id);
	}
	public int delete(int id) throws Exception{
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="DELETE FROM t_news WHERE id=?";
		return qr.update(sql,id);
	}
	public List<News> findFive() throws SQLException{
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_news ORDER BY createdtime LIMIT 5;";
		return qr.query(sql, new BeanListHandler<>(News.class));
	}
	public News getOne(int id) throws SQLException{
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_news WHERE id=? LIMIT 1;";
		return qr.query(sql, new BeanHandler<>(News.class),id);
	}
}
