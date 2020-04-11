<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>角色</title>
		<script src="../js/easyui_gonggong.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/jdgl.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			div {
				border: none;
			}
		</style>
	</head>

	<body>

		<table name="center" class="easyui-datagrid" id="dg" title="用户列表" data-options="rownumbers:true,singleSelect:true,pagination:true,fitColumns:true,method:'post',toolbar:'#usertb',pageSize:10">
			<thead>
				<tr>
					<th data-options="field:'Id',width:280,hidden:true">用户ID</th>
					<th data-options="field:'Name',width:100">角色名</th>
					<th data-options="field:'sss',formatter:hhd" style="width: 100px;">操作</th>
					<th data-options="field:'b1',formatter:b1" style="width: 100px;">权限</th>
				</tr>
			</thead>
		</table>

		<div id="usertb" style="padding:5px; height:auto">
			<div style="margin-bottom:5px">
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addInfo()">新增</a>
			</div>
		</div>

		<div id="win" class="easyui-window" title="编辑" style="width:300px;height:400px;text-align: right;padding-right: 30px;" data-options="iconCls:'icon-save',modal:true">
			<form id="ff">
				<br />
				<input class="easyui-validatebox" type="text" name="Id" id="Id" style="display: none;" /><br /><br /> 角色名：
				<input class="easyui-validatebox" type="text" name="Name" id="Name" /><br /><br />
				<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="bianji()" data-options="iconCls:'icon-ok'">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#ff').form('reset')" data-options="iconCls:'icon-clear'">清空</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="quxiao()" data-options="iconCls:'icon-no'">取消</a>
			</form>
		</div>

		<div id="addjs" class="easyui-window" title="编辑" style="width:300px;height:400px;text-align: right;padding-right: 30px;" data-options="iconCls:'icon-save',modal:true">
			<form id="ffjs">
				<br /> 角色名：
				<input class="easyui-validatebox" type="text" name="Name2" id="Name2" /><br /><br />
				<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="tianjia()" data-options="iconCls:'icon-ok'">添加</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#ffjs').form('reset')" data-options="iconCls:'icon-clear'">清空</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="quxiao()" data-options="iconCls:'icon-no'">取消</a>
			</form>
		</div>

		<div id="quanxiantree" class="easyui-window" style="width:300px;height:600px" data-options="iconCls:'icon-save',modal:true">
			<div class="easyui-layout" data-options="fit:true">
				<div data-options="region:'north',split:true" style="height:535px">
					<div id="mkdiv" class="easyui-panel" style="padding:5px">
						<ul id="tt" class="easyui-tree" data-options="iconCls:'icon-save',collapsible:true"></ul>
					</div>
				</div>
				<div data-options="region:'center'" style="text-align: right;">
					<a id="btn" href="javascript:void(0)" style="margin-right: 30px;" class="easyui-linkbutton" onclick="baocun()" data-options="iconCls:'icon-ok'">保存</a>
				</div>
			</div>
		</div>
	</body>

</html>
