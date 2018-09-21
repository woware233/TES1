<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/logl.css">
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
</head>
<body>
\<div class="hei"></div>
<d--iv class="lunbo"><ul class="lunbo_ul">
    <li class="lunbo_li"><img src="img/timg.jpg" height="950px" width="1900px"/></li>
    <li class="lunbo_li"><img src="img/timg (1).jpg"height="950px" width="1900px"/></li>
    <li class="lunbo_li"><img src="img/timg (2).jpg" height="950px" width="1900px"/></li>
    <li class="lunbo_li"><img src="img/timg (3).jpg" height="950px" width="1900px"/></li></ul></d--iv>
<div class="denglu">
    <div class="denglu_1"><b>教师评教系统</b></div>
    <div class="denglu_2">Teachers Comprehensive Evaluation System</div>
    <form method="post" action="/TES1/submit" name="login">
    <div style="margin-top: 50px;margin-left: 150px"><input style="width: 500px;height: 30px;font-size: 24px;font-family: 方正舒体;" type="text" name="ycode" placeholder="学号/工号"></div>
    <div style="margin-top: 50px;margin-left: 150px"><input style="width: 500px;height: 30px;font-size: 24px;font-family: 方正舒体;" type="password" name="ypassword" placeholder="密码"></div>
    <input type="checkbox" style="margin-left: 150px;">记住密码<button class="denglu_3">登录</button><button  style="margin-left: 100px;">重置密码</button>
    </form>
</div>
</body>
<script>
    var num=0;
    $(".lunbo_li").hide();
    $(".lunbo_li").eq(num%4).fadeIn(3000);
    function lun() {
        $(".lunbo_li").eq(num%4).fadeOut(1000);
        num++;
        $(".lunbo_li").eq(num%4).fadeIn(3000);
    }
    setInterval(lun,4000);
</script>
</body>
</html>