package com.market.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;
/**
 * 订单信息实体类
 * @author admins
 *
 */
@Entity
@Table(name="tb_indent")
public class Indent implements Serializable {
	private int ino;
	private String ipname;
	private String ipdetails;
	private double ipprice;
	private int ipnum;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date ipintime;
	private String ipproducer;
	private String ipimage;
	
	//构建多对一关系，多个订单对应一个代理商
	private Users user;
	
	public Indent() {
		super();
	}
	
	public Indent(int ino, String ipname, String ipdetails, double ipprice,
			int ipnum, Date ipintime, String ipproducer, String ipimage) {
		super();
		this.ino = ino;
		this.ipname = ipname;
		this.ipdetails = ipdetails;
		this.ipprice = ipprice;
		this.ipnum = ipnum;
		this.ipintime = ipintime;
		this.ipproducer = ipproducer;
		this.ipimage = ipimage;
	}
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	public int getIno() {
		return ino;
	}
	public void setIno(int ino) {
		this.ino = ino;
	}
	public String getIpname() {
		return ipname;
	}
	public void setIpname(String ipname) {
		this.ipname = ipname;
	}
	public String getIpdetails() {
		return ipdetails;
	}
	public void setIpdetails(String ipdetails) {
		this.ipdetails = ipdetails;
	}
	public double getIpprice() {
		return ipprice;
	}
	public void setIpprice(double ipprice) {
		this.ipprice = ipprice;
	}
	public int getIpnum() {
		return ipnum;
	}
	public void setIpnum(int ipnum) {
		this.ipnum = ipnum;
	}
	
	@Column(columnDefinition = "date")
    @Temporal(TemporalType.DATE)
	public Date getIpintime() {
		return ipintime;
	}
	public void setIpintime(Date ipintime) {
		this.ipintime = ipintime;
	}
	public String getIpproducer() {
		return ipproducer;
	}
	public void setIpproducer(String ipproducer) {
		this.ipproducer = ipproducer;
	}
	public String getIpimage() {
		return ipimage;
	}
	public void setIpimage(String ipimage) {
		this.ipimage = ipimage;
	}
	
	@ManyToOne(cascade=CascadeType.REFRESH,fetch=FetchType.EAGER)
    @JoinColumn(name="iuno")
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	
}
