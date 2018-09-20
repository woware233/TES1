<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/login.css">
    <script type="text/javascript" src="/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="/jquery-3.3.1.min.js"></script>
</head>
<body>
<form method="post" action="/TES1/submit" name="login">
    <div>用户名:<input type="text" name="ycode"></div>
    <div>密&nbsp&nbsp码:<input type="text" name="ypassword"></div>

    <input type="submit" class="btn" name="cmdOK" value="登  录">
    <input type="reset"  class="btn" name="cmdCancel" value="重  置">
</form>
<div class="easyui-dialog" style="width:400px;height:200px">
<input id="tt" style="width:200px" /></div>
<script>
    $(function(){
        $('#tt').tree({
            url: '/getTree.do',
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