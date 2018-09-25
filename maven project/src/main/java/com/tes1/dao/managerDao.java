package com.tes1.dao;

import com.tes1.entity.Tree;
import com.tes1.entity.User;

import java.util.List;

public interface managerDao {
	User getUser(User user);
    List<Tree> getParent(int userid);

}
