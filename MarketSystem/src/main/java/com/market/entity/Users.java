package com.market.entity;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户信息实体类
 * Created by admins on 2017/11/6.
 */
@Entity
@Table(name="tb_user")
public class Users implements Serializable {

    private int uno;
    private String uaccount;
    private String upwd;
    private String uname;
    private String usex;
    private String utel;
    private String uidcard;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date uintime;
    private String uaddress;
    private int utype = 0;//（1:供应商;0:代理）默认为0
    private int ustatus = 1;//（1:正常;0:解雇）默认为1

    public Users() {
        super();
    }

    public Users(int uno, String uaccount, String upwd, String uname,
			String usex, String utel, String uidcard, Date uintime,
			String uaddress, int utype, int ustatus) {
		super();
		this.uno = uno;
		this.uaccount = uaccount;
		this.upwd = upwd;
		this.uname = uname;
		this.usex = usex;
		this.utel = utel;
		this.uidcard = uidcard;
		this.uintime = uintime;
		this.uaddress = uaddress;
		this.utype = utype;
		this.ustatus = ustatus;
	}

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public int getUno() {
        return uno;
    }

    public void setUno(int uno) {
        this.uno = uno;
    }

    public String getUaccount() {
        return uaccount;
    }

    public void setUaccount(String uaccount) {
        this.uaccount = uaccount;
    }

    public String getUpwd() {
        return upwd;
    }

    public void setUpwd(String upwd) {
        this.upwd = upwd;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUsex() {
        return usex;
    }

    public void setUsex(String usex) {
        this.usex = usex;
    }

    public String getUtel() {
        return utel;
    }

    public void setUtel(String utel) {
        this.utel = utel;
    }

    @Column(columnDefinition = "date")
    @Temporal(TemporalType.DATE)
    public Date getUintime() {
        return uintime;
    }

    public void setUintime(Date uintime) {
        this.uintime = uintime;
    }

    public String getUaddress() {
        return uaddress;
    }

    public void setUaddress(String uaddress) {
        this.uaddress = uaddress;
    }

	public String getUidcard() {
		return uidcard;
	}

	public void setUidcard(String uidcard) {
		this.uidcard = uidcard;
	}

	public int getUtype() {
		return utype;
	}

	public void setUtype(int utype) {
		this.utype = utype;
	}

	public int getUstatus() {
		return ustatus;
	}

	public void setUstatus(int ustatus) {
		this.ustatus = ustatus;
	}
    
}
