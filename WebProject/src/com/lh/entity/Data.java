package com.lh.entity;

import org.springframework.stereotype.Component;

@Component
public class Data {
	private Integer	dataid;
	private Integer	sid;
	private Integer	uid;
	private String	startTime;
	private String	endTime;
	private String	hFTime;
	private String	hFqingkuang;
	private String	gZneirong;
	private String	gZfangshi;
	private String	xCgenzhongTime;
	private Integer	day1;
	private String	day2;
	private String  zname;
	private String  sname;
	
	
	

	public String getZname() {
		return zname;
	}
	public void setZname(String zname) {
		this.zname = zname;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public Integer getDataid() {
		return dataid;
	}
	public void setDataid(Integer dataid) {
		this.dataid = dataid;
	}
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String gethFTime() {
		return hFTime;
	}
	public void sethFTime(String hFTime) {
		this.hFTime = hFTime;
	}
	public String gethFqingkuang() {
		return hFqingkuang;
	}
	public void sethFqingkuang(String hFqingkuang) {
		this.hFqingkuang = hFqingkuang;
	}
	public String getgZneirong() {
		return gZneirong;
	}
	public void setgZneirong(String gZneirong) {
		this.gZneirong = gZneirong;
	}
	public String getgZfangshi() {
		return gZfangshi;
	}
	public void setgZfangshi(String gZfangshi) {
		this.gZfangshi = gZfangshi;
	}
	public String getxCgenzhongTime() {
		return xCgenzhongTime;
	}
	public void setxCgenzhongTime(String xCgenzhongTime) {
		this.xCgenzhongTime = xCgenzhongTime;
	}
	public Integer getDay1() {
		return day1;
	}
	public void setDay1(Integer day1) {
		this.day1 = day1;
	}
	public String getDay2() {
		return day2;
	}
	public void setDay2(String day2) {
		this.day2 = day2;
	}
	@Override
	public String toString() {
		return "Data [dataid=" + dataid + ", sid=" + sid + ", uid=" + uid + ", startTime=" + startTime + ", endTime="
				+ endTime + ", hFTime=" + hFTime + ", hFqingkuang=" + hFqingkuang + ", gZneirong=" + gZneirong
				+ ", gZfangshi=" + gZfangshi + ", xCgenzhongTime=" + xCgenzhongTime + ", day1=" + day1 + ", day2="
				+ day2 + ", zname=" + zname + ", sname=" + sname + "]";
	}

	
	
	
	
	
}
