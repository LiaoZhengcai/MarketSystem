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

<script type="text/javascript">
$(document).ready(function(){
  $(".click").click(function(){
  $(".tip").fadeIn(200);
  });
  
  $(".tiptop a").click(function(){
  $(".tip").fadeOut(200);
});

  $(".sure").click(function(){
  $(".tip").fadeOut(100);
});

  $(".cancel").click(function(){
  $(".tip").fadeOut(100);
});

});
</script>
</head>
<body>
<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="index.jsp">首页</a></li>
    <li><a href="#">管理代理</a></li>
    </ul>
    </div>
    <div class="rightinfo">
    <form id="seachFrm" method="post" action="userAction/findUserForPage">
		<input type="hidden" name="cpage" value="1"/>
	</form>
    <table class="tablelist">
    	<thead>
	    	<tr>
	        <th>编号</th>
	        <th>代理账号</th>
	        <th>代理密码</th>
	        <th>代理姓名</th>
	        <th>代理性别</th>
	        <th>代理电话</th>
	        <th>身份证号</th>
	        <th>注册时间</th>
	        <th>居住地址</th>
	       	<th>状态</th>
	        <th>操作</th>
	        </tr>
        </thead>
        <tbody>
        	<c:forEach var="a" items="${pageBean.result }" varStatus="ids">
        		<tr>
	        <td>${(pageBean.cpage-1)*pageBean.showNum+ids.count}</td>
	        <td>${a.uaccount}</td>
	        <td>${a.upwd}</td>
	        <td>${a.uname}</td>
	        <td>${a.usex}</td>
	        <td>${a.utel}</td>
	        <td>${a.uidcard}</td>
	        <td>${a.uintime}</td>
	        <td>${a.uaddress}</td>
	        <c:if test="${a.ustatus==1}">
	        	<td>正常</td>
	        </c:if>
	       <c:if test="${a.ustatus==0}">
	        	<td>解雇</td>
	        </c:if>
	        <td>
	        	<c:if test="${a.ustatus==1}">
	        		<a href="userAction/dismissalAgency/${a.uno}" class="tablelink">解雇</a>&nbsp;
	        	</c:if>
	        	<c:if test="${a.ustatus==0}">
	        		<a href="userAction/alsoAgency/${a.uno}" class="tablelink">还职</a>&nbsp;
	        	</c:if>
	        	<a href="userAction/deleteAgency/${a.uno}" class="tablelink">删除</a>
	        </td>
	        </tr>
        	</c:forEach>
        </tbody>
    </table>
    <div class="pagin">
    	<div class="message">共查询到<i class="blue">${pageBean.allNum}</i>条<i class="blue">${pageBean.allPage }</i>页记录，当前显示第&nbsp;<i class="blue">${pageBean.cpage }&nbsp;</i>页&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="javascript:doPage(1);">首页</a>&nbsp;|&nbsp;
		<a href="javascript:doPage(${pageBean.cpage-1>0?pageBean.cpage-1:1});">上一页</a>&nbsp;|&nbsp;
		<a href="javascript:doPage(${pageBean.cpage+1>pageBean.allPage?pageBean.allPage:pageBean.cpage+1});">下一页</a>&nbsp;|&nbsp;
		<a href="javascript:doPage(${pageBean.allPage});">尾页</a>
		</div>
    </div>
    </div>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>
</body>
</html>
<script type="text/javascript">
	function doPage(num){
		$("input[name='cpage']").val(num);
		$("#seachFrm")[0].submit();
	}
</script>