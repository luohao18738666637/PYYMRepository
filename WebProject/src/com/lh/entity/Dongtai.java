package com.lh.entity;

import org.springframework.stereotype.Component;

@Component

public class Dongtai {
private Integer dtid;
private String dtext;
private Integer sendid;
private  String sname;
private String sendTime;
private Integer status;
private Integer zxsid;
private String uname; 


public Integer getDtid() {
	return dtid;
}


public void setDtid(Integer dtid) {
	this.dtid = dtid;
}


public String getDtext() {
	return dtext;
}


public void setDtext(String dtext) {
	this.dtext = dtext;
}


public Integer getSendid() {
	return sendid;
}


public void setSendid(Integer sendid) {
	this.sendid = sendid;
}


public String getSname() {
	return sname;
}


public void setSname(String sname) {
	this.sname = sname;
}


public String getSendTime() {
	return sendTime;
}


public void setSendTime(String sendTime) {
	this.sendTime = sendTime;
}


public Integer getStatus() {
	return status;
}


public void setStatus(Integer status) {
	this.status = status;
}


public Integer getZxsid() {
	return zxsid;
}


public void setZxsid(Integer zxsid) {
	this.zxsid = zxsid;
}


public String getUname() {
	return uname;
}


public void setUname(String uname) {
	this.uname = uname;
}


@Override
public String toString() {
	return "Dongtai [dtid=" + dtid + ", dtext=" + dtext + ", sendid=" + sendid + ", sname=" + sname + ", sendTime="
			+ sendTime + ", status=" + status + ", zxsid=" + zxsid + ", uname=" + uname + "]";
}


public Dongtai(Integer dtid, Integer status) {
	super();
	this.dtid = dtid;
	this.status = status;
}


public Dongtai(String dtext, Integer sendid, String sname, String sendTime, Integer status, Integer zxsid) {
	super();
	this.dtext = dtext;
	this.sendid = sendid;
	this.sname = sname;
	this.sendTime = sendTime;
	this.status = status;
	this.zxsid = zxsid;
}


public Dongtai() {
	super();
}

}
