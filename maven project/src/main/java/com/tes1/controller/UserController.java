package com.tes1.controller;

import javax.servlet.http.HttpSession;

import com.tes1.entity.Tree;
import com.tes1.entity.User;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tes1.service.InfoService;
import com.tes1.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    UserService userService;
    InfoService infoService;

    @RequestMapping("/login")
    public String login() {
        return "login";
    }

    @RequestMapping("/welcome")
    public String welcome() {
        return "welcome";
    }

    @RequestMapping("/submit")
    public String login_submit(String username, String password, HttpSession session, Model model) {
        boolean result = userService.execute(username, password);
        if (result) {
            Tree tree = new Tree();
            User cnd = new User();
            cnd.setUsername(username);
            cnd.setPassword(password);
            User u = userService.getUser(cnd);
            session.setAttribute("curUser", u);
            List<Tree> list = userService.getParent(u.getUserid());
            model.addAttribute("Tree", list);
            for (int i = 0; i < list.size(); i++) {
                for (int j = 0; j < list.size(); j++) {
                    if (list.get(i).getTreeid() == list.get(j).getParentID()) {
                        List<Tree> list2 = userService.getParent(u.getUserid());
                        model.addAttribute("Treec", list2);
                    }
                }
            }
            return "index";
        } else {
            return "login/login_fail";
        }

    }

    @RequestMapping(value = "/getTree", method = RequestMethod.GET)
    public @ResponseBody Map<String, Object> getTree(HttpSession session) {
        User user=(User)session.getAttribute("curUser");

        Map<String, Object> result = new HashMap<String, Object>();
        try {
            List<Tree> tree = userService.getIndexTree(user.getUserid());
            result.put("data", tree);
            result.put("flag", "success");
        } catch (Exception e) {
            result.put("flag", "error");
            e.printStackTrace();
        }
        return result;
    }






}