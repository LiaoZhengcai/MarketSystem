<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<style type="text/css">
	.vali{
		color: red;
		margin-left:90px;
	}
</style>
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="index.jsp">首页</a></li>
    <li><a href="#">添加代理</a></li>
    </ul>
    </div>
    <div class="formbody"> 
    <div class="formtitle"><span>代理信息</span></div> 
    <div>
        <c:if test="${param.message==1}">
            <p style="color:green;">添加代理成功!</p>
        </c:if>
        <c:if test="${param.message==-1}">
            <p style="color:red;">添加代理失败!</p>
        </c:if>
        <c:if test="${param.message==0}">
            <p style="color:yellow;">数据不能为空!</p>
        </c:if>
    </div>
    <form action="userAction/addAgency" method="post" onsubmit="return ValidityForm()">
    	<ul class="forminfo">
		    <li><label>代理账号：</label><input name="uaccount" id="account" type="text" class="dfinput" /><span id="vzh" class="vali"></span></li>
		    <li><label>代理密码：</label><input name="upwd" id="pwd" type="password" class="dfinput" /><span id="vpwd" class="vali"></span></li>
		    <li><label>代理姓名：</label><input name="uname" id="name" type="text" class="dfinput" /><span id="vxm" class="vali"></span></li>
		    <li><label>代理性别：</label><cite><input name="usex" type="radio" value="男" checked="checked" />男&nbsp;&nbsp;&nbsp;&nbsp;
		    	<input name="usex" value="女" type="radio" />女</cite></li>
		    <li><label>代理电话：</label><input name="utel" id="tel" type="text" class="dfinput" /><span id="vdh" class="vali"></span></li>
		    <li><label>身份证号：</label><input name="uidcard" id="idcard" type="text" class="dfinput" /><span id="vid" class="vali"></span></li>
		    <li><label>注册时间：</label><input name="uintime" type="date" class="dfinput" /></li>
		    <li><label>居住地址：</label><input name="uaddress" id="address" type="text" class="dfinput" /><span id="vdz" class="vali"></span></li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认添加"/></li>
	    </ul>
    </form>
    </div>
    <script type="text/javascript">
    	function ValidityForm(){
    		var reg_zh = /[^\u4e00-\u9fa5]/;
    		var reg_id = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    		var reg_tel = /^1(3|4|5|7|8)\d{9}$/;
    		//验证账号的方法
    		if($("#account").val().length>0){
    			if(!reg_zh.test($("#account").val())){
        			$("#vzh").text("* 账号不能为中文！");
        			return false;
        		}
    		}else{
    			$("#vzh").text("* 账号不能为空！");
    			return false;
    		}   		
    		//验证密码的方法
    		if($("#pwd").val().length>0){
	    		if($("#pwd").val().length>12){
	    			$("#vpwd").text("* 密码长度不能超过12位！");
	    			return false;
	    		}
    		}else{
    			$("#vpwd").text("* 密码不能为空！");
    			return false;
    		}
    		//验证姓名的方法
    		if($("#name").val().length==0){
    			$("#vxm").text("* 姓名不能为空！");
    			return false;
    		}
    		//验证电话的方法
    		if($("#tel").val().length>0){
    			if(!reg_tel.test($("#tel").val())){
	    			$("#vdh").text("* 电话号码格式输入有误！");
	    			return false;
	    		}
    		}else{
    			$("#vdh").text("* 电话号码不能为空！");
    			return false;
    		}   		
    		//验证身份证的方法
    		if($("#idcard").val().length>0){
    			if(!reg_id.test($("#idcard").val())){
        			$("#vid").text("* 身份证输入格式有误！");
        			return false;
        		}
    		}else{
    			$("#vid").text("* 身份证不能为空！");
    			return false;
    		}
    		//验证地址的方法
    		if($("#address").val().length==0){
    			$("#vdz").text("* 地址不能为空！");
    			return false;
    		}
    		
    	}
    </script>
</body>
</html>