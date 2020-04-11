package com.lh.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class FenyeRoles {
private Integer page;
private Integer rows;
private Integer total;
private List<Roles> list;
private String rname;
public Integer getPage() {
	return page;
}
public void setPage(Integer page) {
	this.page = page;
}
public Integer getRows() {
	return rows;
}
public void setRows(Integer rows) {
	this.rows = rows;
}
public Integer getTotal() {
	return total;
}
public void setTotal(Integer total) {
	this.total = total;
}
public List<Roles> getList() {
	return list;
}
public void setList(List<Roles> list) {
	this.list = list;
}
public String getRname() {
	return rname;
}
public void setRname(String rname) {
	this.rname = rname;
}
@Override
public String toString() {
	return "FenyeRoles [page=" + page + ", rows=" + rows + ", total=" + total + ", list=" + list + ", rname=" + rname
			+ "]";
}


}
