package com.dgut.trian.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import com.dgut.trian.bean.Admin;
import com.dgut.trian.bean.Student;
import com.dgut.trian.bean.Teacher;
import com.dgut.trian.utils.DataSourceUtils;


public class UserDao {
	public Student studentLogin(Student student) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_student WHERE username=? AND password=? LIMIT 1;";
		return qr.query(sql,new BeanHandler<>(Student.class),student.getUsername(),student.getPassword());
	}
	public Teacher teacherLogin(Teacher teacher) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_teacher WHERE username=? AND password=? LIMIT 1;";
		return qr.query(sql,new BeanHandler<>(Teacher.class),teacher.getUsername(),teacher.getPassword());
	}
	public Admin adminLogin(Admin admin) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_admin WHERE username=? AND password=? LIMIT 1;";
		return qr.query(sql,new BeanHandler<>(Admin.class),admin.getUsername(),admin.getPassword());
	}
	public int regitser(Student student) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="INSERT INTO t_student(id,username,password) VALUES(?,?,?)";
		return qr.update(sql,student.getId(),student.getUsername(),student.getPassword());
	}
	public Student getStudentByUsername(String username) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_student WHERE username=? LIMIT 1;";
		return qr.query(sql,new BeanHandler<>(Student.class),username);
	}
	public Teacher getTeacherByUsername(String username) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_teacher WHERE username=? LIMIT 1;";
		return qr.query(sql,new BeanHandler<>(Teacher.class),username);
	}
	public int update(Student student) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_student SET username=?,realname=?,telephone=? WHERE id=?;";
		return qr.update(sql,student.getUsername(),student.getRealname(),student.getTelephone(),student.getId());
	}
	public void editTeacher(Teacher teacher,int id) throws SQLException {
		QueryRunner qr=new QueryRunner(DataSourceUtils.getDataSource());
		String sql="UPDATE t_teacher SET username=?,realname=?,telephone=?,brief=? WHERE id=?;";
		qr.update(sql,teacher.getUsername(),teacher.getRealname(),teacher.getTelephone(),teacher.getBrief(),id);
	}
	public Student getStudentById(long id) throws Exception{
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from t_student where id=? limit 1";
		return qr.query(sql, new BeanHandler<>(Student.class),id);
	}
	public Teacher getTeacherById(int id) throws Exception{
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="select * from t_teacher where id=? limit 1";
		return qr.query(sql, new BeanHandler<>(Teacher.class),id);
	}
	public void changePassword(long id,String password) throws SQLException{
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="update t_student set password=? where id=?";
		qr.update(sql,password,id);
		
	}
	public void changeTeacherPassword(int id,String password) throws SQLException{
		
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="update t_teacher set password=? where id=?";
		qr.update(sql,password,id);	
	}
	public List<Student> getStudents() throws SQLException{
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_student";
		return qr.query(sql, new BeanListHandler<>(Student.class));
	}
	public List<Teacher> getTeachers() throws SQLException{
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_teacher";
		return qr.query(sql, new BeanListHandler<>(Teacher.class));
	}
	public List<Admin> getAdmins() throws SQLException{
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="SELECT * FROM t_admin";
		return qr.query(sql, new BeanListHandler<>(Admin.class));
	}
	public void addTeacher(Teacher teacher) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="INSERT INTO t_teacher VALUES(null,?,?,?,?,?);";
		qr.update(sql, teacher.getUsername(),teacher.getPassword(),teacher.getRealname(),teacher.getTelephone(),teacher.getBrief());
	}
	public void addAdmin(Admin admin) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="INSERT INTO t_admin VALUES(null,?,?,?);";
		qr.update(sql,admin.getUsername(),admin.getPassword(),admin.getRealname() );
	}
	public void deleteAdmin(int id) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="DELETE FROM t_admin WHERE id=?";
		qr.update(sql,id);
	}
	public void deleteTeacher(int id) throws SQLException {
		QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
		String sql="DELETE FROM t_teacher WHERE id=?";
		qr.update(sql,id);
	}
}
