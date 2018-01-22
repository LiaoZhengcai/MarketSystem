package com.market.web;

import com.market.entity.Product;
import com.market.service.ProductService;
import com.market.utils.PageBean;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * Created by admins on 2017/11/6.
 */
@Controller
@RequestMapping("/productAction")
public class ProductAction  {
    //声明需要引用的service
    @Resource(name="productService")
    private ProductService productService;

    //分页查询代理信息的方法
    @RequestMapping("/findProductForPage")
  	public String findProductForPage(String[] querys,PageBean pageBean,HttpSession session){
  		//调用服务层方法执行分页带条件查询
  		pageBean=productService.findProcuctForPage(pageBean,querys);
  		session.setAttribute("pageBean", pageBean);
  		return "redirect:/showproduct.jsp";
  	}
    
    //上传文件的方法
    public void uploadFile(MultipartFile pfile, Product product, HttpSession session){
        //上传文件
        if(!pfile.isEmpty()){
            //获取服务器路径
            String basePath=session.getServletContext().getRealPath("/images");
            String realName=pfile.getOriginalFilename();//真实上传的文件名
            //执行上传操作
            try {
                pfile.transferTo(new File(basePath+"/"+realName));
                String imagePath = "images/"+ realName;
                product.setPimage(imagePath);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
    //添加商品的方法
    @RequestMapping("/addProduct")
    public String addProduct(MultipartFile pfile, Product product, HttpSession session,RedirectAttributes attr){
    	if(product!=null){
    		uploadFile(pfile,product,session);
        }else{
            attr.addAttribute("message","0");
        }
        return "redirect:/addproduct.jsp";
    }

    //异步查询商品的信息
    @RequestMapping("/findProductList")
    @ResponseBody
    public List findProductList(){
        return productService.findProductList();
    }
    
    //商品上架的方法
    @RequestMapping("/putawayProduct/{id}")
    public String putawayProduct(@PathVariable int id,RedirectAttributes attr){
        Product product = productService.getProductById(id);
        product.setPstatus(0);
        if(productService.updateProduct(product)){
            attr.addAttribute("message","1");
        }else{
            attr.addAttribute("message","-1");
        }
        return "redirect:/productSys.jsp";
    }
    
    //商品下架的方法
    @RequestMapping("/removeProduct/{id}")
    public String removeProduct(@PathVariable int id,RedirectAttributes attr){
        Product product = productService.getProductById(id);
        product.setPstatus(1);
        if(productService.updateProduct(product)){
            attr.addAttribute("message","1");
        }else{
            attr.addAttribute("message","-1");
        }
        return "redirect:/productSys.jsp";
    }

    //删除商品信息的方法
    @RequestMapping("/deleteProduct/{id}")
    public String deleteProduct(@PathVariable int id,RedirectAttributes attr){
    	Product product = productService.getProductById(id);
    	if(productService.deleteProduct(product)){
    		attr.addAttribute("message","1");
    	}else{
    		attr.addAttribute("message","-1");
    	}
    	return "redirect:/productSys.jsp";
    }
    
    //处理代理拿货的方法
    @RequestMapping("/getGoods/{pid}/{uid}")
    public String getGoods(@PathVariable int pid,@PathVariable int uid,RedirectAttributes attr){
    	Product product = productService.getProductById(pid);
    	if(productService.getGoods(product,uid)){
    		attr.addAttribute("message","1");
    	}else{
    		attr.addAttribute("message","-1");
    	}
    	return "redirect:/productAction/findProductForPage";
    }
    
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }
}
