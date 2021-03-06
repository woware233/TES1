<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
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
    <style type="text/css">
        a{
            text-decoration:none;
            color: black;
            out-line: none
        }
        ul,li{ padding:0;
            margin:0;
            list-style:none;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div style="margin:20px 0;"></div>

<table id="dg" class="easyui-datagrid" title="Row Editing in DataGrid" style="width:700px;height:auto"
       data-options="
				iconCls: 'icon-edit',
				singleSelect: true,
				toolbar: '#tb',
				url: 'datagrid_data1.json',
				method: 'get',
				onClickRow: onClickRow
			">
    <thead>
    <tr>
        <th data-options="field:'itemid',width:80">ID</th>
        <th data-options="field:'productid',width:100,
						formatter:function(value,row){
							return row.productname;
						},
						editor:{
							type:'combobox',
							options:{
								valueField:'productid',
								textField:'productname',
								method:'get',
								url:'products.json',
								required:true
							}
						}">Name</th>
        <th data-options="field:'listprice',width:80,align:'right',editor:{type:'numberbox',options:{precision:1}}">Name</th>
        <th data-options="field:'unitcost',width:80,align:'right',editor:'numberbox'">Name</th>
        <th data-options="field:'attr1',width:250,editor:'textbox'">Name</th>
        <th data-options="field:'status',width:60,align:'center',editor:{type:'checkbox',options:{on:'P',off:''}}">Name</th>
    </tr>
    </thead>
</table>

<div id="tb" style="height:auto">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" onclick="$('#add').window('open')">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" onclick="$('#del').window('open')">删除</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true" onclick="accept()">Accept</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-undo',plain:true" onclick="reject()">Reject</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" onclick="getChanges()">GetChanges</a>
</div>

<script type="text/javascript">
    var editIndex = undefined;
    function endEditing(){
        if (editIndex == undefined){return true}
        if ($('#dg').datagrid('validateRow', editIndex)){
            var ed = $('#dg').datagrid('getEditor', {index:editIndex,field:'productid'});
            var productname = $(ed.target).combobox('getText');
            $('#dg').datagrid('getRows')[editIndex]['productname'] = productname;
            $('#dg').datagrid('endEdit', editIndex);
            editIndex = undefined;
            return true;
        } else {
            return false;
        }
    }
    function onClickRow(index){
        if (editIndex != index){
            if (endEditing()){
                $('#dg').datagrid('selectRow', index)
                    .datagrid('beginEdit', index);
                editIndex = index;
            } else {
                $('#dg').datagrid('selectRow', editIndex);
            }
        }
    }
    function append(){
        if (endEditing()){
            $('#dg').datagrid('appendRow',{status:'P'});
            editIndex = $('#dg').datagrid('getRows').length-1;
            $('#dg').datagrid('selectRow', editIndex)
                .datagrid('beginEdit', editIndex);
            $('#add').window('close')
        }
    }
    function removeit(){
        if (editIndex == undefined){return}
        $('#dg').datagrid('cancelEdit', editIndex)
            .datagrid('deleteRow', editIndex);
        editIndex = undefined;
        $('#del').window('close')
    }
    function accept(){
        if (endEditing()){
            $('#dg').datagrid('acceptChanges');
        }
    }
    function reject(){
        $('#dg').datagrid('rejectChanges');
        editIndex = undefined;
    }
    function getChanges(){
        var rows = $('#dg').datagrid('getChanges');
        alert(rows.length+' rows are changed!');
    }
</script>
<div style="margin:20px 0;">
</div>
<div id="add" class="easyui-window" title="新增"  closed="true" style="width:800px;height:400px;padding:10px;">
    <div><lu>
        <li>name<input style="margin-left: 100px;width: 200px"></li>
        <li>name<input style="margin-left: 100px;width: 200px"></li>
        <li>name<input style="margin-left: 100px;width: 200px"></li>
        <li>name<input style="margin-left: 100px;width: 200px"></li></lu>
    </div>
    <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="append()">新增</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#add').window('close')">取消</a>
</div>
<div style="margin:20px 0;">
</div>
<div id="del" class="easyui-window" title="删除"  closed="true" style="width:300px;height:100px;padding:10px;text-align: center">
    确认删除所选数据吗？
    <a href="javascript:void(0)" class="easyui-linkbutton"  onclick="removeit()">确定</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#del').window('close')">取消</a>
</div>
</body>
</html>