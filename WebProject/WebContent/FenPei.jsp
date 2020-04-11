<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.4.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/students.js"></script>
<script type="text/javascript" src="js/hidden.js"></script>
<script type="text/javascript">
	$(function() {
		chaxun();
	})
	$(function() {
		zxs();
		wlzxs();
	})
	function zxs() {
		$('#zxs').combobox({
			url : 'zxs',
			valueField : 'uid',
			textField : 'uname'
		});
	}
	function wlzxs() {
		$('#wlzxs').combobox({
			url : 'wlzxs',
			valueField : 'uid',
			textField : 'uname'
		});
	}
	
	function chaxun() {

		$("#dg").datagrid({
			url : "fenpei",
			method : "post",
			pagination : true,
			rownumbers : true,
			pageSize : 10,
			toolbar : "#tab"		
		})		
	}
	function st(value, index, index) {
		return value == 0 ? "在校" : "离校";
	}
	function xb(value, row, index) {
		return value == 0 ? "男" : "女";
	}
	function huifang(value, row, index) {
		return value == 0 ? "否" : "是";
	}
	function sfyouxiao(value, row, index) {
		return value == 0 ? "否" : "是";
	}
	function sftuifei(value, row, index) {
		return value == 0 ? "否" : "是";
	}
	function sfjiaofei(value, row, index) {
		return value == 0 ? "否" : "是";
	}
	function sfjinban(value, row, index) {
		return value == 0 ? "否" : "是";
	}
	function fenpei(){
	var data=$("#dg").datagrid("getSelections");
	var uid=$("#zxs").textbox("getValue");
	if(data!=null && data!=""){
	var sid="";
		for(var i=0;i<data.length;i++){
			if(i==0){
				sid=sid+data[i].sid;
			}else{
				sid=sid+","+data[i].sid;
			}
		}
	}else{
		$.messager.alert("提示！","请选择要分配的学生");
	}

 $.messager.confirm("提示","确定分配？",function(r){
	 if(r){
		 
		$.post("fenpeiStudents",{
			fid:sid,
			uid:uid
			
		},function(res){
			if(res>0){
				$.messager.alert("提示","分配成功");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("提示","分配失败");
			}
		},"json") 
	 }
 })
	}
	
</script>
</head>
<body>
	<table id="dg" class="easyui-datagrid"
		style="width: auto; height: auto">
		<thead>
			<tr>
				<th data-options="field:'checkbox',width:100,checkbox:true">选择</th>
				<th data-options="field:'sid',width:100,hidden:true">id</th>
				<th data-options="field:'sname',width:100">姓名</th>
				<th data-options="field:'createTime',width:100">创建时间</th>
				<th data-options="field:'sphone',width:100">电话</th>
				<th data-options="field:'sex',width:100,formatter:xb">性别</th>
				<th data-options="field:'age',width:100">年龄</th>
				<th data-options="field:'xueli',width:100">学历</th>
				<th data-options="field:'weChat',width:100">微信</th>
				<th data-options="field:'qq',width:100">QQ</th>				
				
			</tr>
		</thead>
	</table>
	<div align="right" id="tab">
	<div>
	<input id="chck" type="checkbox">
           <label for="chck" class="check-trail">
           <span class="check-handler"></span>
            </label>
	</div>
		<form id="f" >
			<table>
				<tr>
				<th><lable>咨询师：</lable></th>
						<th><select id="zxs" class="easyui-combobox"
						style="width: 90px;">						
					</select></th>
					<th><label><a href="javascript:void(0)" class="easyui-linkbutton" onclick="fenpei()">分配</a></label></th>
									
				</tr>
			</table>
		</form>
	</div>
</body>
</html>