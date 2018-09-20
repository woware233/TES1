package com.tes1.entity;

import java.util.List;

public class Pmenu {
private int pmcode;
private String title;
private String url;
private int ptype;
private List<Cmenu> children;

public List<Cmenu> getChildren() {
	return children;
}

public void setChildren(List<Cmenu> children) {
	this.children = children;
}

public String getTitle() {
	return title;
}

public int getPmcode() {
	return pmcode;
}

public void setPmcode(int pmcode) {
	this.pmcode = pmcode;
}

public void setTitle(String title) {
	this.title = title;
}
public String getUrl() {
	return url;
}
public void setUrl(String url) {
	this.url = url;
}
public int getPtype() {
	return ptype;
}
public void setPtype(int ptype) {
	this.ptype = ptype;
}

}
