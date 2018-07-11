package book.bean;

import java.sql.*;
import java.util.*;

public class StudentInfo {
	
	private String name;//姓名
	private String number;//学号
	private String sex;//性别
	private String born;//出生日期
	private String address;//地址
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getBorn() {
		return born;
	}
	public void setBorn(String born) {
		this.born = born;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	
	
	/**
	 * 返回所有的Student对象列表
	 * */
	public static ArrayList<StudentInfo> getStudentList(){
		ArrayList<StudentInfo> list=new ArrayList<StudentInfo>();
		String sql="select * from student";
		DBBean jdbc=new DBBean();
		ResultSet rs=jdbc.executeQuery(sql);
        try {
			while(rs.next()){
				StudentInfo bi=new StudentInfo();
				bi.setName(rs.getString("name"));
				bi.setNumber(rs.getString("number"));
				bi.setSex(rs.getString("sex"));
				bi.setBorn(rs.getString("born"));
				bi.setAddress(rs.getString("address"));
				list.add(bi);
			}
			 rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        jdbc.close();
        return list;
	}
	/**
	 *  返回指定number的Student对象
	 * */
	public static StudentInfo getStudentById(String number){
		String sql="select * from student where number="+number;
		DBBean jdbc=new DBBean();
		ResultSet rs=jdbc.executeQuery(sql);
		StudentInfo bi=new StudentInfo();
        try {
			if(rs.next()){
				bi.setName(rs.getString("name"));
				bi.setNumber(rs.getString("number"));
				bi.setSex(rs.getString("sex"));
				bi.setBorn(rs.getString("born"));
				bi.setAddress(rs.getString("address"));
			}
			 rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        jdbc.close();
        return bi;
	}
	/**
	 * 修改指定参数的student
	 * */
	public static int updateStudnet(String number,String name,String sex,String born,String address){
		int result=0;
		String sql="update student set name='"+name+"',sex='"+sex+"',born="+born+" where address="+address;
		DBBean jdbc=new DBBean();
		result=jdbc.executeUpdate(sql);
		jdbc.close();
		return result;
	}
	
	/**
	 *  删除指定number的student
	 * */
	public static int deleteStudent(String number){
		int result=0;
		String sql="delete from student where number="+number;
		DBBean jdbc=new DBBean();
		result=jdbc.executeUpdate(sql);
		jdbc.close();
		return result;
	}
	/**
	 * 新增一条student记录
	 * */
	public static int addStudent(String number,String name,String sex,String born,String address){
		int result=0;
		String sql="insert into student values('"+name+"','"+number+"','"+sex+"','"+born+"','"+address+"')";
		DBBean jdbc=new DBBean();
		result=jdbc.executeUpdate(sql);
		jdbc.close();
		return result;
	}
}
