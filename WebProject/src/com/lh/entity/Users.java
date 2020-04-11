package com.lh.entity;

import java.util.List;

import org.springframework.stereotype.Component;

@Component
public class Users {
private int uid;
private String zname;
private String uname;
private String upassword;
private String upassword1;
private String upassword2;
private String uphone;
private int lockout;
private String uemail;
private int qiandao;
private String usy2;
private String userTime;
private String yzm;
private String uuid;
private List<Integer> list;
private String qiandaoTime;
private Integer status;

public Integer getStatus() {
	return status;
}

public void setStatus(Integer status) {
	this.status = status;
}

public String getQiandaoTime() {
	return qiandaoTime;
}

public void setQiandaoTime(String qiandaoTime) {
	this.qiandaoTime = qiandaoTime;
}

public String getUuid() {
	return uuid;
}

public void setUuid(String uuid) {
	this.uuid = uuid;
}

public List<Integer> getList() {
	return list;
}

public void setList(List<Integer> list) {
	this.list = list;
}

public int getUid() {
	return uid;
}

public void setUid(int uid) {
	this.uid = uid;
}

public String getZname() {
	return zname;
}

public void setZname(String zname) {
	this.zname = zname;
}

public String getUname() {
	return uname;
}

public void setUname(String uname) {
	this.uname = uname;
}

public String getUpassword() {
	return upassword;
}

public void setUpassword(String upassword) {
	this.upassword = upassword;
}

public String getUpassword1() {
	return upassword1;
}

public void setUpassword1(String upassword1) {
	this.upassword1 = upassword1;
}

public String getUpassword2() {
	return upassword2;
}

public void setUpassword2(String upassword2) {
	this.upassword2 = upassword2;
}

public String getUphone() {
	return uphone;
}

public void setUphone(String uphone) {
	this.uphone = uphone;
}

public int getLockout() {
	return lockout;
}

public void setLockout(int lockout) {
	this.lockout = lockout;
}

public String getUemail() {
	return uemail;
}

public void setUemail(String uemail) {
	this.uemail = uemail;
}

public int getQiandao() {
	return qiandao;
}

public void setQiandao(int qiandao) {
	this.qiandao = qiandao;
}

public String getUsy2() {
	return usy2;
}

public void setUsy2(String usy2) {
	this.usy2 = usy2;
}

public String getUserTime() {
	return userTime;
}

public void setUserTime(String userTime) {
	this.userTime = userTime;
}

public String getYzm() {
	return yzm;
}

public void setYzm(String yzm) {
	this.yzm = yzm;
}



@Override
public String toString() {
	return "Users [uid=" + uid + ", zname=" + zname + ", uname=" + uname + ", upassword=" + upassword + ", upassword1="
			+ upassword1 + ", upassword2=" + upassword2 + ", uphone=" + uphone + ", lockout=" + lockout + ", uemail="
			+ uemail + ", qiandao=" + qiandao + ", usy2=" + usy2 + ", userTime=" + userTime + ", yzm=" + yzm + ", uuid="
			+ uuid + ", list=" + list + ", qiandaoTime=" + qiandaoTime + ", status=" + status + "]";
}

public Users(String zname, String uname, String upassword, String uphone, String uemail, String userTime) {
	super();
	this.zname = zname;
	this.uname = uname;
	this.upassword = upassword;
	this.uphone = uphone;
	this.uemail = uemail;
	this.userTime = userTime;
}

public Users(String uname, String upassword) {
	super();
	this.uname = uname;
	this.upassword = upassword;
}

public Users(int uid, int qiandao, List<Integer> list) {
	super();
	this.uid = uid;
	this.qiandao = qiandao;
	this.list = list;
}
public Users(int uid, int qiandao, String qiandaoTime) {
	super();
	this.uid = uid;
	this.qiandao = qiandao;
	this.qiandaoTime = qiandaoTime;
}



public Users(int uid, int lockout, Integer status) {
	super();
	this.uid = uid;
	this.lockout = lockout;
	this.status = status;
}

public Users(int uid, Integer status) {
	super();
	this.uid = uid;
	this.status = status;
}

public Users(int uid, String zname, String uphone, String uemail) {
	super();
	this.uid = uid;
	this.zname = zname;
	this.uphone = uphone;
	this.uemail = uemail;
}

public Users(String uname, String upassword, String uphone, int lockout, String uemail, String userTime,
		Integer status) {
	super();
	this.uname = uname;
	this.upassword = upassword;
	this.uphone = uphone;
	this.lockout = lockout;
	this.uemail = uemail;
	this.userTime = userTime;
	this.status = status;
}

public Users() {
	super();
}
}
