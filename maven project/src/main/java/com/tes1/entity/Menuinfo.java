package com.tes1.entity;

import java.util.List;

public class Menuinfo {
private String g2name;
private String g2code;
private List<Pmenu> menulist;
public String getG2name() {
	return g2name;
}
public void setG2name(String g2name) {
	this.g2name = g2name;
}
public String getG2code() {
	return g2code;
}
public void setG2code(String g2code) {
	this.g2code = g2code;
}
public List<Pmenu> getMenulist() {
	return menulist;
}
public void setMenulist(List<Pmenu> menulist) {
	this.menulist = menulist;
}
@Override
     public String toString() {
         return "RoleInfo [roleid=" +g2code + ", rolename=" + g2name + ", menulist=" + menulist + "]";
    }
}
