
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
 <%@page import="com.tes1.evaluate.domain.*,java.util.*"%>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<style type="text/css">



ul,li,ol {
	list-style: none;
}

.clear {
	height: 0px;
	line-height: 0px;
	font-size: 0px;
	overflow: hidden;
	clear: both;
}
body{
	overflow:scroll;
	overflow-x:hidden;
	padding: 0;
    margin: 0;
}
a {
	text-decoration: none;
}
.addDiv{
    margin-top: 6%;
    margin-left: 15%;
    font-size: 18px;
}
.inputStyle{
	height: 24px;
    background: white;
    text-indent: 5px;
}
.addDiv>ul>li{
	margin-top: 15px;
}
.sbre{
	width: 63px;
    height: 31px;
    margin-left: 54px;
    background: #95b8e7;
    border: 3px solid #95b8e7;
    color: #fdfdfd;
    border-radius: 7px;
}
.edit-content{
    margin-top: 6%;
    margin-left: 15%;
    font-size: 16px;
    margin-right: 15%;
}
.edit-content ul li{
	margin-top: 20px;
}
#actionul{
     width: 480px;
    height: 77px;
}
#actionul li{
	float:left;
	font-size: 14px;
    width: 115px;
}
</style>
<script language="javascript">
/**
* 跳转到详情页面
*/
function gotoUserDetail(uid){	
	var url = "/TCES/lookingActionAction?id="+uid;
	console.log(url);
	var tab = $('#tt').tabs('getSelected');
	if(tab!=undefined && tab!=null){
		/*if ($('#tt').tabs('exists', '用户详情')){
			tab.panel('refresh', url);
	    } else { */
	    	$('#tt').tabs('add',{
			    title:'用户详情',
			    href:url,
			    closable:true,
			    tools:[{
					iconCls:'icon-mini-refresh',
					handler:function(){
						//alert('refresh');
					}
			    }]
			});
	    //} 
	} else {
		 $.messager.alert('警告','无法获取当前tab','error'); 
	}
	
}

/**
 * 创建一个模态 Dialog
 * 
 * @param id divId
 * @param _url Div链接
 * @param _title 标题
 * @param _width 宽度
 * @param _height 高度
 * @param _icon ICON图标
 */
$(document).ready(function(){
	$('#dg_scale').datagrid({
		 title: '角色信息管理',  //表格名称
		 iconCls: 'icon-save',  //图标
		 width:1080,   //表格宽度
		 height:'auto',   //表格高度，可指定高度，可自动
		 border:true,  //表格是否显示边框
		url:'scalelistAction',
	    columns:[[
	    	/* {field:'id',title:'用户id',width:200}, */
	        {field:'scaleName',title:'角色名',width:200},
	        {field:'id',title:'操作',width:200,align:'center',
	            formatter: function(value,row,index){
	              	return '<button onclick="gotoUserDetail('+row.id+')">权限查看</button>'
	              //	'<a href="/TCES/lookingActionAction?id='+ row.id+'">功能查看</a>'	
	             }
	       }
	    ]],   
	    pagination:true,//如果表格需要支持分页，必须设置该选项为true
	    pageSize:17,   //表格中每页显示的行数
	    pageList:[10,17,20,30],
	    fit:true,//自动补全  
        fitColumns:true,  
        singleSelect:false,
	    rownumbers:true,   //是否显示行号
	    nowrap: false,   
	    striped: true,  //奇偶行是否使用不同的颜色
	    method:'POST',   //表格数据获取方式,请求地址是上面定义的url
	    sortName: 'ID',  //按照ID列的值排序
	    sortOrder: 'desc',  //使用倒序排序
	    idField: 'id',
	    loadMsg:'数据正在努力加载，请稍后...',   //加载数据时显示提示信息
	    frozenColumns: [[  //固定在表格左侧的栏
	              {field: 'ck', checkbox: true},
	            ]],
	    toolbar: [{
            text: '添加',
            iconCls: 'icon-add',
            handler: function() {
               //移除存在的Dialog
            	$("#dialog_add").remove();//或 $("body").remove("#dialog_add");
            	/**先根据div的id删除，但界面元素还是会存在dialog div，还需执行dialog的销毁操作**/
            	$("#dialog_add").dialog('destroy');
            	
            	/*var _buttons = [{
    				 text:'Save',
    				handler:function(){
    					//保存数据 
					}
    			},{
    				text:'Close',
    				handler:function(){
    					 // 关闭窗口
    					$("#dialog_add").dialog('close'); 
					} 
    			}];*/
            	//创建窗口
            	createModalDialog("dialog_add","/TCES/findActionAction","添加角色", 600,450);
            	$("#dialog_add").dialog('open');//打开窗口 
            }
        }, '-', {
            text: '修改',
            iconCls: 'icon-edit',
            handler: function() {
            	var rows =  $("#dg_scale").datagrid("getSelections");
            	if(rows.length<=0)  
                {  
                    $.messager.alert('警告','您没有选择','error');  
                }  
                else if(rows.length>1)  
                {  
                    $.messager.alert('警告','请选择一条待处理数据','error');  
                }
                else  
                {  
                	var rowId = rows[0].id;
	            	//移除存在的Dialog
	            	$("#dialog_edit").remove();//或 $("body").remove("#dialog_edit");
	            	/**先根据div的id删除，但界面元素还是会存在dialog div，还需执行dialog的销毁操作**/
	            	$("#dialog_edit").dialog('destroy');
	            	var _buttons = [{
	    				text:'保存',
	    				handler:function(){
	    					// 保存数据
	    					//consloe.log("这里已经获取被修改数据的ID："+rowId);
	    					$.ajax({
								 url:'updateScaleAndActionAction',
								 data:$('#formadd').serialize(),
								 type:"post",
								 scriptCharset:'UTF-8',
								 error:function(){
									 if($('#formadd').serialize()==null){
										 
									 }
									 alert("修改一条数据！");
								 },
								 success:function(ress){
									 console.log(ress);
									 $("#dialog_edit").dialog('close');
									 $("#dg_scale").datagrid('reload');
								 }
								
							 });
						}
	    			},{
	    				text:'关闭',
	    				handler:function(){
	    					// 关闭窗口
	    					$("#dialog_edit").dialog('close');
						}
	    			}];
	            	//创建窗口
	            	createModalDialog("dialog_edit","findSecondActionAction?id="+rowId+"","修改角色", 500, 320,'icon-modify',_buttons);
	            	$("#dialog_edit").dialog('open');
                }
            }
        }, '-', {
            text: '删除',
            iconCls: 'icon-remove',
            handler: function() {
            	var  rows  =  $("#dg_scale").datagrid("getSelections");
            	if(rows.length<=0)  
                {  
                    $.messager.alert('警告','您没有选择','error');  
                }  
               /*  else if(rows.length>1)  
                {  
                    $.messager.alert('警告','不支持批量删除','error');  
                }  */ 
                else  
                {  
                	var ids = "";
                	for(var i=0;i<rows.length;i++){
                		if(i>0)
                			ids = ids + ",";
                		ids = ids + rows[i].id;
                	}
                	if(ids!=''){
                		$.messager.confirm('确定','您确定要删除吗',function(t){  
                         if(t)  
                         {  
                             $.ajax({  
                                 url : 'deleteScale',  
                                 data : {'ids': ids},
                                 dataType : 'json',  
                                 success : function(r) {  
                                 	console.log(r);
                                     if (r.success && r.success>0) {  
                                     	$('#dg_scale').datagrid('acceptChanges');  
                                         $.messager.show({  
                                             msg : r.msg,  
                                             title : '成功'  
                                         });  
                                         $("#dg_scale").datagrid('reload');  
                                     } else {  
                                         /*datagrid.datagrid('rejectChanges');*/  
                                         /* datagrid.datagrid('beginEdit', editRow);  */ 
                                         $.messager.alert('错误', r.msg, 'error');  
                                     }  
                                     /* datagrid.datagrid('unselectAll');   */
                                 }  
                             });
                         }  
                     });  
                } else {
                	$.messager.alert('警告','您没有选择','error');   
                }	                        
          	 }  
          }
       },'-',{
    	   text: '<input type="text" id="filter" name="filter"/>',
	   },{
	   iconCls: 'icon-search',
	   handler: function() {
		   var filter = $("#filter").val();
		   $.ajax({  
               url : "/TCES/scalelistSearchAction?filter="+filter+"",
               success : function(data){
            	   $('#dg_scale').datagrid('loadData', JSON.parse(data));
               }
           });
	   }
   }]
	});
	//$('#dg_scale').datagrid('hideColumn', 'id');
	function createModalDialog(id, _url, _title, _width, _height, _icon,_buttons){
	    $("body").append("<div id='"+id+"' class='easyui-window'></div>");
	    if (_width == null)
	        _width = 800;
	    if (_height == null)
	        _height = 500;

	    $("#"+id).dialog({
	        title: _title,
	        width: _width,
	        height: _height,
	        cache: false,
	        iconCls: _icon,
	        href: _url,
	        collapsible: false,
	        minimizable:false,
	        maximizable: true,
	        resizable: true,
	        modal: true,
	        closed: true,
	        buttons: _buttons
	    });
	}
});
</script>
<table id="dg_scale"></table>
<div id=""></div>
