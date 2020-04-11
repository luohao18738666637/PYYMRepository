package com.lh.entity;

import java.util.List;

public class LeftTree {
	private Integer id;
	private String text;
	private String path;
	private Integer parentId;
	private List<LeftTree> children;
	private Integer weight;
	private Boolean checked;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public List<LeftTree> getChildren() {
		return children;
	}
	public void setChildren(List<LeftTree> children) {
		this.children = children;
	}
	public Integer getWeight() {
		return weight;
	}
	public void setWeight(Integer weight) {
		this.weight = weight;
	}
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
	@Override
	public String toString() {
		return "LeftTree [id=" + id + ", text=" + text + ", path=" + path + ", parentId=" + parentId + ", children="
				+ children + ", weight=" + weight + ", checked=" + checked + "]";
	}
	
	
}
