package com.market.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 商品信息实体类
 * Created by admins on 2017/11/6.
 */
@Entity
@Table(name="tb_product")
public class Product implements Serializable {
    private int pno;
    private String pname;
    private double pprice;
    private String pdetails;
    private int pnum;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date pintime;
    private String pproducer;
    private String pimage;
    private int pstatus = 1;//0：代表上架，1：代表下架，默认1

    public Product() {
        super();
    }

    public Product(int pno, String pname, double pprice, Date pintime, String pproducer, int pstatus, String pimage,String pdetails,int pnum) {
        this.pno = pno;
        this.pname = pname;
        this.pprice = pprice;
        this.pintime = pintime;
        this.pproducer = pproducer;
        this.pstatus = pstatus;
        this.pimage = pimage;
        this.pdetails = pdetails;
        this.pnum = pnum;
        
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getPno() {
        return pno;
    }

    public void setPno(int pno) {
        this.pno = pno;
    }

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }

    public double getPprice() {
        return pprice;
    }

    public void setPprice(double pprice) {
        this.pprice = pprice;
    }

    @Column(columnDefinition = "date")
    @Temporal(TemporalType.DATE)
    public Date getPintime() {
        return pintime;
    }

    public void setPintime(Date pintime) {
        this.pintime = pintime;
    }

    public String getPproducer() {
        return pproducer;
    }

    public void setPproducer(String pproducer) {
        this.pproducer = pproducer;
    }

    public int getPstatus() {
        return pstatus;
    }

    public void setPstatus(int pstatus) {
        this.pstatus = pstatus;
    }

    public String getPimage() {
        return pimage;
    }

    public void setPimage(String pimage) {
        this.pimage = pimage;
    }

	public String getPdetails() {
		return pdetails;
	}

	public void setPdetails(String pdetails) {
		this.pdetails = pdetails;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

}
