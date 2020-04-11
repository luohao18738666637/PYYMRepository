package com.lh.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class Fenyedt {
private Integer page;
private Integer rows;
private Integer total;
private List<Dongtai> list;
private Integer status;
private Integer zxsid;

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

public List<Dongtai> getList() {
	return list;
}

public void setList(List<Dongtai> list) {
	this.list = list;
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

@Override
public String toString() {
	return "Fenyedt [page=" + page + ", rows=" + rows + ", total=" + total + ", list=" + list + "]";
}


}
