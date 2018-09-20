package com.tes1.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.tes1.entity.Cmenu;
import com.tes1.entity.Pmenu;
import com.tes1.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ManagerService {
	@Autowired
	private com.tes1.dao.managerDao managerDao;
	public User getUser(User user){
		return managerDao.getUser(user);
	};
	public List<Pmenu> getPmenu(User user){
		return managerDao.getPmenu(user);
	};
	public List<Cmenu> getCmenu(int i){;
	return managerDao.getCmenu(i);
	
	}
	//�ж��û��Ƿ��½�ɹ�
	public boolean execute(int ycode,String ypassword){
		User user=new User();
		user.setYcode(ycode);
		user.setYpassword(ypassword);
		
		User u=managerDao.getUser(user);
		if(u!=null){
			return true;
		}else{
			return false;
		}
	}
	//�ж��û���¼����
	public void check(HttpSession session){
		User user=(User)session.getAttribute("curUser");
		user.getYtype();
	}
}
