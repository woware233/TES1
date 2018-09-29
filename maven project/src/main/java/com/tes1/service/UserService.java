package com.tes1.service;

import com.tes1.entity.Department;
import com.tes1.entity.Tree;
import com.tes1.entity.User;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.awt.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class UserService {
	@Autowired
	private com.tes1.dao.managerDao managerDao;

	public User getUser(User user) {
		return managerDao.getUser(user);
	}

	public List<Tree> getParent(int userid) {
		return managerDao.getParent(userid);
	}
	//

	public List<Department> getDepartment(Map<String, Object> map) {
		return managerDao.getDepartment(map);}
	public Long getTotal(Map<String, Object> map) {
		return managerDao.getTotal(map);
	}

	public int addDept(Department department) {
		return managerDao.addDept(department);
	}

	public int updateDept(Department department) {
		return managerDao.updateDept(department);
	}

	public int deleteDept(int DeptID) {
		return managerDao.deleteDept(DeptID);
	}

	public boolean execute(String username, String password) {
		User user = new User();
		user.setUsername(username);
		user.setPassword(password);
		User u = managerDao.getUser(user);
		if (u != null) {
			return true;
		} else {
			return false;
		}
	}

	//判断权限
	public String check(HttpSession session) {
		User user = (User) session.getAttribute("curUser");
		user.getUserid();
		return null;
	}
//树
    public List<Tree> getIndexTree(int userid) {
	List<Tree> topList = new ArrayList<>();
	List<Tree> list = managerDao.getParent(userid);
	for (Tree tree : list) {

		if (tree.getParentID() == "0") {
			tree.setChildren(prepareTreeChild(tree.getParentID(), list));
			topList.add(tree);
			System.out.println(topList);
		}
	}
	return topList;
}
	private List<Tree> prepareTreeChild(String parentID, List<Tree> list) {
		List<Tree> childList = new ArrayList<>();
		for (Tree tree : list) {

			if (tree.getParentID() != "0" && tree.getTreeid().equals(parentID)) {
				childList.add(tree);
			}
		}
		for (Tree tree : childList) {
			if (tree.getIsLeaf() == 1) {
				tree.setChildren(prepareTreeChild(tree.getTreeid(), list));
			}
		}

		if (childList.size() == 0) {
			return null;
		}
		return childList;

	}


}
