package com.dgut.trian.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import com.dgut.trian.bean.Score;
import com.dgut.trian.bean.Select;
import com.dgut.trian.utils.DataSourceUtils;

public class SelectDao {
	
	public int add(long sid,int cid) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="INSERT INTO t_select(sid,cid) VALUES(?,?);";
		return qr.update(sql,sid,cid);
	}
	
	public int getTotalCount() throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from t_select";
		return ((Long)qr.query(sql, new ScalarHandler())).intValue();
	}
	public int getTotalCountById(long sid) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from t_select WHERE sid=?";
		return ((Long)qr.query(sql, new ScalarHandler(),sid)).intValue();
	}
	//查看班级
	public int getTotalCountClass(int cid) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select count(*) from t_select WHERE cid=? AND pay=1";
		return ((Long)qr.query(sql, new ScalarHandler(),cid)).intValue();
	}
	public List<Select> findAllByPage(int currPage,int pageSize) throws SQLException{
		QueryRunner qRunner=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT t.id as id,s.id as studentid,s.realname as realname,c.cname as coursename,c.name as "
				+ "classname,c.address address,c.starttime as starttime,c.endtime as endtime"
				+ ",t.pay as pay,t.score score FROM t_student s,t_class c,t_select t "
				+ "WHERE s.id=t.sid AND c.id=t.cid limit ?,?";
		return qRunner.query(sql,new BeanListHandler<>(Select.class),(currPage-1)*pageSize,pageSize);
	}
	public List<Select> findMySelects(int currPage,int pageSize,long id) throws SQLException{
		QueryRunner qRunner=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT t.id as id,s.id as studentid,s.realname as realname,c.cname as coursename,c.name as "
				+ "classname,c.address address,c.starttime as starttime,c.endtime as endtime"
				+ ",t.pay as pay,t.score score FROM t_student s,t_class c,t_select t "
				+ "WHERE s.id=t.sid AND c.id=t.cid AND t.sid=? limit ?,?";
		return qRunner.query(sql,new BeanListHandler<>(Select.class),id,(currPage-1)*pageSize,pageSize);
	}
	public List<Score> findClassByPage(int currPage,int pageSize,int cid) throws SQLException{
		QueryRunner qRunner=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT b.sid as studentId,a.realname as studentName,b.score as score FROM t_student a,t_select b WHERE b.cid=? AND a.id=b.sid AND b.pay=1 limit ?,?;";
		return qRunner.query(sql,new BeanListHandler<>(Score.class),cid,(currPage-1)*pageSize,pageSize);
	}
	public int pay(int id) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_select SET pay=1 WHERE id=?";
		return qr.update(sql,id);
	}
	public void setScore(String id,double score) throws SQLException {
		QueryRunner qRunner=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_select SET score=? WHERE sid=?;";
		qRunner.update(sql,score,id);
	}
}
