package com.tes1.entity;

public class Department {
    private int DeptID;
    private String DeptCode;
    private String DeptName;
    private String DeptDesn;
    private String State;

    public int getDeptID() {
        return DeptID;
    }

    public void setDeptID(int deptID) {
        DeptID = deptID;
    }

    public String getDeptCode() {
        return DeptCode;
    }

    public void setDeptCode(String deptCode) {
        DeptCode = deptCode;
    }

    public String getDeptName() {
        return DeptName;
    }

    public void setDeptName(String deptName) {
        DeptName = deptName;
    }

    public String getDeptDesn() {
        return DeptDesn;
    }

    public void setDeptDesn(String deptDesn) {
        DeptDesn = deptDesn;
    }

    public String getState() {
        return State;
    }

    public void setState(String state) {
        State = state;
    }
}
