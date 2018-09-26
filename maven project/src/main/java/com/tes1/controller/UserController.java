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


    @RequestMapping(value = "/getIndexTree", method = RequestMethod.GET)
    @ResponseBody
    public List<Tree> getIndexTree(HttpSession session) {
        User user = (User) session.getAttribute("curUser");
        List<Tree> topList = new ArrayList<>();
        List<Tree> list = userService.getParent(user.getUserid());
        for (Tree tree : list) {
            // 遍历所有节点，将父菜单id与传过来的id比较
            if (tree.getParentID() == "0") {
                tree.setChildren(prepareTreeChild(tree.getParentID(), list));
                topList.add(tree);
            }
        }
        return topList;
    }
    private List<Tree> prepareTreeChild(String parentID, List<Tree> list) {
        List<Tree> childList = new ArrayList<>();
        for (Tree tree : list) {
            // 遍历所有节点，将父菜单id与传过来的id比较
            if (tree.getParentID() != "0" && tree.getParentID().equals(parentID)) {
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