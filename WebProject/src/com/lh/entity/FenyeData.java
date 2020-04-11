package com.lh.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class FenyeData {
	
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<Data> rows;
	
	private String  sname;
	private String  zname;		
	private String	startTime;
	private String	endTime;
	private String	hFqingkuang;
	private String	gZfangshi;
	private Integer uid;
	
	public Integer getUid() {
		return uid;
	}
	public void setUid(Integer uid) {
		this.uid = uid;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getTotal() {
		return total;
	}
	public void setTotal(Integer total) {
		this.total = total;
	}

	public List<Data> getRows() {
		return rows;
	}
	public void setRows(List<Data> rows) {
		this.rows = rows;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	
	public String getZname() {
		return zname;
	}
	public void setZname(String zname) {
		this.zname = zname;
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
	public String gethFqingkuang() {
		return hFqingkuang;
	}
	public void sethFqingkuang(String hFqingkuang) {
		this.hFqingkuang = hFqingkuang;
	}
	public String getgZfangshi() {
		return gZfangshi;
	}
	public void setgZfangshi(String gZfangshi) {
		this.gZfangshi = gZfangshi;
	}
	@Override
	public String toString() {
		return "FenyeData [page=" + page + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + ", sname="
				+ sname + ", zname=" + zname + ", startTime=" + startTime + ", endTime=" + endTime + ", hFqingkuang="
				+ hFqingkuang + ", gZfangshi=" + gZfangshi + "]";
	}
	
	
	
	
	
	
	
}
