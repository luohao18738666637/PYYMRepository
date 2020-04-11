<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.4.3/themes/default/easyui.css">
<link rel="stylesheet" type="text/css"
	href="jquery-easyui-1.4.3/themes/icon.css">
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript" src="js/yanzheng.js"></script>
<body>

<form id="ff">
<table  id="dg" Style="width: 280px;height:400px;" >			

<tr>
<td><label>真实姓名：</label></td>
<td><input type="text" value="${zname }" required="required" id="zname" class="easyui-textbox"></td>
</tr>
<tr>
<td><label>账户:</label></td>
<td><input type="text" required="required" value="${uname}" id="uname" disabled="disabled" class="easyui-textbox"></td>
</tr>
<tr>
<td><label>电话：</label></td>
<td><input type="text" value="${phone }" required="required" validType="mobile" id="uphone" class="easyui-textbox"></td>
</tr>
<tr>
<td><label>邮箱:</label></td> 
<td><input type="text" value="${email }" required="required" validType="msn" id="uemail" class="easyui-textbox"></td>
</tr>
<tr>
<td><label></label></td>
<td><a href="javascript:void(0)" class="easyui-linkbutton"  onclick="baocun()">保存</a></td>
</tr>
</table>
</form>

</body>
<script type="text/javascript">
function baocun(){
	if($("#ff").form("validate")){
		$.messager.confirm("提示","是否保存修改后的信息",function(r){
			if(r){
		$.post("gerenxx",{
			zname:$("#zname").val(),
			uphone:$("#uphone").val(),
			uemail:$("#uemail").val()
		},function(res){
			if(res>0){
				$.messager.alert("提示","修改成功");
				
			}else{
				$.messager.alert("提示","修改失败");
			}
		})
			}
		})
	
	}else{
		$.messager.alert("提示","手机或邮箱格式不对");
	}
}
</script>
</html>