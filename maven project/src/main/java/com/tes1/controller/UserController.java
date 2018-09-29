package com.tes1.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.tes1.entity.Department;
import com.tes1.entity.PageBean;
import com.tes1.entity.Tree;
import com.tes1.entity.User;
import com.tes1.util.ResponseUtil;
import com.tes1.util.StringUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.tes1.service.InfoService;
import com.tes1.service.UserService;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.FileInputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
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

    @RequestMapping("/dlist")
    public String list() { return "list/Deptlist"; }

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

    @RequestMapping("/list")
    public String list(@RequestParam(value="page",required=false) String page, @RequestParam(value="rows",required=false) String rows, Department dept, HttpServletResponse res) throws Exception{
        PageBean pageBean=new PageBean(Integer.parseInt(page),Integer.parseInt(rows));
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("DeptName", StringUtil.formatLike(dept.getDeptName()));
        map.put("start", pageBean.getStart());
        map.put("size", pageBean.getPageSize());
        List<Department> deptList=userService.getDepartment(map);
        Long total=userService.getTotal(map);
        JSONObject result=new JSONObject();
        JSONArray jsonArray=JSONArray.fromObject(deptList);
        result.put("rows", jsonArray);
        System.out.println(jsonArray);
        result.put("total", total);
        ResponseUtil.write(res, result);
        return null;
    }

    @RequestMapping("/save")
    public String save(Department department,HttpServletResponse res) throws Exception{
        //操作记录条数，初始化为0
        Integer deptid= department.getDeptID();
        int resultTotal = 0;
        if (deptid == 0) {
            resultTotal = userService.addDept(department);
            System.out.println("YES");
        }else{
            resultTotal = userService.updateDept(department);
        }
        JSONObject jsonObject = new JSONObject();
        if(resultTotal > 0){
            jsonObject.put("success", true);
        }else{
            jsonObject.put("success", false);
        }
        ResponseUtil.write(res, jsonObject);
        return null;
    }

    @RequestMapping("/delete")
    public String delete(@RequestParam(value="ids") String ids,HttpServletResponse res) throws Exception{
        String[] idStr = ids.split(",");
        JSONObject jsonObject = new JSONObject();
        for (String id : idStr) {
            userService.deleteDept(Integer.parseInt(id));
        }
        jsonObject.put("success", true);
        ResponseUtil.write(res, jsonObject);
        return null;
    }



}