
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






