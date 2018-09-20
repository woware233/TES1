<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="../mian.css">
    <script type="text/javascript" src="../vue.js"></script>
    <script type="text/javascript" src="../jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="../jquery.easyui.min.js"></script>
</head>
<body>
<div class="top">在线评教系统 <a href="#" style="text-decoration:underline;font-size: 20px;color: red">退出</a></div>
<div class="left">
    <ul style="padding-top: 15px">
        <c:forEach items="${pmenu}" var="item">
        <ul style="padding-top: 15px">
            <li class="left_li_1"><a href="${item.url}" >${item.title}${item.pmcode}</a>
                <c:forEach items="${cmenu}" var="item2">
            <li class="left_li_2">${item2.gname}</li>
            </c:forEach><ul>
            </c:forEach>
</div>

<div class="easyui-dialog" style="width:400px;height:200px">

<input id="tt" style="width:200px" /></div>
<script>
    $(function(){
        $('#tt').tree({
            url: '/TVS/getTree.do',
            loadFilter: function(data){
                if (data.d){
                    return data.d;
                } else {
                    return data;
                }
            }
        });
    });
</script>
</body>
</html>