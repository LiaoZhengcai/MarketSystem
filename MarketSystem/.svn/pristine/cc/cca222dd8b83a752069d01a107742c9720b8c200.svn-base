package com.market.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.market.entity.Users;
import com.market.service.UserService;
import com.market.utils.PageBean;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;


/**
 * Created by admins on 2017/11/6.
 * 处理用户请求信息的Action
 */
@Controller
@RequestMapping("/userAction")
public class UserAction {
    //声明需要引用的service
    @Resource(name="userService")
    private UserService userService;

    //用户登录的方法
    @RequestMapping("/doLogin")
    public String doLogin(Users users, HttpSession session,RedirectAttributes attr){
        Users user = userService.doLogin(users.getUaccount(),users.getUpwd());
        if(user!=null){
            session.setAttribute("loginUser",user);
            return "redirect:/main.jsp";
        }else{
            attr.addAttribute("message","1");
            return "redirect:/login.jsp";
        }
    }

    //添加代理的方法
    @RequestMapping("/addAgency")
    public String addAgency(Users users,RedirectAttributes attr){
        if(users!=null){
          if(userService.addUser(users)){
              attr.addAttribute("message","1");
          }else{
              attr.addAttribute("message","-1");
          }
        } else {
              attr.addAttribute("message","0");
        }
        return "redirect:/addagency.jsp";
    }
    
    //分页查询代理信息的方法
    @RequestMapping("/findUserForPage")
  	public String findUserForPage(PageBean pageBean,HttpSession session){
  		//调用服务层方法执行分页带条件查询
  		pageBean=userService.findUserForPage(pageBean);
  		session.setAttribute("pageBean", pageBean);
  		return "redirect:/agencySys.jsp";
  	}
    
    //解雇员工的方法
    @RequestMapping("/dismissalAgency/{id}")
    public String dismissalAgency(@PathVariable int id,RedirectAttributes attr){
    	Users user = userService.getUserById(id);
    	user.setUstatus(0);
    	if(userService.updateUser(user)){
    		attr.addAttribute("message","1");
    	}else{
    		attr.addAttribute("message","-1");
    	}
    	return "redirect:/userAction/findUserForPage";
    }
    
    //员工还职的方法
    @RequestMapping("/alsoAgency/{id}")
    public String alsoAgency(@PathVariable int id,RedirectAttributes attr){
    	Users user = userService.getUserById(id);
    	user.setUstatus(1);
    	if(userService.updateUser(user)){
    		attr.addAttribute("message","1");
    	}else{
    		attr.addAttribute("message","-1");
    	}
    	return "redirect:/userAction/findUserForPage";
    }

    //删除员工信息的方法
    @RequestMapping("/deleteAgency/{id}")
    public String deleteAgency(@PathVariable int id,RedirectAttributes attr){
    	Users user = userService.getUserById(id);
    	if(userService.deleteUser(user)){
    		attr.addAttribute("message","1");
    	}else{
    		attr.addAttribute("message","-1");
    	}
    	return "redirect:/userAction/findUserForPage";
    }
    
    //修改员工信息的方法
    @RequestMapping("/updateAgency")
    public String updateAgency(Users user,RedirectAttributes attr){
    	if(userService.updateUser(user)){
    		attr.addAttribute("message","1");
    	}else{
    		attr.addAttribute("message","-1");
    	}
    	return "redirect:/index.jsp";
    }
    
    public void setUserService(UserService userService) {
        this.userService = userService;
    }
    
}
