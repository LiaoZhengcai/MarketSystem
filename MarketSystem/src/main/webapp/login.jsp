<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script language="javascript">
	$(function(){
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
	$(window).resize(function(){  
    $('.loginbox').css({'position':'absolute','left':($(window).width()-692)/2});
    })  
});
</script> 
</head>
<body style="background-color:#1c77ac; background-repeat:no-repeat; background-position:center top; overflow:hidden;">  
<div class="logintop">
    <span>欢迎登录销售管理界面平台</span>
</div>
<div class="loginbody">
	<div class="loginbox">
	<form action="userAction/doLogin" method="post">
		<ul>
			<c:if test="${param.message==1}">
            	<li><p style="color:red;">* 密码错误，或者你已经被解雇!</p></li>
       		</c:if>
			<li><input placeholder="admin" name="uaccount" type="text"  class="loginuser"/></li>
			<li><input placeholder="请输入密码" name="upwd" type="password" class="loginpwd"/></li>
			<li><input type="submit" class="loginbtn" value="登录"/></li>
		</ul>
	</form>
    </div>
</div>
<div class="loginbm">@2017-11-07</div>
</body>
</html>