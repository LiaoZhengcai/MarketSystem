package com.market.service;

import com.market.dao.IndentDao;
import com.market.dao.ProductDao;
import com.market.entity.Indent;
import com.market.entity.Product;
import com.market.entity.Users;
import com.market.utils.PageBean;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

import java.util.Date;
import java.util.List;

/**
 * Created by admins on 2017/11/6.
 */
@Service("productService")
@Transactional(propagation = Propagation.REQUIRED)
public class ProductService {
    //声明需要引用的dao
    @Resource(name="productDao")
    private ProductDao productDao;
    @Resource(name="indentDao")
    private IndentDao indentDao;
    
    //分页查询商品信息的方法
    public PageBean findProcuctForPage(PageBean bean,String[] querys){
    	String hql="from Product where pstatus = 0";
    	//带有条件
		if(querys!=null&&querys.length>0){
			//商品名称
			if(querys[0]!=null&&querys[0].length()>0){
				hql+=" and pname like '%"+querys[0]+"%'";
			}
			//价格最低
			if(querys[1]!=null&&querys[1].length()>0){
				hql+=" and pprice>="+querys[1];
			}
			//价格最高
			if(querys[2]!=null&&querys[2].length()>0){
				hql+=" and pprice<="+querys[2];
			}
			//生产商
			if(querys[3]!=null&&querys[3].length()>0){
				hql+=" and pproducer like '%"+querys[3]+"%'";
			}
		}
    	//设置每页要显示多少条数据
    	bean.setShowNum(5);
    	//执行查询获取当前页要显示的数据
		bean.setResult(productDao.findProductForPage(hql, bean));
		//获取总的数据条数
		bean.setAllNum(productDao.findProductList(hql).size());
		return bean;
    }
    
    //处理拿货的服务方法
    public boolean getGoods(Product product,int uid){
    	product.setPnum(product.getPnum()-1);
    	Indent indent = new Indent();
    	indent.setIpname(product.getPname());
    	indent.setIpdetails(product.getPdetails());
    	indent.setIpimage(product.getPimage());
    	indent.setIpprice(product.getPprice());
    	indent.setIpproducer(product.getPproducer());
    	indent.setUser(new Users(uid, null, null, null, null, null, null, null, null, 0, 0));
    	indent.setIpintime(new Date());
    	if(indent.getIpnum()==0){
        	indent.setIpnum(indent.getIpnum()+1);
        	indentDao.addIndent(indent);
    	}else{
    		indent.setIpnum(indent.getIpnum()+1); 
    		indentDao.updateIndent(indent);
    	}	
    	return productDao.updateProduct(product);
    }

    public boolean addProduct(Product product){
        return productDao.addProduct(product);
    }

    public boolean deleteProduct(Product product){
        return productDao.deleteProduct(product);
    }

    public boolean updateProduct(Product product){
        return productDao.updateProduct(product);
    }

    public List findProductList(){
        String hql="from Product order by pstatus desc";
        return productDao.findProductList(hql);
    }

    public List findProductInfo(){
        String hql = "from Product where pstatus = 1";
        return productDao.findProductList(hql);
    }

    public Product getProductById(int pno){
        return productDao.getProductById(pno);
    }

    public void setProductDao(ProductDao productDao) {
        this.productDao = productDao;
    }
}
