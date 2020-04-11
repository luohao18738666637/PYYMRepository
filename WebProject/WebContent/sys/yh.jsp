<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>用户</title>
		<script src="../js/easyui_gonggong.js" type="text/javascript" charset="utf-8"></script>
		<script src="../js/yh.js" type="text/javascript" charset="utf-8"></script>
		<style type="text/css">
			div{
				border: none;
			}
			#jsmokuai>div {
				float: left;
				height: 500px;
				margin-top: 50px;
			}
			
			#jsdiv_1 {
				margin-left: 45px;
				width: 210px;
			}
			
			#jsdiv_3 {
				width: 210px;
			}
			
			#jsdiv_2 {
				width: 80px;
			}
		</style>
	</head>

	<body>

		<table name="center" class="easyui-datagrid" id="dg" title="用户列表" data-options="rownumbers:true,singleSelect:true,pagination:true,fitColumns:true,method:'post',toolbar:'#usertb',pageSize:10">
			<thead>
				<tr>
					<th data-options="field:'Id',width:150,hidden:true">用户ID</th>
					<th data-options="field:'LoginName',width:150">用户名</th>
					<th data-options="field:'ProtectEMail',width:150">邮箱</th>
					<th data-options="field:'ProtectMTel',width:150">手机号</th>
					<th data-options="field:'IsLockout',width:150">是否锁定</th>
					<th data-options="field:'CreateTime',width:150">创建时间</th>
					<th data-options="field:'LastLoginTime',width:150">最后登录的时间</th>
					<th data-options="field:'a',formatter:a1,width:150">角色设置</th>
					<th data-options="field:'s',formatter:hhd1,width:150">操作</th>
					<th data-options="field:'ss',formatter:hhd2,width:150">重置密码</th>
					<th data-options="field:'sss',formatter:hhd3,width:150">用户操作</th>
				</tr>
			</thead>
		</table>
		<div id="usertb" style="padding:5px; height:auto">
			<div style="margin-bottom:5px">
				名称: <input class="easyui-textbox" id="userName" style="width:80px"> 开始时间: <input class="easyui-datetimebox" name="beginDate" id="beginDate" data-options="showSeconds:false" style="width:150px"> ~~~ 结束时间: <input class="easyui-datetimebox" name="endDate" id="endDate" data-options="showSeconds:false" style="width:150px"> 是否锁定:
				<select id="isLock" class="easyui-combobox" name="dept" style="width:200px;">
					<option value="">---请选择---</option>
					<option value="是">已锁定</option>
					<option value="否">未锁定</option>
				</select>

				排序字段名称:
				<select id="orderBy" class="easyui-combobox" name="dept" style="width:200px;">
					<option value="">---请选择(默认正序)---</option>
					<option value="LoginName">用户名</option>
					<option value="IsLockout">是否锁定</option>
					<option value="LastLoginTime">最后登陆时间</option>
					<option value="CreateTime">创建时间</option>
					<option value="ProtectEMail">邮箱</option>
					<option value="ProtectMTel">手机号</option>
				</select>
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="searchUserInfo()">查找</a>&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addInfo()">新增</a>
			</div>
		</div>
		<div id="win" class="easyui-window" title="编辑" style="width:300px;height:400px;text-align: right;padding-right: 30px;" data-options="iconCls:'icon-save',modal:true">
			<form id="ff">
				<br /> 姓名：
				<input class="easyui-validatebox" required="true" validType="minLength['3']" type="text" name="LoginName" id="LoginName" /><br /><br /> 邮箱：
				<input class="easyui-validatebox" required="true" validType="msn" type="text" name="ProtectEMail" id="ProtectEMail" /><br /><br /> 手机号：
				<input class="easyui-validatebox" required="true" validType='mobile' type="text" name="ProtectMTel" id="ProtectMTel" /><br /><br />
				<a id="btn" href="javascript:void(0)" class="easyui-linkbutton" onclick="bianji()" data-options="iconCls:'icon-ok'">编辑</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#ff').form('reset')" data-options="iconCls:'icon-clear'">清空</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="quxiao()" data-options="iconCls:'icon-no'">取消</a>
			</form>
		</div>
		<div id="addyh" class="easyui-window" title="添加" style="width:300px;height:400px;text-align: right;padding-right: 30px;" data-options="iconCls:'icon-save',modal:true">
			<form id="addform">
				<br /> 姓名：
				<input class="easyui-validatebox" required="true" validType="minLength['3']" type="text" name="LoginName1" id="LoginName1" /><br /><br /> 邮箱：
				<input class="easyui-validatebox" required="true" validType="msn" type="text" name="ProtectEMail1" id="ProtectEMail1" /><br /><br /> 手机号：
				<input class="easyui-validatebox" required="true" validType='mobile' type="text" name="ProtectMTel1" id="ProtectMTel1" /><br /><br /> 密码：
				<input class="easyui-validatebox" required="true" validType="minLength['5']" type="password" name="password1" id="password1" /><br /><br />
				<a id="btn1" href="javascript:void(0)" class="easyui-linkbutton" onclick="tianjia()" data-options="iconCls:'icon-ok'">添加</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#addform').form('reset')" data-options="iconCls:'icon-clear'">清空</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="javascript:void(0)" class="easyui-linkbutton" onclick="quxiao()" data-options="iconCls:'icon-no'">取消</a>
			</form>
		</div>
		<div id="jsmokuai" class="easyui-window" style="width:600px;height:600px;text-align: right;padding-right: 30px;" data-options="iconCls:'icon-save',modal:true">
			<div id="jsdiv_1">
				<table name="center" class="easyui-datagrid" id="js_left" data-options="rownumbers:true,singleSelect:true,fitColumns:true,method:'post'">
					<thead>
						<tr>
							<th data-options="field:'Id',width:280,hidden:true">用户ID</th>
							<th data-options="field:'Name',width:100">系统所有角色</th>
						</tr>
					</thead>
				</table>
			</div>
			<div id="jsdiv_2">
				<a style="margin-top: 150px;float: left;margin-left: 25px;" id="jsbtn_fenpei" onclick="fenpei()" href="javascript:void(0)" class="easyui-linkbutton"> > > </a>
				<a style="margin-top: 20px;float: left;margin-left: 25px;" id="jsbtn_yichu" onclick="yichu()" href="javascript:void(0)" class="easyui-linkbutton">
					< < </a>
			</div>
			<div id="jsdiv_3">
				<table name="center" class="easyui-datagrid" id="js_right" data-options="rownumbers:true,singleSelect:true,fitColumns:true,method:'post'">
					<thead>
						<tr>
							<th data-options="field:'Id',width:280,hidden:true">用户ID</th>
							<th data-options="field:'Name',width:200">当前用户角色</th>
						</tr>
					</thead>
				</table>
			</div>
		</div>
	</body>

</html>
