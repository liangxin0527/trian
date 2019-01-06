package com.dgut.trian.bean;

public class Class {
	
	private int id;
	private String name;
	private String tname;
	private String cname;
	private String starttime;
	private String endtime;
	private String address;
	private String season;
	private int onsale;
	private String createdtime;
	private int input;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	
	
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getSeason() {
		return season;
	}
	public void setSeason(String season) {
		this.season = season;
	}
	public int getOnsale() {
		return onsale;
	}
	public void setOnsale(int onsale) {
		this.onsale = onsale;
	}
	
	public String getCreatedtime() {
		return createdtime;
	}
	public void setCreatedtime(String createdtime) {
		this.createdtime = createdtime;
	}
	
	
	public int getInput() {
		return input;
	}
	public void setInput(int input) {
		this.input = input;
	}
	public Class(String name, String tname, String cname, String starttime, String endtime, String address,
			String season, int onsale, String createdtime) {
		this.name = name;
		this.tname = tname;
		this.cname = cname;
		this.starttime = starttime;
		this.endtime = endtime;
		this.address = address;
		this.season = season;
		this.onsale = onsale;
		this.createdtime = createdtime;
	}
	public Class() {
		
	}
	
	
}
