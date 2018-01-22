package com.market.utils;

import java.util.List;

/**
 * 用来封装分页信息的工具类
 * @author Administrator
 *
 */
public class PageBean {

	private int cpage=1;//当前页
	private int showNum=10;//每页显示多少条数据，默认10条
	private int allPage=0;//总页数
	private int allNum=0;//数据总条数
	
	private List result;//每页要显示的数据

	public PageBean() {
		super();
	}

	public PageBean(int cpage, int showNum, int allPage, int allNum, List result) {
		super();
		this.cpage = cpage;
		this.showNum = showNum;
		this.allPage = allPage;
		this.allNum = allNum;
		this.result = result;
	}

	public int getCpage() {
		return cpage;
	}

	public void setCpage(int cpage) {
		this.cpage = cpage;
	}

	public int getShowNum() {
		return showNum;
	}

	public void setShowNum(int showNum) {
		this.showNum = showNum;
	}

	public int getAllPage() {
		return allPage;
	}

	public void setAllPage(int allPage) {
		this.allPage = allPage;
	}

	public int getAllNum() {
		return allNum;
	}

	//设置总的数据条数方法
	public void setAllNum(int allNum) {
		this.allNum = allNum;
		//如果已经知道了总条数了，可以计算出总页数
		if(this.allNum%this.showNum==0)
			this.allPage=this.allNum/this.showNum;
		else
			this.allPage=this.allNum/this.showNum+1;
	}

	public List getResult() {
		return result;
	}

	public void setResult(List result) {
		this.result = result;
	}
}









