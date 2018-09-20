package com.tes1.entity;

import java.util.List;

public class Tree {
private String id;
private String text;
private String pid;
private List<Tree> treelist;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getText() {
	return text;
}
public void setText(String text) {
	this.text = text;
}
public String getPid() {
	return pid;
}
public void setPid(String pid) {
	this.pid = pid;
}
public List<Tree> getTreelist() {
	return treelist;
}
public void setTreelist(List<Tree> treelist) {
	this.treelist = treelist;
}

}
