package com.market.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.entity.Indent;
import com.market.entity.Product;
import com.market.service.IndentService;
import com.market.utils.PageBean;

@Controller
@RequestMapping("/indentAction")
public class IndentAction {
	//声明需要引用的service
    @Resource(name="indentService")
    private IndentService indentService;
    
    //查询我的订单信息的方法
    @RequestMapping("/findIndentForPage/{id}")
    public String findIndentForPage(@PathVariable int id,PageBean pageBean,HttpSession session){
    	//调用服务层方法执行分页带条件查询
  		pageBean=indentService.findIndentForPage(pageBean,id);
  		session.setAttribute("pageBean", pageBean);
  		return "redirect:/showindent.jsp";
    }
    //删除订单信息的方法
    @RequestMapping("/deleteIndent/{id}/{uid}")
    public String deleteIndent(@PathVariable int id,@PathVariable int uid,RedirectAttributes attr){
    	Indent indent = indentService.getIndentById(id);
    	if(indentService.deleteIndent(indent)){
    		attr.addAttribute("message","1");
    	}else{
    		attr.addAttribute("message","-1");
    	}
    	return "redirect:/indentAction/findIndentForPage/"+uid+"";
    }
    
	public void setIndentService(IndentService indentService) {
		this.indentService = indentService;
	}
    
}
