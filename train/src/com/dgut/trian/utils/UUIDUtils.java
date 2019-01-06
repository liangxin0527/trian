package com.dgut.trian.utils;

import java.text.SimpleDateFormat;
import java.util.UUID;

public class UUIDUtils {
	
	
	public static String getDate() {
		java.util.Date d=new java.util.Date();

		SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");

		String dateStr = s.format(d);
		return dateStr;
	}
	
	/**
	 * 随机生成id
	 * @return
	 */
	public static String getId(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
	
	/**
	 * 生成随机码
	 * @return
	 */
	public static String getCode(){
		return getId();
	}
	
}
