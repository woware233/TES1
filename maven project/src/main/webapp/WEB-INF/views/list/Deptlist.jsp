<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <base href="<%=basePath%>">
    <title>Insert title here</title>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/vue.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/jss/Deptlist.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.easyui.min.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/icon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/default/easyui.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/themes/demo.css">


</head>
<body style="margin: 1px">

<table id="dg" title="学院管理" class="easyui-datagrid" fitColumns="true"
       pagination="true" rownumbers="true"
       url="/TES1/list.do" fit="true"
       toolbar="#tb">
    <thead>
    <tr>
        <th field="cb" checkbox="true" align="center"></th>
        <th field="deptID" width="50" align="center">编号</th>
        <th field="deptCode" width="50" align="center">学院号</th>
        <th field="deptName" width="50" align="center">学院名</th>
    </tr>
    </thead>
</table>
<div id="tb">
    <a href="javascript:openDeptAddDialog()" class="easyui-linkbutton"
       iconCls="icon-add" plain="true">添加</a>
    <a href="javascript:openDeptModifyDialog()" class="easyui-linkbutton"
        iconCls="icon-edit" plain="true">修改</a>
    <a href="javascript:deleteDept()" class="easyui-linkbutton"
        iconCls="icon-remove" plain="true">删除</a>
    <a href="javascript:InputExcelDialog()" class="easyui-linkbutton"
       iconCls="icon-add" plain="true">导入Excel</a>
    <div>
        &nbsp;学院名：&nbsp;<input type="text" id="s_DeptName" size="20"
                               onkeydown="if(event.keyCode == 13)searchUser()" /> <a
            href="javascript:searchDept()" class="easyui-linkbutton"
            iconCls="icon-search" plain="true">查询</a>
    </div>

    <div id="dlg-buttons">
        <a href="javascript: saveDept()" class="easyui-linkbutton"
           iconCls="icon-ok">保存</a> <a href="javascript:closeDeptDialog()"
                                       class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
    </div>

    <div id="ifdlg-buttons">
        <a href="javascript: upload()" class="easyui-linkbutton"
           iconCls="icon-ok">上传</a> <a href="javascript:closeDeptDialog()"
                                       class="easyui-linkbutton" iconCls="icon-cancel">关闭</a>
    </div>
    <div id="dlg" class="easyui-dialog"
               style="width: 730px;height:280px;padding:10px 10px;" closed="true"
               buttons="#dlg-buttons">
    <form method="post" id="fm">
        <table cellspacing="8px;">
            <tr>
                <td>学院编号：</td>
                <td><input type="text" id="DeptCode" name="DeptCode"
                           class="easyui-validatebox" required="true" />&nbsp;<span
                        style="color: red">*</span>
                </td>
                <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                <td>学院名：</td>
                <td><input type="text" id="DeptName" name="DeptName"
                           class="easyui-validatebox" required="true" />&nbsp;<span
                        style="color: red">*</span>
                </td>
            </tr>


        </table>
    </form>
</div>
    <div id="ifdlg" class="easyui-dialog"
         style="width: 730px;height:280px;padding:10px 10px;" closed="true"
         buttons="#dlg-buttons">
        <form method="post" id="ifm">
            <table cellspacing="8px;">
                <tr>
                    <td>学院编号：</td>
                    <td><input type="file" id="excel" name="excel"
                               class="easyui-validatebox" required="true" />&nbsp;<span
                            style="color: red">*</span>
                    </td>

                </tr>


            </table>
        </form>
    </div>
</div>
</body>
</html>