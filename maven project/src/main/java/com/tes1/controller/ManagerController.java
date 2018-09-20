package com.tes1.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.tes1.entity.Pmenu;
import com.tes1.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.tes1.entity.Tree;
import com.tes1.service.InfoService;
import com.tes1.service.ManagerService;

@Controller
public class ManagerController {
	@Autowired
	ManagerService managerService;
	InfoService infoService;

	@RequestMapping("/login")
	public String login(){
		return "login";
	}

	@RequestMapping("/submit")
	public String login_submit(int ycode,String ypassword,HttpSession session,Model model){
		boolean result=managerService.execute(ycode,ypassword);
		if(result){
			User cnd=new User();
			cnd.setYcode(ycode);
			cnd.setYpassword(ypassword);
			User u=managerService.getUser(cnd);
			session.setAttribute("curUser", u);//session����type�Ա�
			List<Pmenu> list=managerService.getPmenu(u);//����Աһ���˵�����
			model.addAttribute("pmenu", list);			 
			return "index";
		}else{
			return "login/login_fail";
		}
	}
	@RequestMapping(value = "/getTree.do", method = RequestMethod.POST)  
    @ResponseBody  //��ע���������ֵ������ͼ�����֣�ֱ��д�� http response body��  
    public List<Tree> getTree(){  
        List<Tree> root = infoService.findById("1001");  //��ȡ���ڵ㣨��ȡ��ֵ�浽list�У�  
        net.sf.json.JSONArray jsonArray = net.sf.json.JSONArray.fromObject(buildTree(root));  
        System.out.println(jsonArray.toString());  
  
        return buildTree(root);  
    }  
    public List<Tree> buildTree(List<Tree> root){  
        for(int i=0;i<root.size();i++){  
            List<Tree> children = infoService.findByPid(root.get(i).getId()); //��ѯĳ�ڵ���ӽڵ㣨��ȡ����list��  
            buildTree(children);      
            root.get(i).setTreelist(children);
        }  
        return root;  
    }  
	   
}
