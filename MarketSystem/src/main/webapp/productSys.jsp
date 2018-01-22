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
    <li><a href="#">商品管理</a></li>
    </ul>
    </div>
    <div class="rightinfo">
    <table class="tablelist">
    	<thead>
	    	<tr>
	        <th>编号</th>
	        <th>商品名称</th>
	        <th>商品价格</th>
	        <th>商品数量</th>
	        <th>发布时间</th>
	        <th>生产商</th>
	        <th>商品状态</th>
	        <th>管理</th>
	        </tr>
        </thead>
        <tbody id="tab"></tbody>
    </table>
    <div class="pagin">
    	<div class="message">共<i class="blue">data</i>条记录，当前显示第&nbsp;<i class="blue">data&nbsp;</i>页
    		<a href="javascript:;">首页</a>&nbsp;|&nbsp;
			<a href="javascript:;">上一页</a>&nbsp;|&nbsp;
			<a href="javascript:;">下一页</a>&nbsp;|&nbsp;
			<a href="javascript:;">尾页</a>
    	</div>
    </div>
    </div>
<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>
</body>
</html>
<script type="text/javascript">
    function loadData() {
        $("#tab tr").remove();
        $.get("productAction/findProductList","",function (data) {
            $.each(data,function (i,v) {
                var tr="<tr>";	
                tr+="<td>"+(i+1)+"</td>";
                tr+="<td>"+v.pname+"</td>";
                tr+="<td>"+v.pprice+"</td>";
                tr+="<td>"+v.pnum+"</td>";
                tr+="<td>"+v.pintime+"</td>";
                tr+="<td>"+v.pproducer+"</td>";
                if(v.pstatus==1){
                	tr+="<td>未上架</td>";
                }else{
                	tr+="<td>在售</td>";
                }
                tr+="<td>";
                if(v.pstatus==1){
                	tr+="<a href='productAction/putawayProduct/"+v.pno+"' class='tablelink'>上架</a>&nbsp;&nbsp;";
                }else{
                	tr+="<a href='productAction/removeProduct/"+v.pno+"' class='tablelink'>下架</a>&nbsp;&nbsp;";
                }  
                tr+="<a href='productAction/deleteProduct/"+v.pno+"' class='tablelink'>删除</a>";
                tr+="</td>";
                tr+="</tr>";
                $("#tab").append(tr);
            });
        });
    }
    window.onload = loadData;
</script>