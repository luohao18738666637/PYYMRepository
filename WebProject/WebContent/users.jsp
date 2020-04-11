<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css">   
<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css">   
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>   
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>  
<script type="text/javascript" src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script> 
<script type="text/javascript" src="js/users.js"></script> 
<script type="text/javascript" src="js/yanzheng.js"></script> 
</head>
<script type="text/javascript">
function qd(value, row, index) {
	return value == 0 ? "签退" : "签到";
}
function qiantui(){
	alert("ddd");
	var data=$("#dg").datagrid("getSelections");
	
	if(data!=null && data!=""){
		var uuid="";	
	for(var i=0;i<data.length;i++){
		if(i==0){
			uuid=uuid+data[i].uid;
		}else{
			uuid=uuid+","+data[i].uid
		}
	}

	$.post("qiantuiUsers",{
		uuid:uuid
	},function(res){
	$.messager.confirm("提示！","确定签退选中员工？",function(r){
		if(r){
			if(res>0){
				$.messager.alert("提示！","签退成功");
				$("#dg").datagrid("reload")
				
			}else{
				$.messager.alert("提示！","签退失败");	
			}
		}
	})
	})
	}
}
function qiantuiALL(){
	$.post("qiantuiall",{
		qiandao:"1"
	},function (res){
		$.messager.confirm("提示","是否签退所有员",function(r){
			if(r){
				if(res>0){
					$.messager.alert("提示","签退成功");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("提示","签退失败");
				}
			}
		})
	})
}

function selectInfo(){	
	var lockout = $("#lockout").combobox("getValue");	
   
	$('#dg').datagrid({    
	    url:'selectAll',  
	    method:"post",
	    queryParams: {
	    	uname:$("#uname").val(),
	    	setTime:$("#setTime").val(),
	    	endTime:$("#endTime").val(),
	    	lockout:lockout
		}  
	}); 
	$("#userstiaoform").form("clear");
}
$(function(){		
	selectInfo()	
})

//操作项
function formatterUsers(value,row,index) {
 	return "<a style='cursor: pointer;' onclick='updateInfo(" + index + ")'>编辑</a> <a style='cursor: pointer;' onclick='deleteInfo()'>删除</a> ";
 } 

//重置密码
function formatterUpassword(value,row,index) {
 	return "<a style='cursor: pointer;' onclick='updateUpassword(" + index + ")'>重置</a>";
 }
function formattersuoding(value,row,index){	
	 return row.lockout==0? '未锁定':'已锁定'; 
	} 	
function updateInfo(index) {	
	$("#updateUsersForm").form("clear");
	//将当前行数据填入表单
	var data = $("#dg").datagrid("getData"); 
	var row = data.rows[index];
	
	$("#updateUsersForm").form("load", row); 		
	$("#updateUsers_window").window("open");
	$('#updateUsers_window').window('center');
}
//点击取消，关闭修改弹窗
function closeUsersForm() {	
	$("#updateUsersForm").form("clear");
	$("#updateUsers_window").window("close");
}
//确认修改    
function updateForm() {
	if($("#updateUsersForm").form("validate")){
	var uid=$("#dg").datagrid("getSelected").uid;		
	var uemail_u = $("#uemail_u").val();	
	var uphone_u = $("#uphone_u").val();	

	$.post(
		"updateUsers", {
			uid:uid,
			uemail:uemail_u,
			uphone:uphone_u
		},
		function(res) {			
			if(res>0) {
				$.messager.alert("提示","编辑员工信息成功");
				$("#updateUsers_window").window("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("提示","修改员工信息失败");	
				
			}
		}, "json");
	}else{
		alert("邮箱或手机号格式不正确");
	}
}	

//删除一条员工数据
function deleteInfo(){
		$.messager.confirm('确认','您确认想要删除这条员工信息吗？',function(r){
			if(r){
				var uid=$("#dg").datagrid("getSelected").uid;
				$.post("deleteUsers",{
					uid:uid		
				},function(res) {
					if(res>0) {
						$.messager.alert("提示","删除这条员工信息成功!");			
						$("#dg").datagrid("load");
					}else{
						$.messager.alert("提示","删除这条员工信息失败!");
					}
				},"json");
			}
	})
}


//点击新增按钮
function addInfo() {
	$("#addUsersForm").form("clear");
	$('#unameall').datagrid({    
	    url:'selectUserUname',  
	    method:"post",
	    queryParams: {	
		}  
	}); 
	$('#unameAll_panel').panel('close');
	$("#addUsers_window").window("open");

}
//点击新增保存按钮
function addUsersForm(){
	if($("#addUsersForm").form("validate")){
		
	
	var rows = $('#unameall').datagrid('getRows')//获取当前页的数据行
	var x=0;
	var unames = null;
	
	var uname_i = $("#uname_i").val();	
	var uemail_i = $("#uemail_i").val();	
	var uphone_i = $("#uphone_i").val();		
	var upassword_i = $("#upassword_i").val();	
	var	userTime_i=$("#userTime_i").textbox("getValue");
	
	for (var i = 0; i < rows.length; i++) {
		unames = rows[i].uname;
		if(unames==uname_i){
			x=1;
			break;
		}
	
	}
	if (x > 0) {
		$.messager.alert("提示", "该账号已被占用，请重新输入新账号！");
	} else {
		$.post("insertUsers", {
			uname : uname_i,
			upassword : upassword_i,
			uphone : uphone_i,
			uemail : uemail_i,
			userTime : userTime_i
		}, function(res) {

			if (res > 0) {
				$.messager.alert("提示", "添加员工信息成功");
				$("#addUsers_window").window("close");
				$("#dg").datagrid("load");
			} else if (res == -2) {
				$.messager.alert("提示", "用户名重复");
			} else {
				$.messager.alert("提示", "添加员工信息失败");
			}
		}, "json");
	}
	
	}else{
		alert("邮箱或手机号输入格式不正确");
	}
	
	
	
	
	

	
	
}
// 点击取消，关闭添加弹窗
function addUsersFormclose() {	
	
	$("#addUsers_window").window("close");
}
/**
 * 重置用户密码
 */

function updateUpassword(index){
	var uid=$("#dg").datagrid("getData").rows[index].uid;
	$.post(
			"updateUsers", {
				uid:uid,
				upassword:"ysd123",
				
			},
			function(res) {			
				if(res>0) {
					$.messager.alert("提示","员工密码重置成功！");
					$("#updateUsers_window").window("close");
					$("#dg").datagrid("reload");
				}else{
					$.messager.alert("提示","员工密码重置失败！");	
					
				}
			}, "json");
	
}
//是否更改锁定
function formatterlockout(value, row, index) {	
 	return "<a  style='cursor: pointer;' onclick='updatelockout(" + index + ")'>是否</a>";
 }
/**
 * 获取Id和lockout，更改用户锁定状态
 */
function updatelockout(index){
	$.messager.confirm('确认','您确认想要修改这个员工的锁定状态吗？',function(r){
		if(r){
			var uid=$("#dg").datagrid("getData").rows[index].uid;
			var lockout=$("#dg").datagrid("getData").rows[index].lockout;			
			if(lockout==1){
				lockout=0;
			}else{
				lockout=1;
			}		
			$.post(
					"updateUsers",{
						uid:uid,
						lockout:lockout					
					},
					function(res) {			
						if(res>0) {
							$.messager.alert("提示","锁定状态更改成功！");							
							$("#dg").datagrid("reload");
						}else{
							$.messager.alert("提示","锁定状态更改失败！");	
							
						}
					}, "json");	
		}
	})
}

//设置用户角色
function formatterRoles(value, row, index) {
	return "<a style='cursor: pointer;' onclick='showRoles(" + index + ")'>设置</a>";
}

function showRoles(index) {
	//打开当前用户权限管理
	var uid=$("#dg").datagrid("getData").rows[index].uid;	
	$("#uidjvese").val(uid);
	//当前所有的角色
	 $("#RoleAll").datagrid({
  	url: 'selectRolesAll',//数据接口的地址
  	method:"post",
      queryParams: { //要发送的参数列表                 
       }
 }); 	
 //该用户拥有的角色  
  $("#UserRole").datagrid({
  	url: 'selectUserRoles',  //数据接口的地址
  	method:"post",
      queryParams: { //要发送的参数列表
      	uid:uid            
       }
 }); 	
	$("#showRoles_window").window("open");
	
}

function addRole(){
	
	var rows = $('#UserRole').datagrid('getRows')//获取当前页的数据行	
	
	//var uid=$("#dg").datagrid("getSelected").uid;
	var uid=$("#uidjvese").val();

	
	var rid = $("#RoleAll").datagrid("getSelected").rid;
	var x=0;
	var total = 0;
for (var i = 0; i < rows.length; i++) {
				total = rows[i].rid;
				if(rid==total){
				x=1;
				break;
				}
			}					    
			   if(x>0){
					$.messager.alert("提示","您已经拥有该角色");	  
			   }else{
				   if(rid>0){
					   $.post(
					   		"insertUserRoles", 
					   		{
					   			uid:uid,
					             rid:rid			
					   		},
					   		function(res) {			
					   			if(res>0) {
					   				$.messager.alert("提示","添加角色成功");							
					   				$("#UserRole").datagrid("reload");
					   			}else{
					   	$.messager.alert("提示","添加角色失败！！！");	
					   }
					   		}, "json");	
					   }else{
					   	$.messager.alert("提示","请选择角色！！！");	
					   }   
				   
			   }
		
}

function deleteRole(){
	//var uid=$("#dg").datagrid("getSelected").uid;	
	var uid=$("#uidjvese").val();
	var rid = $("#UserRole").datagrid("getSelected").rid;
	
if(rid){
$.post(
		"deleteUserRoles", 
		{
			uid: uid,
			rid:rid
		
		},
		function(res) {			
			if(res>0) {
				$.messager.alert("提示","删除角色成功");							
				$("#UserRole").datagrid("reload");
			}else{
	$.messager.alert("提示","删除角色失败！！！");	
}
		}, "json");	
}else{
	$.messager.alert("提示","请选择角色！！！");	
}
}







</script>
<body>
	<table  class="easyui-datagrid" id="dg" title="CRM用户基本信息列表" style="width:300;height:400" 
data-options="rownumbers:true,pagination:true,toolbar:'#Usersdaohang',pageSize:10">
    <thead>
        <tr>
            <th data-options="field:'checked',checkbox:true"></th>
             <th data-options="field:'uid',hidden:true">用户ID</th>
             <th data-options="field:'zname',width:100">用户姓名</th>                
            <th data-options="field:'uname',width:100">账号</th> 
            <th data-options="field:'upassword',width:100">密码</th>
            <th data-options="field:'uphone',width:140">手机号</th>
            <th data-options="field:'lockout',width:100,formatter:formattersuoding">是否锁定</th>
            <th data-options="field:'qiandao',width:100,formatter:qd">是否签到</th>
            <th data-options="field:'uemail',width:180">电子邮箱</th>         
            <th data-options="field:'userTime',width:180">创建时间</th>   
             <th data-options="field:'caozuo',width:120,align:'center',formatter:formatterUsers">操作项</th>  
              <th data-options="field:'caozuosu',width:100,align:'center',formatter:formatterRoles">设置角色</th>   
             <th data-options="field:'caozuosuoding',width:100,align:'center',formatter:formatterlockout">是否锁定</th>                           
             <th data-options="field:'caozuomima',width:100,align:'center',formatter:formatterUpassword">重置密码</th>               
       </tr>
    </thead>
</table>

	<div id="Usersdaohang" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
		<form id="userstiaoform">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-add" plain="true" onclick="addInfo()">新增</a>&nbsp;&nbsp;&nbsp;&nbsp;
			账号: <input class="easyui-textbox" id="uname" style="width: 80px">
			起止时间:<input class="easyui-numberbox" id="setTime" style="width: 80px">
		            ~<input class="easyui-numberbox" id="endTime" style="width: 80px">
		
			是否锁定： <select id="lockout" class="easyui-combobox" name="lockout" style="width: 200px;">
			    <option value="">--请选择--</option>
				<option value="1">锁定</option>
				<option value="0">未锁</option>
			</select> 
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="selectInfo()">查找</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="qiantui()">签退</a>
			<a href="javascript:void(0)" class="easyui-linkbutton"  onclick="qiantuiALL()">一键签退</a>
			</form>
		</div>
	</div>

	<!--修改的弹窗-->
	
<div id="updateUsers_window" class="easyui-window" title="修改员工信息"
		style="width: 500px; height: 300px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">
		<form id="updateUsersForm">
			<table cellpadding="5">
				<tr>
					<td>登录名（账号）:</td>
					<td><input class="easyui-textbox" type="text"
					 name="uname" id="uname_u" data-options="readonly:true"></input></td>
				</tr>
				<tr>
					<td>邮箱:</td>
					<td><input class="easyui-textbox" type="text"
						name="uemail" id="uemail_u"
						data-options="required:true" validType="msn"></input></td>
				</tr>
			
				<tr>
					<td>手机号:</td>
					<td><input class="easyui-numberbox" type="text"
						name="uphone" id="uphone_u" validType="mobile" data-options="required:true"></input></td>
				</tr>
				
			
			</table>
		</form>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button" data-options="iconCls:'icon-ok'" onclick="updateForm()">保存</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button" data-options="iconCls:'icon-cancel'" onclick="closeUsersForm()">取消</a>
		</div>
	</div>

	<!--添加的弹窗-->
	<div id="addUsers_window" class="easyui-window" title="添加员工信息"
		style="width: 500px; height: 300px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">
			<div id="unameAll_panel" class="easyui-panel">
		     <table name="unameAll" class="easyui-datagrid" id="unameall" title="用户名（账号）列表:隐藏"   data-options="rownumbers:false,singleSelect:true">
                              <thead>
                          <tr>
                            <th data-options="field:'uname',width:280,hidden:false">角色ID</th>                           
                          </tr>
                              </thead>
                        </table>	
                        </div>
		<form id="addUsersForm">	
			<table cellpadding="5">
			<tr>
					<td>登录名（账号）:</td>
					<td><input class="easyui-textbox" type="text" id="uname_i" data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>密码:</td>
					<td><input class="easyui-textbox" type="password" id="upassword_i"data-options="required:true,validType:'length[5,15]'"></input></td>
				</tr>
				<tr>
					<td>邮箱:</td>
					<td><input class="easyui-textbox" type="text" validType="msn" id="uemail_i" data-options="required:true,validType:'email'"></input></td>
				</tr>			
				<tr>
					<td>手机号:</td>
					<td><input class="easyui-numberbox" type="text" validType="mobile" id="uphone_i" data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>日期时间:</td>
					<td>	<input class="easyui-datetimebox" name="birthday" id="userTime_i" data-options="required:true,showSeconds:false"  style="width:150px"> 
        </td>
				</tr>
			
			</table>
		</form>
		<div style="text-align: center; padding: 5px">			
				<a href="javascript:void(0)" class="easyui-linkbutton" type="button" data-options="iconCls:'icon-ok'" onclick="addUsersForm()">保存</a> 
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button" data-options="iconCls:'icon-cancel'" onclick="addUsersFormclose()">取消</a>
		</div>
	</div>

<!--设置权限的弹窗-->
<div id="showRoles_window"  class="easyui-window" title="您正在设置的角色信息"style="width:500px;height:600px;padding:10px;" 
    data-options="modal:true,closed:true,iconCls:'icon-save'"> 
    <input id="uidjvese" type="text" style="display: none" >  
    <form id="showRolesForm">
                <table cellpadding="5" >
                    <tr>
                        <td>
                        <table name="center" class="easyui-datagrid" id="RoleAll" title="角色列表" style="width:200px;height:600px;padding: 10px;" data-options="rownumbers:true,singleSelect:true,method:'post',pageSize:10">
                              <thead>
                          <tr>
                            <th data-options="field:'rid',width:280,hidden:true">角色ID</th>
                            <th data-options="field:'rname',width:100">角色名称</th>           
                          </tr>
                              </thead>
                        </table>	
                        	
                        </td>
                         <td>
                         	<input type="button" name="" id="" value="添加"  onclick="addRole()" /><br />
                         	<input type="button" name="" id="" value="移除"  onclick="deleteRole()" /><br />
                                    
                         </td>
                          <td>
                          	  <table name="center" class="easyui-datagrid" id="UserRole" title="当前用户的角色" style="width:200px;height:600px;padding: 10px;" data-options="rownumbers:true,singleSelect:true,method:'post',pageSize:10">
                              <thead>
                          <tr>
                            <th data-options="field:'rid',width:280,hidden:true">角色ID</th>
                            <th data-options="field:'rname',width:100">角色名称</th>           
                          </tr>
                              </thead>
                        </table>
                          </td>
                    </tr>
                                   
                </table>
    </form>   
</div> 

</body>
</html>