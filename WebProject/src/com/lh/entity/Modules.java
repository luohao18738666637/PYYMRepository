package com.lh.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Modules {
private Integer mid;
private String mname;
private Integer parentId;
private String path;
private Integer weight;
private Integer rid;
@Override
public String toString() {
	return "Modules [mid=" + mid + ", mname=" + mname + ", parentId=" + parentId + ", path=" + path + ", weight="
			+ weight + ", rid=" + rid + "]";
}
public Integer getMid() {
	return mid;
}
public void setMid(Integer mid) {
	this.mid = mid;
}
public String getMname() {
	return mname;
}
public void setMname(String mname) {
	this.mname = mname;
}
public Integer getParentId() {
	return parentId;
}
public void setParentId(Integer parentId) {
	this.parentId = parentId;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
public Integer getWeight() {
	return weight;
}
public void setWeight(Integer weight) {
	this.weight = weight;
}
public Integer getRid() {
	return rid;
}
public void setRid(Integer rid) {
	this.rid = rid;
}
public Modules(String mname, Integer parentId, String path, Integer weight) {
	super();
	this.mname = mname;
	this.parentId = parentId;
	this.path = path;
	this.weight = weight;
}
public Modules(Integer mid, String mname, Integer parentId, String path, Integer weight) {
	super();
	this.mid = mid;
	this.mname = mname;
	this.parentId = parentId;
	this.path = path;
	this.weight = weight;
}
public Modules() {
	super();
}
}
