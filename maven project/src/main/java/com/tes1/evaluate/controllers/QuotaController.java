package com.tes1.evaluate.controllers;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tes1.evaluate.domain.Quota;
import com.tes1.evaluate.domain.Quotaid;
import com.tes1.evaluate.service.QuotaService;

import net.sf.json.JSONArray;

@Controller
public class QuotaController {
	@Autowired
	private QuotaService quotaService;
	/**
	 * 根据用户ID删除指标项
	 */
	@RequestMapping("/delquota")
	@ResponseBody
public Integer delquota(Integer id) {
		return quotaService.DelQuota(id);
}
	/**
	 * 根据用户ID获取指标列表
	 */
	@RequestMapping("/initQuotaTree")
	@ResponseBody
	public ModelAndView findQuotaList(HttpServletResponse response) {
		ModelAndView modelAndView = new ModelAndView("forward:/moduls/quota/quotaManager.jsp");
		return modelAndView;
	}
	
	/**
	 * 根据用户ID获取指标列表
	 */
	@RequestMapping("/getQuotaTree")
	@ResponseBody
	public List<Quota> getQuotaList(HttpServletResponse response) {
		response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html");
        return quotaService.findQuotaList();
	}
	
	private ModelAndView findQuotaList() {
		List<Quota> quotaList = quotaService.findQuotaList();
		JSONArray jsonArray = JSONArray.fromObject(quotaList);
		ModelAndView modelAndView = new ModelAndView("forward:/moduls/quota/quotaManager.jsp");
		modelAndView.addObject("zhibiaos", jsonArray.toString());
		return modelAndView;
	}
	
	/**
	 * 增加父级指标
	 */
	@RequestMapping("/AddParentQuota")
	@ResponseBody
	public ModelAndView AddParentQuota(Quota quota,Integer id) {
		ModelAndView modelAndView = new ModelAndView();
		Quotaid quotaid = new Quotaid();
		System.out.println("被修改的id为"+id);
		quotaid.setIdd(id);
		int ret = quotaService.AddQuota(quota);
		System.out.println("修改前的父级主键id为："+quota.getId());
		int parentIdd = quota.getId();
		quotaid.setParentIdd(parentIdd);
		System.out.println(parentIdd+"------------------------------");
		if(ret>0){
			modelAndView=new ModelAndView("forward:/updateQuotaById?parentIdd="+quota.getId()+"&&idd="+id+"");
		}
		return modelAndView;
	}
	/**
	 * 改变父级指标后通过Id修改指标的内容
	 */
	@RequestMapping("/updateQuotaById")
	@ResponseBody
	public ModelAndView updateQuotaById(Quotaid quotaid) {
		System.out.println(quotaid.getIdd()+"------------------------------");
		System.out.println(quotaid.getParentIdd()+"------------------------------");
		ModelAndView modelAndView = new ModelAndView();
		int ret = quotaService.updateQuotaById(quotaid);
		if(ret>0){
			modelAndView = findQuotaList();
		}	
		return modelAndView;
	}
	
	/**
	 * 增加指标
	 */
	@RequestMapping("/AddChildQuota")
	@ResponseBody
	public Integer AddChildQuota(Quota quota) {
		return quotaService.AddQuota(quota);
	}
	@RequestMapping("/upQuotaiInfo")
	@ResponseBody
	public int upquotainfo(Quota quota) {
		return quotaService.upquotainfo(quota);
	}
}
