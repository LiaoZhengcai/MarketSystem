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
<script language="javascript">
$(function(){
	//导航切换
	$(".imglist li").click(function(){
		$(".imglist li.selected").removeClass("selected")
		$(this).addClass("selected");
	})	
})
</script>
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
    <li><a href="#">首页</a></li>
    <li><a href="#">商品展示</a></li>
    </ul>
    </div>
    <div class="rightinfo">
    <form id="seachFrm" method="post" action="productAction/findProductForPage">
    <ul class="seachform">
    	<li><input type="hidden" name="cpage" value="1"/></li>
	    <li><label>商品名称：</label><input name="querys" placeholder="请输入商品名称" type="text" class="scinput" /></li>
	    <li>
	    	<label>商品价格：</label><input name="querys" placeholder="价格区间" type="text" class="scinput" />--
	    	<input name="querys" placeholder="价格区间" type="text" class="scinput" />
	    </li>
	    <li><label>生产商：</label><input name="querys" placeholder="请输入生产商名称" type="text" class="scinput" /></li>
	    <li><label>&nbsp;</label><input name="" type="submit" class="scbtn" value="查询"/></li>	    
    </ul>
    </form>
	
    <table class="imgtable">
    <thead>
    <tr>
    <th>编号</th>
    <th width="100px;">缩略图</th>
    <th>商品名称</th>
    <th>商品详情</th>
    <th>商品价格</th>
    <th>商品数量</th>
    <th>生产商</th>
    <th>操作</th>
    </tr>
    </thead>
    
    <tbody>
    <c:forEach var="p" items="${pageBean.result }" varStatus="ids">
	    <tr>
	    <td>${(pageBean.cpage-1)*pageBean.showNum+ids.count}</td>
	    <td><img src="${pageContext.request.contextPath}/${p.pimage }" width="55" height="55"/></td>
	    <td>${p.pname }</td>
	    <td>${p.pdetails }<p>${p.pintime }</p></td>
	    <td>${p.pprice }</td>
	    <td>${p.pnum }</td>
	    <td>${p.pproducer }</td>
	    <td><a href="productAction/getGoods/${p.pno }/${loginUser.uno}" class="tablelink">我要拿货</a></td>
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
	$('.imgtable tbody tr:odd').addClass('odd');
</script>
</body>
</html>
<script type="text/javascript">
	function doPage(num){
		$("input[name='cpage']").val(num);
		$("#seachFrm")[0].submit();
	}
</script>
