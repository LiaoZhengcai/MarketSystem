package com.market.dao;
import com.market.entity.Users;
import com.market.utils.PageBean;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by admins on 2017/11/6.
 */
@Repository("userDao")
public class UserDao extends BaseDao{
    //添加用户的方法
    public boolean addUser(Users users){
        try {
            getSession().save(users);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //删除用户的方法
    public boolean deleteUser(Users users){
        try {
            getSession().delete(users);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //修改用户的方法
    public boolean updateUser(Users users){
        try {
            getSession().update(users);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //查询用户的方法
    public List findUserList(String hql){
        return getSession().createQuery(hql).list();
    }
    //根据id查询用户的方法
    public Users getUserById(int uno){
        return getSession().get(Users.class,uno);
    }
    
    //分页查询代理信息
  	public List findUserForPage(String hql,PageBean bean){
  		Query query=getSession().createQuery(hql);
  		//设置分页
  		query.setFirstResult((bean.getCpage()-1)*bean.getShowNum());//从哪里开始查询
  		query.setMaxResults(bean.getShowNum());//设置每页查询多少条
  		//执行查询
  		List list=query.list();
  		return list;
  	}
    
}
