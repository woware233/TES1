package com.tes1.entity;
import java.util.List;

public class Tree {
    private String treeid;
    private String Text;
    private String Desn;
    private String ParentID;
    private int isLeaf;
    private String url; 
    private List<Tree> children;

    public String getTreeid() {
        return treeid;
    }

    public void setTreeid(String treeid) {
        this.treeid = treeid;
    }

    public String getText() {
        return Text;
    }

    public void setText(String text) {
        Text = text;
    }

    public String getDesn() {
        return Desn;
    }

    public void setDesn(String desn) {
        Desn = desn;
    }

    public String getParentID() {
        return ParentID;
    }

    public void setParentID(String parentID) {
        ParentID = parentID;
    }

    public int getIsLeaf() {
        return isLeaf;
    }

    public void setIsLeaf(int isLeaf) {
        this.isLeaf = isLeaf;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public List<Tree> getChildren() {
        return children;
    }

    public void setChildren(List<Tree> children) {
        this.children = children;
    }
    @Override
    public String toString() {
        return "Menu [id=" + treeid + ", mName=" + Text + ", mParent=" + ParentID
                + ", mUrl=" + url + "]";
    }

}
