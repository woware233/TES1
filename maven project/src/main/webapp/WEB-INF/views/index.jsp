<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mian.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/default/easyui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/demo.css">
</head>
<body>
<div class="top">
    <div style="float: left;margin-top: 10px;margin-left: 30px"><img src="img/CG_log.gif" height="80px" width="400px" /></div>
    <div style="float: left;margin-left: 300px">在线评教系统 </div>
    <div style="float: left"><a href="#" style="text-decoration:underline;font-size: 20px;color: red">退出</a></div>
</div>
<div class="left">
    <div class="easyui-accordion" style="width:100%;height:400px;padding-top: 0px;padding-left: 0px;border: none;background: none">
        <c:forEach items="${pmenu}" var="item">
            <div  title="${item.title}" style="overflow:auto;padding:10px;background:none">
            <c:forEach items="${cmenu}" var="item2">
                <ul>
                    <li class="left_li">${item2.gname}</li>
                   </ul> </c:forEach>
            </div>
        </c:forEach>
    </div>
    <!--<ul style="padding-top: 15px">
        <li class="left_li"><a href="#" >用户管理</a><ul style="padding-top: 15px">
            <li class="left_li_1"><a href="#" >用户管理</a><ul>
                <li class="left_li_2">学生表</li>
                <li class="left_li_2">教师表</li>
                <li class="left_li_2">领导表</li></ul></li>
            <li class="left_li_1"><a href="#" >关系管理</a><ul>
                <li class="left_li_2">班级表</li>
                <li class="left_li_2">院系表</li>
                <li class="left_li_2">权限设置</li></ul></li></ul></li>
        <li class="left_li"><a href="#">问卷管理</a><ul style="padding-top: 15px">
            <li class="left_li_1"><a href="#" >问题库</a></li>
            <li class="left_li_1"><a href="biao_1.html"  target="fu" >问卷库</a></li></ul></li>
        <li class="left_li"><a href="#">评教管理</a><ul style="padding-top: 15px">
            <li class="left_li_1"><a href="#" >成绩统计</a></li>
            <li class="left_li_1"><a href="#" >创建问卷</a><ul>
            <li class="left_li_2">基础数据设置</li>
            <li class="left_li_2">指标设置</li></ul></li></ul></li>
    </ul>-->
</div>
<div class="right"><iframe src="biao_2.html" name="fu"  style="width: 100%;height: 830px"></iframe>
</div>
</body>
</html>
