package com.lh.entity;

import org.springframework.stereotype.Component;

@Component
public class Roles {
private Integer rid;
private String rname;
public Integer getRid() {
	return rid;
}
public void setRid(Integer rid) {
	this.rid = rid;
}
public String getRname() {
	return rname;
}
public void setRname(String rname) {
	this.rname = rname;
}
@Override
public String toString() {
	return "Roles [rid=" + rid + ", rname=" + rname + "]";
}
public Roles(Integer rid, String rname) {
	super();
	this.rid = rid;
	this.rname = rname;
}
public Roles(String rname) {
	super();
	this.rname = rname;
}
public Roles() {
	super();
}


}
