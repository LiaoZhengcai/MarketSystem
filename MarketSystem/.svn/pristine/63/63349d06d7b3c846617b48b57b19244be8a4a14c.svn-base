package com.market.dao;
import com.market.entity.Product;
import com.market.utils.PageBean;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by admins on 2017/11/6.
 */
@Repository("productDao")
public class ProductDao extends BaseDao{
    //添加商品的方法
    public boolean addProduct(Product product){
        try {
            getSession().save(product);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //删除商品的方法
    public boolean deleteProduct(Product product){
        try {
            getSession().delete(product);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }
    //修改商品的方法
    public boolean updateProduct(Product product){
        try {
            getSession().update(product);
            return true;
        }catch (Exception e){
            e.printStackTrace();
        }
        return false;
    }

    //查询商品的方法
    public List findProductList(String hql){
        return getSession().createQuery(hql).list();
    }

    //根据id查询商品的方法
    public Product getProductById(int pno){
        return getSession().get(Product.class,pno);
    }
    
    //分页查询商品信息的方法
  	public List findProductForPage(String hql,PageBean bean){
  		Query query=getSession().createQuery(hql);
  		//设置分页
  		query.setFirstResult((bean.getCpage()-1)*bean.getShowNum());//从哪里开始查询
  		query.setMaxResults(bean.getShowNum());//设置每页查询多少条
  		//执行查询
  		List list=query.list();
  		return list;
  	}
    
}
