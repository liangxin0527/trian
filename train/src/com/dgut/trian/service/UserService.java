package com.dgut.trian.service;

import java.sql.SQLException;
import java.util.List;

import com.dgut.trian.bean.Admin;
import com.dgut.trian.bean.Student;
import com.dgut.trian.bean.Teacher;
import com.dgut.trian.dao.UserDao;
import com.sun.xml.internal.org.jvnet.fastinfoset.VocabularyApplicationData;

public class UserService {
	
	UserDao userDao=new UserDao();
	
	public int studentLogin(Student student) throws SQLException {
		Student student1=userDao.studentLogin(student);
		if(student1!=null)
			return 1;
		else
			return 0;
	}
	public int teacherLogin(Teacher teacher) throws SQLException {
		Teacher teacher1=userDao.teacherLogin(teacher);
		if(teacher1!=null)
			return 1;
		else
			return 0;
	}
	public int adminLogin(Admin admin) throws SQLException {
		Admin admin1=userDao.adminLogin(admin);
		if(admin1!=null)
			return 1;
		else
			return 0;
	}
	
	public int register(Student student) throws SQLException {
		
		int result=userDao.regitser(student);
		if(result==1)
			return 1;
		else
			return 0;
		
	}
	public void deleteAdmin(int id) throws SQLException {
		userDao.deleteAdmin(id);
	}
	public void deleteTeacher(int id) throws SQLException {
		userDao.deleteTeacher(id);
	}
	public Teacher getOneTeacher(int id) throws Exception {
		return userDao.getTeacherById(id);
	}
	public void editTeacher(Teacher teacher,int id) throws SQLException {
		userDao.editTeacher(teacher,id);
	}
	public Student getStudentByUsername(String username) throws SQLException {
		
		return userDao.getStudentByUsername(username);
	}
	public int update(Student student) throws SQLException {
		int result=userDao.update(student);
		if(result==1)
			return 1;
		else
			return 0;
	}
	public long getIdByUsername(String username) throws SQLException {
		
		return userDao.getStudentByUsername(username).getId();
	}
	public int getIdByTachername(String username) throws SQLException {
		
		return userDao.getTeacherByUsername(username).getId();
	}
	public int changePassword(long id,String oldPassword,String password) throws Exception {
		
		Student student=userDao.getStudentById(id);
		if(!student.getPassword().equals(oldPassword))
			return 0;
		else{
			userDao.changePassword(id, password);
			return 1;
		}
	}
	public int changeTeacherPassword(int id,String oldPassword,String password) throws Exception {
		
		Teacher teacher=userDao.getTeacherById(id);
		if(!teacher.getPassword().equals(oldPassword))
			return 0;
		else{
			userDao.changeTeacherPassword(id, password);
			return 1;
		}
	}
	public List<Student> findStudents() throws SQLException{
		return userDao.getStudents();
	}
	public List<Teacher> findTeachers() throws SQLException{
		return userDao.getTeachers();
	}
	public List<Admin> findAdmins() throws SQLException{
		return userDao.getAdmins();
	}
	public void addTeacher(Teacher teacher) throws SQLException {
		userDao.addTeacher(teacher);
	}
	public void addAdmin(Admin admin) throws SQLException {
		userDao.addAdmin(admin);
	}
}
