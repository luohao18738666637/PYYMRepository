package com.lh.entity;

import java.util.List;

import org.springframework.stereotype.Component;




@Component
public class FenyeUsers {
	private Integer page;
	private Integer pageSize;
	private Integer total;
	private List<Users> rows;
	
	private String	uname;
	private String	setTime;
	private String	endTime;
	private Integer	lockout;
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
	public List<Users> getRows() {
		return rows;
	}
	public void setRows(List<Users> rows) {
		this.rows = rows;
	}

	public String getSetTime() {
		return setTime;
	}
	public void setSetTime(String setTime) {
		this.setTime = setTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public Integer getLockout() {
		return lockout;
	}
	public void setLockout(Integer lockout) {
		this.lockout = lockout;
	}
	@Override
	public String toString() {
		return "FenyeUsers [page=" + page + ", pageSize=" + pageSize + ", total=" + total + ", rows=" + rows + ", uname="
				+ uname + ", setTime=" + setTime + ", endTime=" + endTime + ", lockout=" + lockout + "]";
	}

	
	
	

}
