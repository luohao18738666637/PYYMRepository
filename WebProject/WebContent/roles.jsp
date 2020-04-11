<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">   
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/roles.js"></script>
</head>
<body>
<table id="dg" class="easyui-datagrid" style="width:400px;height:250px"   
        data-options="fitColumns:true,singleSelect:true">   
    <thead>   
        <tr>   
            <th data-options="field:'rid',width:100,hidden:true">id</th>   
            <th data-options="field:'rname',width:100">角色</th>
             <th data-options="field:'cz',width:100,formatter:cz">操作</th>       
        </tr>   
    </thead>   
</table> 
<div id="dd">
<form>
角色名称：<input type="text" class="easyui-textbox" id="rrname"/>
<a href="javascript:void(0)" data-options="iconCls:'icon-search'" class="easyui-linkbutton" onclick="look()">查询</a>
<a href="javascript:void(0)" data-options="iconCls:'icon-add'" class="easyui-linkbutton" onclick="tj()">新增</a>
</form>
</div>
<!--添加-->
<div id="insertRoles" class="easyui-dialog" title="添加" style="width:400px;height: 150px;" closed=true>
        <form id="ff" >
            <table style="margin: auto;" cellspacing="10">
                <tr>
                    <td>角色名称：</td>
                    <td><input class="easyui-textbox" id="name" name="text"></td>
                </tr>
            </table>
            <div style="text-align: center; bottom: 15px; margin-top: 20px;">
                <a class="easyui-linkbutton"
                    data-options="iconCls:'icon-save'" onclick="tianjia()" style="width: 20%;">保存</a> <a
                    id="cancelbtn" class="easyui-linkbutton"
                    data-options="iconCls:'icon-cancel'" onclick="qx()" style="width: 20%;">取消</a>
            </div>
        </form>
    </div>
  <!--修改-->
    <div id="updateRoles" class="easyui-dialog" title="修改" style="width:400px;height: 150px;" closed=true>
        <form id="f">
            <table style="margin: auto;" cellspacing="10">
                <tr>
                    <td>角色名称：</td>
                    <td><input class="easyui-textbox" id="rname" name="rname" value="" data-options="required:true"></td>
                </tr>
                 <tr style="display: none">
                    <td></td>
                    <td><input class="easyui-textbox" id="rid" name="rid" value="" data-options="required:true"></td>
                </tr>
            </table>
            <div style="text-align: center; bottom: 15px; margin-top: 20px;">
                <a class="easyui-linkbutton"
                    data-options="iconCls:'icon-save'" onclick="xiugai()" style="width: 20%;">保存</a> <a
                    id="cancelbtn" class="easyui-linkbutton"
                    data-options="iconCls:'icon-cancel'" onclick="qx()" style="width: 20%;">取消</a>
            </div>
        </form>
    </div>
 <!--权限-->  
<div id="quanxian" class="easyui-dialog" title="权限管理" style="width:200px;height: 220px;" closed=true>
 <div class="easyui-layout" style="width:100%;height:250px;">
			<div  style="width:150px;">
				<ul id="m" class="easyui-tree" data-options="checkbox:true">
					
				</ul>
			</div>
		</div>     
      <div><a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'" onclick="baocun()">保存</a></div> 
</div> 

</body>
<script type="text/javascript">
$(function() {
	look();
})
function look() {
	$("#dg").datagrid({
		url : "juese",
		method : "post",
		pagination : true,
		singleSelect : true,
		rownumbers : true,
		toolbar : "#dd",
		queryParams : {
			rname : $("#rrname").val()
		}
	})
}
function cz(value, row, index) {
	return "<a href='javascript:void(0)' onclick='quanxian(" + index
			+ ")'>权限</a> <a href='javascript:void(0)' onclick='xg(" + index
			+ ")'>修改</a> <a href='javascript:void(0)' onclick='shanchu("
			+ index + ")'>删除</a>"
}
function tj() {
	$("#insertRoles").dialog("open");
}
function tianjia() {
	var rname=$("#name").val();

	if(rname==null || rname ==""){
	
		$.messager.alert("提示", "角色名不可为空！");
	}else{
			
	$.post("insertRoles", {
		rname:rname
	}, function(res) {
		if (res == 1) {
			$.messager.alert("提示", "添加成功");
			$("#insertRoles").dialog("close");
			$("#dg").datagrid("load");
		} else if (res == 0) {
			$.messager.alert("提示", " 角色重复");
		} else {
			$.messager.alert("提示", "添加失败");
		}
	}, "json");
	}
	$("#ff").form("clear");
}

function xiugai() {
	$.post("updateRoles", {
		rname : $("#rname").val(),
		rid : $("#rid").val()

	}, function(res) {
		if (res == 1) {
			$.messager.alert("提示", "修改成功");
			$("#updateRoles").dialog("close");
			$("#dg").datagrid("load");
		} else if (res == 0) {
			$.messager.alert("提示", "角色重复");

		} else {
			$.messager.alert("提示", "修改失败");
		}
	})
}
function shanchu(index) {
	var data = $("#dg").datagrid("getData");
	var row = data.rows[index];
	$.messager.confirm("提示信息", "确定删除？", function(r) {
		if (r) {
			$.post("deleteRoles", {
				rid : row.rid
			}, function(res) {
				if (res==1) {
					$.messager.alert("提示", "删除成功");
					$("#dg").datagrid("load");
				} else if(res==-1){
					$.messager.alert("提示", "角色下用户不为空");
				}else{
					$.messager.alert("提示", "删除失败");
				}

			}, "json")
		}
	})
}
function qx() {
	$("#insertRoles").dialog("close");
	$("#updateRoles").dialog("close");
}
function xg(index) {
	var data = $("#dg").datagrid("getData");
	var row = data.rows[index];
	$("#updateRoles").dialog("open");
	$("#f").form("load", row)
}
var rid=null;
function quanxian(index) {

	var data = $("#dg").datagrid("getData");
	var row = data.rows[index];
	
	$.post("rolesTree", {
		rid : row.rid
	}, function(res) {
		$("#m").tree("loadData", res)
	}, "json")
	rid=null;
	rid=row.rid;
	$("#quanxian").dialog("open");
}
function baocun(){
	
	var trees = $("#m").tree("getChecked", [ "checked", "indeterminate" ]);
	var ids = "";
	for (var i = 0; i < trees.length; i++) {
		if (ids == "") {
			ids = ids + trees[i].id;
		} else {
			ids = ids + "," + trees[i].id;
		}
	}
	$.post("tianjiaRoles", {
		mid : ids,
		rid : rid
	}, function(res) {
		if (res>0) {
			$('#quanxian').dialog('close');
			$("#dg").datagrid("reload");
			$.messager.show({
				title : '我的消息',
				msg : '分配成功',
				timeout : 1000,
				showType : 'slide',
				style : {
					top : document.body.scrollTop
							+ document.documentElement.scrollTop,
				}
			});
		} else {
			$('#quanxian').window('close');
			$("#dg").datagrid("reload");
			$.messager.show({
				title : '我的消息',
				msg : '分配失败',
				timeout : 1000,
				showType : 'slide',
				style : {
					top : document.body.scrollTop
							+ document.documentElement.scrollTop,
				}
			});
		}
	}, "json");
}

</script>
</html>