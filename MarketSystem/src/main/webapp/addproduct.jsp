<%@ page isELIgnored="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
</head>
<body>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="index.jsp">首页</a></li>
    <li><a href="#">发布商品</a></li>
    </ul>
    </div>
    <div class="formbody">
    <div class="formtitle"><span>商品信息</span></div>
    <div>
        <c:if test="${param.message==1}">
            <p style="color:green;">发布商品成功!</p>
        </c:if>
        <c:if test="${param.message==-1}">
            <p style="color:red;">发布商品失败!</p>
        </c:if>
        <c:if test="${param.message==0}">
            <p style="color:yellow;">数据不能为空!</p>
        </c:if>
    </div>
    <form action="productAction/addProduct" method="post" enctype="multipart/form-data">
    	<ul class="forminfo">
		    <li><label>商品名称：</label><input name="pname" type="text" class="dfinput" /></li>
		    <li><label>商品价格：</label><input name="pprice" type="text" class="dfinput" /></li>
		    <li><label>商品详情：</label><input name="pdetails" type="text" class="dfinput" /></li>
		    <li><label>商品数量：</label><input name="pnum" type="text" class="dfinput" /></li>
		    <li><label>发布时间：</label><input name="pintime" type="date" class="dfinput" /></li>
		    <li><label>生产商：</label><input name="pproducer" type="text" class="dfinput" /></li>
		    <li><label>商品图片：</label><input name="pfile" type="file"/></li>
		    <li><label>&nbsp;</label><input type="submit" class="btn" value="确认添加"/></li>
	    </ul>
    </form>
    </div>
</body>
</html>