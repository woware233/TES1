<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script type="text/javascript">
$(document).ready(function(){
	$("#sum").click(function(){
        $("#sum").attr("type","hidden");
		var studentId="<%=request.getParameter("studentId")%>"; 
		var teachingId="<%=request.getParameter("teachingId")%>"; 
		var sum = parseFloat(0);
		var readio=$("input[type='radio']");
		var readiocked=$("input[type='radio']:checked");
	 	if(readio.length/4!=readiocked.length){
			var a=readio.length/4-readiocked.length;
			alert("你有"+a+"题未答！请完善后再提交");
		}else{ 
			readiocked.each(function(){
				sum += parseFloat($(this).val());
				$.ajax({
					type:"post",
					url:"/TCES/addgrade",
					data:{studentId:studentId,teachingId:teachingId,score:sum},
					async: false,
					success:function(){
						
						$("#dialog_teacheva").dialog('close');
						},
					error:function(){
						alert("提交失败！");
					}
				})
			})
		}	
	})
})
</script>
<style>

li{
            list-style-type:none;
            float: left;
        }

</style>
<div style="width: 80%;margin: auto;">
<form>
<c:forEach items="${quotas}" var="quotas">
<p style="background:#99FF99;"> ${quotas.getNumber()}&nbsp;${quotas.getQuotaName()}</p>
<c:forEach items="${quotas.quotaoptions}" var="quotaoptions">
<input type="radio" name="${quotas.id}" value="${quotaoptions.optionScore}">${quotaoptions.optionsName}</input>
</c:forEach>
</c:forEach>
<div>
<input id="sum" type="button" value="提交">
</div>
</form>
</div>
