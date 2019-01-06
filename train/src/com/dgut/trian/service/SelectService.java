package com.dgut.trian.service;

import java.sql.SQLException;
import java.util.List;

import com.dgut.trian.bean.Score;
import com.dgut.trian.bean.Select;
import com.dgut.trian.dao.SelectDao;

public class SelectService {
	
	SelectDao selectDao=new SelectDao();
	public int add(long sid,int cid) throws SQLException {
		
		int result=selectDao.add(sid,cid);
		if(result==1)
			return 1;
		else
			return 0;
	}
	public double getTotalPage(int pageSize) throws SQLException {
		return Math.ceil(selectDao.getTotalCount()*1.0/pageSize);
	}
	public double getTotalMySelect(int pageSize,long id) throws SQLException {
		System.out.println(selectDao.getTotalCountById(id));
		return Math.ceil(selectDao.getTotalCountById(id)*1.0/pageSize);
	}
	public double getClassPage(int pageSize,int cid) throws SQLException {
		return Math.ceil(selectDao.getTotalCountClass(cid)*1.0/pageSize);
	}
	
	public List<Select> findMySelects(int currPage,int pageSize,long id) throws SQLException{
		return selectDao.findMySelects(currPage,pageSize,id);
	}
	public List<Select> findAllByPage(int currPage,int pageSize) throws SQLException{
		return selectDao.findAllByPage(currPage,pageSize);
	}
	public List<Score> findClassByPage(int currPage,int pageSize,int cid) throws SQLException{
		return selectDao.findClassByPage(currPage,pageSize,cid);
	}
	public int pay(int id) throws SQLException {
		int result=selectDao.pay(id);
		if(result==1)
			return 1;
		else
			return 0;
	}
	
	public void setScore(String id,double score) throws SQLException {
		selectDao.setScore(id,score);
	}
}
