package com.lh.entity;


import org.springframework.stereotype.Component;




@Component
public class RolesModules {
private Integer mid;
private Integer rid;
private Integer rmid;
public Integer getMid() {
	return mid;
}
public void setMid(Integer mid) {
	this.mid = mid;
}
public Integer getRid() {
	return rid;
}
public void setRid(Integer rid) {
	this.rid = rid;
}
public Integer getRmid() {
	return rmid;
}
public void setRmid(Integer rmid) {
	this.rmid = rmid;
}
@Override
public String toString() {
	return "RolesModules [mid=" + mid + ", rid=" + rid + ", rmid=" + rmid + "]";
}

}
