package com.tes1.dao;

import com.tes1.entity.Department;
import com.tes1.entity.Tree;
import com.tes1.entity.User;

import java.util.List;
import java.util.Map;

public interface managerDao {
	User getUser(User user);
    List<Tree> getParent(int userid);
    List<Department> getDepartment(Map<String, Object> map);
    Long getTotal(Map<String, Object> map);
    int addDept(Department department);
    int updateDept(Department department);
    int deleteDept(int DeptID);
}
