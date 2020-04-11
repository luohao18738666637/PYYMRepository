package com.lh.entity;

import org.springframework.stereotype.Component;

@Component
public class Userroles {
	private Integer	urid;
	private Integer	uid;
	private Integer	rid;
	private Integer	usy1;
	private String	usy2;
	public Integer getUrid() {
		return urid;
	}
	public void setUrid(Integer urid) {
		this.urid = urid;
	}
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getRid() {
		return rid;
	}
	public void setRid(Integer rid) {
		this.rid = rid;
	}
	public Integer getUsy1() {
		return usy1;
	}
	public void setUsy1(Integer usy1) {
		this.usy1 = usy1;
	}
	public String getUsy2() {
		return usy2;
	}
	public void setUsy2(String usy2) {
		this.usy2 = usy2;
	}
	
	
	
}
