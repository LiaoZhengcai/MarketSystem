<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="js/jquery.js"></script>

<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>
</head>
<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>功能列表</div>
    <dl class="leftmenu">    
    <dd>
    <div class="title">
    <span><img src="images/leftico01.png" /></span>管理信息
    </div>
    	<ul class="menuson">
        <li class="active"><cite></cite><a href="index.jsp" target="rightFrame">首页</a><i></i></li>
        <li><cite></cite><a href="addagency.jsp" target="rightFrame">添加代理</a><i></i></li>
        <li><cite></cite><a href="userAction/findUserForPage" target="rightFrame">管理代理</a><i></i></li>
        <li><cite></cite><a href="addproduct.jsp" target="rightFrame">发布商品</a><i></i></li>
        <li><cite></cite><a href="productSys.jsp" target="rightFrame">商品管理</a><i></i></li>
        </ul>
    </dd>
    <dd>
    <div class="title">
    <span><img src="images/leftico02.png" /></span>商品展示区
    </div>
    <ul class="menuson">
        <li><cite></cite><a href="productAction/findProductForPage" target="rightFrame">商品商城</a><i></i></li>
     </ul>
    </dd>
    <dd><div class="title"><span><img src="images/leftico03.png" /></span>代理中心</div>
    <ul class="menuson">
        <li><cite></cite><a href="indentAction/findIndentForPage/${loginUser.uno }" target="rightFrame">我的货物单</a><i></i></li>
    </ul>    
    </dd>     
    </dl>
</body>
</html>