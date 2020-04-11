package com.lh.entity;

import java.util.List;

import org.springframework.stereotype.Component;
@Component
public class FenyeStu {
	private Integer page;
	private Integer rows;
	private Integer total;
	private List<Users> list;
	private String sname;
	private String sphone;
	private String qq;
	private Integer sfyouxiao;
	private Integer sFhuifang; 
	private String startjinbanTime;
	private String endjinbanTime;
	private String startshangmengTime;
	private String endshangmengTime;
	private String startfirsthuifangTime;
	private String endfirsthuifangTime;
	private String startcreateTime;
	private String endcreateTime;
	private String startjiaofeiTime;
	private String endjiaofeiTime;
	private Integer sFjiaofei;
	private Integer askid;
	private Integer netaskid;
	
	public Integer getNetaskid() {
		return netaskid;
	}
	public void setNetaskid(Integer netaskid) {
		this.netaskid = netaskid;
	}
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
	public List<Users> getList() {
		return list;
	}
	public void setList(List<Users> list) {
		this.list = list;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getSphone() {
		return sphone;
	}
	public void setSphone(String sphone) {
		this.sphone = sphone;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public Integer getSfyouxiao() {
		return sfyouxiao;
	}
	public void setSfyouxiao(Integer sfyouxiao) {
		this.sfyouxiao = sfyouxiao;
	}
	public Integer getsFhuifang() {
		return sFhuifang;
	}
	public void setsFhuifang(Integer sFhuifang) {
		this.sFhuifang = sFhuifang;
	}
	public String getStartjinbanTime() {
		return startjinbanTime;
	}
	public void setStartjinbanTime(String startjinbanTime) {
		this.startjinbanTime = startjinbanTime;
	}
	public String getEndjinbanTime() {
		return endjinbanTime;
	}
	public void setEndjinbanTime(String endjinbanTime) {
		this.endjinbanTime = endjinbanTime;
	}
	public String getStartshangmengTime() {
		return startshangmengTime;
	}
	public void setStartshangmengTime(String startshangmengTime) {
		this.startshangmengTime = startshangmengTime;
	}
	public String getEndshangmengTime() {
		return endshangmengTime;
	}
	public void setEndshangmengTime(String endshangmengTime) {
		this.endshangmengTime = endshangmengTime;
	}
	public String getStartfirsthuifangTime() {
		return startfirsthuifangTime;
	}
	public void setStartfirsthuifangTime(String startfirsthuifangTime) {
		this.startfirsthuifangTime = startfirsthuifangTime;
	}
	public String getEndfirsthuifangTime() {
		return endfirsthuifangTime;
	}
	public void setEndfirsthuifangTime(String endfirsthuifangTime) {
		this.endfirsthuifangTime = endfirsthuifangTime;
	}
	public String getStartcreateTime() {
		return startcreateTime;
	}
	public void setStartcreateTime(String startcreateTime) {
		this.startcreateTime = startcreateTime;
	}
	public String getEndcreateTime() {
		return endcreateTime;
	}
	public void setEndcreateTime(String endcreateTime) {
		this.endcreateTime = endcreateTime;
	}
	public String getStartjiaofeiTime() {
		return startjiaofeiTime;
	}
	public void setStartjiaofeiTime(String startjiaofeiTime) {
		this.startjiaofeiTime = startjiaofeiTime;
	}
	public String getEndjiaofeiTime() {
		return endjiaofeiTime;
	}
	public void setEndjiaofeiTime(String endjiaofeiTime) {
		this.endjiaofeiTime = endjiaofeiTime;
	}
	public Integer getsFjiaofei() {
		return sFjiaofei;
	}
	public void setsFjiaofei(Integer sFjiaofei) {
		this.sFjiaofei = sFjiaofei;
	}
	public Integer getAskid() {
		return askid;
	}
	public void setAskid(Integer askid) {
		this.askid = askid;
	}
	@Override
	public String toString() {
		return "FenyeStu [page=" + page + ", rows=" + rows + ", total=" + total + ", list=" + list + ", sname=" + sname
				+ ", sphone=" + sphone + ", qq=" + qq + ", sfyouxiao=" + sfyouxiao + ", sFhuifang=" + sFhuifang
				+ ", startjinbanTime=" + startjinbanTime + ", endjinbanTime=" + endjinbanTime + ", startshangmengTime="
				+ startshangmengTime + ", endshangmengTime=" + endshangmengTime + ", startfirsthuifangTime="
				+ startfirsthuifangTime + ", endfirsthuifangTime=" + endfirsthuifangTime + ", startcreateTime="
				+ startcreateTime + ", endcreateTime=" + endcreateTime + ", startjiaofeiTime=" + startjiaofeiTime
				+ ", endjiaofeiTime=" + endjiaofeiTime + ", sFjiaofei=" + sFjiaofei + ", askid=" + askid + "]";
	}
}
