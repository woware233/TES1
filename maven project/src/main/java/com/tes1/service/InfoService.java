package com.tes1.service;



import com.tes1.entity.Tree;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class InfoService {
	@Autowired
	private com.tes1.dao.managerDao managerDao;

/*	private List<Tree> getTreeList(List<Tree> roots){
		List<Tree> list = new ArrayList<Tree>();
		// 先找到所有的一级菜单
		for (int i=0;i<roots.size();i++){
			Tree tree = roots.get(i);
			//一级菜单  没有父节点
			if (tree.getParentID()=="0"){
				list.add(tree);
			}
		}
		for (Tree tree: list) {
			tree.setChildren(getChild(tree.getTreeid(),roots));
		}

		return list;

	}
	private List<Tree> getChild(String treeid, List<Tree> root) {
		// 子菜单
		List<Tree> childList = new ArrayList<Tree>();

		for (Tree tree : root) {
			// 遍历所有节点，将父菜单id与传过来的id比较
			if (!StringUtils.isEmpty(tree.getParentID())) {
				if (tree.getParentID().equals(treeid)) {
					childList.add(tree);
				}
			}
		}

		// 把子菜单的子菜单再循环一遍
		for (Tree tree : childList) {// 没有url子菜单还有子菜单
			if (StringUtils.isEmpty(tree.getUrl())) {
				// 递归
				tree.setChildren(getChild(tree.getTreeid(), root));
			}
		}

		// 递归退出条件
		if (childList.size() == 0) {
			return null;
		}
		System.out.println(treeid);
		return childList;
	}*/

}
