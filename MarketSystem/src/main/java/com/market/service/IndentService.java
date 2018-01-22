package com.market.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.market.dao.IndentDao;
import com.market.entity.Indent;
import com.market.utils.PageBean;

@Service("indentService")
@Transactional(propagation = Propagation.REQUIRED)
public class IndentService {
	//声明需要引用的dao
    @Resource(name="indentDao")
    private IndentDao indentDao;
    
    //分页查询我的订单信息的方法
    public PageBean findIndentForPage(PageBean bean,int id){
    	String hql="from Indent where iuno = "+id;
    	//设置每页要显示多少条数据
    	bean.setShowNum(5);
    	//执行查询获取当前页要显示的数据
		bean.setResult(indentDao.findIndentForPage(hql, bean));
		//获取总的数据条数
		bean.setAllNum(indentDao.findIndentList(hql).size());
		return bean;
    }
    
    //添加订单的方法
    public boolean addIndent(Indent indent){
    	return indentDao.updateIndent(indent);
    }
    
    //修改订单的方法
    public boolean updateIndent(Indent indent){
        return indentDao.updateIndent(indent);
    }

    //查询订单的方法
    public List findIndentList(String hql){
        return indentDao.findIndentList(hql);
    }

    //根据id查询订单的方法
    public Indent getIndentById(int ino){
        return indentDao.getIndentById(ino);
    }
    
    //删除订单的方法
    public boolean deleteIndent(Indent indent){
    	return indentDao.deleteIndent(indent);
    }
    
	public void setIndentDao(IndentDao indentDao) {
		this.indentDao = indentDao;
	}

}
