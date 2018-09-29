var url;
var url2;
function searchDept() {
    $("#dg").datagrid('load', {
        "DeptName" : $("#s_DeptName").val()
    });
}
function openDeptAddDialog() {
    $("#dlg").dialog("open").dialog("setTitle", "添加学院信息");
    url = "/TES1/save.do";
}

function openDeptModifyDialog() {
    var selectedRows = $("#dg").datagrid("getSelections");
    if (selectedRows.length != 1) {
        $.messager.alert("系统提示", "请选择一条要编辑的数据！");
        return;
    }
    var row = selectedRows[0];
    $("#dlg").dialog("open").dialog("setTitle", "编辑学院信息");
    $("#fm").form("load", row);
    url = "/TES1/save.do?id=" + row.deptID;
}

function saveDept() {
    $("#fm").form("submit", {
        url : url,
        onSubmit : function() {
            return $(this).form("validate");
        },
        success : function(result) {
            var result = eval('(' + result + ')');

            if (result.success) {
                $.messager.alert("系统提示", "保存成功！");
                resetValue();
                $("#dlg").dialog("close");
                $("#dg").datagrid("reload");
            } else {
                $.messager.alert("系统提示", "保存失败！");

                return;
            }
        }
    });
}

function resetValue() {
    $("#DeptCode").val("");
    $("#DeptName").val("");

}

function closeDeptDialog() {
    $("#dlg").dialog("close");
    resetValue();
}

function deleteDept() {
    url2 = "/TES1/delete.do";
    var selectedRows = $("#dg").datagrid("getSelections");

    if (selectedRows.length == 0) {
        $.messager.alert("系统提示", "请选择要删除的数据！");
        return;
    }
    var strIds = [];
    for ( var i = 0; i < selectedRows.length; i++) {
        strIds.push(selectedRows[i].deptID);
        alert(selectedRows[i].deptID)
    }

    var ids = strIds.join(",");
    $.messager.confirm("系统提示", "您确定要删除这<font color=red>"
        + selectedRows.length + "</font>条数据吗？", function(r) {
        if (r) {
            $.post(url2, {
                ids : ids
            }, function(result) {
                if (result.success) {
                    $.messager.alert("系统提示", "数据已成功删除！");
                    $("#dg").datagrid("reload");
                } else {
                    $.messager.alert("系统提示", "数据删除失败，请联系系统管理员！");
                }
            }, "json");
        }
    });
}

function InputExcelDialog() {
    $("#ifdlg").dialog("open").dialog("setTitle", "导入Excel");
    url = "/TES1/upload";
    return;
}
function upload() {

}