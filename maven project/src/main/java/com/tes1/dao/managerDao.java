package com.tes1.dao;

import java.util.List;

import com.tes1.entity.Cmenu;
import com.tes1.entity.Pmenu;
import com.tes1.entity.User;
import com.tes1.entity.Menurelation;
import com.tes1.entity.Tree;

public interface managerDao {
	User getUser(User user);
	List<Pmenu> getPmenu(User user);
	List<Cmenu> getCmenu(int i);
	List<Tree> findByPid(String pid);  
    List<Tree> findById(String id);  
}
