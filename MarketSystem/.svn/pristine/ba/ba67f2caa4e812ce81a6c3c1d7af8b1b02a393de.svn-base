package com.market.service;

import com.market.dao.UserDao;
import com.market.entity.Users;
import com.market.utils.PageBean;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.List;

/**
 * Created by admins on 2017/11/6.
 */
@Service("userService")
@Transactional(propagation = Propagation.REQUIRED)
public class UserService {
    //声明需要引用的dao
    @Resource(name="userDao")
    private UserDao userDao;
    //处理用户登录的方法
    public Users doLogin(String uaccount,String upwd){
        String hql="from Users where uaccount = '"+uaccount+"' and ustatus = 1";
        List<Users> userList=userDao.findUserList(hql);
        for (Users users : userList) {
            if(users.getUaccount().equals(uaccount)&&users.getUpwd().equals(upwd)){
                return users;
            }
        }
        return null;
    }

    public boolean addUser(Users users){
        return userDao.addUser(users);
    }

    public boolean deleteUser(Users users){
        return userDao.deleteUser(users);
    }

    public boolean updateUser(Users users){
        return userDao.updateUser(users);
    }

    public List findUserList(){
        String hql = "";
        return userDao.findUserList(hql);
    }

    public Users getUserById(int uno){
        return userDao.getUserById(uno);
    }
    
    //分页查询代理信息
    public PageBean findUserForPage(PageBean bean){
    	String hql="from Users where utype = 0 order by ustatus desc";
    	//执行查询获取当前页要显示的数据
		bean.setResult(userDao.findUserForPage(hql, bean));
		//获取总的数据条数
		bean.setAllNum(userDao.findUserList(hql).size());
		return bean;
    }

    public void setUserDao(UserDao userDao) {
        this.userDao = userDao;
    }
}
