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
<body>
<table  class="easyui-datagrid" id="dg" title="" style="width:300;height:400" 
>
    <thead>
        <tr>
            
             <th data-options="field:'uid',hidden:true">用户ID</th>               
            <th data-options="field:'uname',width:100">账号</th> 
            <th data-options="field:'upassword',width:100">密码</th>
            <th data-options="field:'uphone',width:140">手机号</th>
            <th data-options="field:'uemail',width:180">电子邮箱</th>         
             <th data-options="field:'updatexx',width:120,align:'center',formatter:updatexx">操作项</th>         
       </tr>
    </thead>
</table>
</body>
<script type="text/javascript">
$(function (){
	wanshanxx();
})
function updatexx(value,row,index){
	return "<a href='javascript:void(0)' onclick='updateUsers'>修改</a>"
}
function wanshanxx(){
	$("#dg").datagrid({
		url:"wanshanxx",
		method:"post"
	})
}

</script>
</html>