<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Insert title here</title>

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/default/easyui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/demo.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mian.css">
</head>
<body>
<div class="top">
    <div style="float: left;margin-top: 10px;margin-left: 30px"><img src="img/CG_log.gif" height="80px" width="400px" /></div>
    <div style="float: left;margin-left: 300px">在线评教系统 </div>
    <div style="float: left"><a href="#" style="text-decoration:underline;font-size: 20px;color: red">退出</a></div>
</div>
<div class="left">
    <div class="easyui-accordion" style="width:100%;height:400px;padding-top: 0px;padding-left: 0px;border: none;background: none">
        <c:forEach items="${Tree}" var="item">
            <div  title="${item.text}" style="overflow:auto;padding:10px;background:none">
            <c:forEach items="${Treec}" var="item2">
                    <li class="left_li">${item2.text}</li>
            </c:forEach>
            </div>
        </c:forEach>
    </div>
</div>

</div>
<div class="right">
<<<<<<< HEAD
    <iframe src="/TES1/dlist" name="fu"  style="width: 1500px;height: 840px"></iframe>
</div>
<<<<<<< HEAD
<div id="t1"></div>
=======
=======
    <iframe src="/TES1/welcome" name="fu"  style="width: 1500px;height: 840px"></iframe>
</div>
>>>>>>> eb3fa439323f7583f4a20587f9495ede273f1c32
<!--<input id="tt" style="width:200px" />-->
<script>
    $('#tt').tree({
        url:'TES1/getIndexTree',//将你的菜单拼成这个json格式id，text，child等
        onClick: function(node){
            //点击后在右边的框架里打开url
        }}
    );
    $(function(){
        $("#t1").tree({
            url:'/TES1/getMenu.do'
        });
    });

</script>
</body>
</html>
