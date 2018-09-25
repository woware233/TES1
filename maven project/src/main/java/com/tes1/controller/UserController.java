package com.tes1.controller;

import javax.servlet.http.HttpSession;

import com.tes1.entity.Tree;
import com.tes1.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tes1.service.InfoService;
import com.tes1.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
public class UserController {
	@Autowired
    UserService userService;
	InfoService infoService;

	@RequestMapping("/login")
	public String login(){
		return "login";
	}

	@RequestMapping("/submit")
	public String login_submit(String username,String password,HttpSession session,Model model){
		boolean result= userService.execute(username,password);
		if(result){
		    Tree tree=new Tree();
			User cnd=new User();
			cnd.setUsername(username);
			cnd.setPassword(password);
			User u= userService.getUser(cnd);
			session.setAttribute("curUser", u);
			List<Tree> list=userService.getParent(u.getUserid());
            model.addAttribute("Tree",list);
			return "index";
		}else{
			return "login/login_fail";
		}
	}





}

