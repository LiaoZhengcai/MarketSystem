package com.market.dao;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import com.market.entity.Indent;
import com.market.utils.PageBean;

/**
 * 
 * @author admins
 *
 */
@Repository("indentDao")
public class IndentDao extends BaseDao {

	//分页查询我的订单信息的方法
  	public List findIndentForPage(String hql,PageBean bean){
  		Query query=getSession().createQuery(hql);
  		//设置分页
  		query.setFirstResult((bean.getCpage()-1)*bean.getShowNum());//从哪里开始查询
  		query.setMaxResults(bean.getShowNum());//设置每页查询多少条
  		//执行查询
  		List list=query.list();
  		return list;
  	}
	
	//添加订单的方法
	public boolean addIndent(Indent indent){
		try {
            getSession().save(indent);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
	}
	
    //修改订单的方法
    public boolean updateIndent(Indent indent){
        try {
            getSession().update(indent);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    //删除订单信息的方法
    public boolean deleteIndent(Indent indent){
    	try {
            getSession().delete(indent);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    
    //查询订单的方法
    public List findIndentList(String hql){
        return getSession().createQuery(hql).list();
    }

    //根据id查询订单的方法
    public Indent getIndentById(int ino){
        return getSession().get(Indent.class,ino);
    }
    
}
