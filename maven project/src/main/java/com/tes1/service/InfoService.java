package com.tes1.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tes1.entity.Menurelation;
import com.tes1.entity.Tree;

@Service
public class InfoService {
	@Autowired
	private com.tes1.dao.managerDao managerDao;
	

	public List<Tree> findByPid(String pid) {     
        return managerDao.findByPid(pid);  
    }  
  
 
    public List<Tree> findById(String id) {  
        return managerDao.findById("1001");  
    }  
}
