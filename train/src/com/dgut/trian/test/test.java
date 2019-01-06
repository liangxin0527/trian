package com.dgut.trian.test;

import java.sql.Date;
import java.text.SimpleDateFormat;


public class test {
	
	
	public static void Date() {
		java.util.Date d=new java.util.Date();

		SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");

		String dateStr = s.format(d);
		System.out.println(dateStr);
		System.out.println(System.currentTimeMillis());
	}
	
	public static void main(String[] args) {
		Date();
	}
}
