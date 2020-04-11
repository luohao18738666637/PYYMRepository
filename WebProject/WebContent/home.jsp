<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	 <head>
		<meta charset="UTF-8">
		<title>主页</title>
		<link rel="stylesheet" href="jquery-easyui-1.4.3/themes/icon.css" />
<link rel="stylesheet"
	href="jquery-easyui-1.4.3/themes/default/easyui.css" />
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script> 
		<script src="js/home.js" type="text/javascript" charset="utf-8"></script>
		
		<style type="text/css">
		div {
				border: none;
			}
</style>
		<script type="text/javascript">
		$(function (){
			$('#tui').hide();
		})
		function dao() {
			var qiandao=1;
			$.post("qiandaoUsers",{qiandao:qiandao},function (res){
				if(res==1){
					$.messager.alert("提示","签到成功");
					$('#qian').hide();
					$('#tui').show();
				}else if(res==2){
					$.messager.alert("提示","你已迟到！");
					$('#qian').hide();
					$('#tui').show();
				}else if(res==4){
					$.messager.alert("提示","不能重复签到");
					$('#qian').hide();
					$('#tui').show();
				}else{
					$.messager.alert("提示","签到失败");
				}
			})
			//$('#qian').hide();
			//$('#tui').show();
		}
function tuichucz() {
	$.messager.confirm('确认', '您确认想要退出吗？', function(r) {
		if(r) {
			$.post("chongzhi",
					{
				
					},function(res) {
				if(res>0){
					$.messager.alert("提示","账号清空成功!");	
					location.reload(true);
				}else{
					$.messager.alert("我的消息","账号清空失败!");
				}
			}, "json");
			window.location.href = "login";
		}
	});
	
}
function tui() {
	var qiandao=0;
	$.post("qiantuiUsers",{qiandao:qiandao},function (res){
		if(res==1){
			$.messager.alert("提示","签退成功");
			$('#tui').hide();
			$('#qian').show();
		}else if(res==2){
			$.messager.alert("提示","还未到下班时间不能签退！")
			
		}else if(res==3){
			$.messager.alert("提示","不能重复签退");
			$('#tui').hide();
			$('#qian').show();
		}else{
			$.messager.alert("提示","签退失败");
		}
	
	})
	
}
function updatePassword(){
	$("#win").window("open");
}
function baocun(){
	var upassword2=$("#upassword2").val();
	var upassword1=$("#upassword1").val();
	var upassword=$("#upassword").val();
	$.post("updateUsersPassword",{
		upassword:upassword,
		upassword1:upassword1,
		upassword2:upassword2
	},function(res){
		if(res==1){
			$.messager.alert("友情提示！","密码修改成功");
			
		}else if(res==4){
			$.messager.alert("友情提示！","旧密码不正确");
		}else if(res==2){
			$.messager.alert("友情提示！","两次密码输入不一致");
		}else{
			$.messager.alert("友情提示！","新密码不能与旧密码相同");
		}
	
	})
}
</script>

	</head> 
	<body>	

		<div class="easyui-layout" style="width:100%;height:730px;">
			<div data-options="region:'north'" style="height:100px;text-align: left;">
			
		        <div>
		        <a  style="cursor: pointer;" onclick="tuichucz()">安全退出</a>&nbsp;
		        <a id="qian" style="cursor: pointer;" onclick="dao()" >欢迎!  ${uname} </a>&nbsp;
		        <a id="qian" style="cursor: pointer;" onclick="dao()" >签到</a>&nbsp;
			    <a id="tui" style="cursor: pointer;" onclick="tui()" >签退</a>&nbsp;
			     <a  id="tui" style="cursor: pointer;text-align: right" onclick="updatePassword()" >修改密码</a>		
			  		  		    
			    </div>				
				<span style="display: block;text-align: right;margin-top: 20px;margin-right: 30px;">
			</span> 
			</div>
			<div data-options="region:'west',split:true" title="导航应用" style="width:150px;">
				<div id="menuTree">
					<!--这个地方显示树状结构-->
				</div>
			</div>
			<div id="centerTabs" data-options="region:'center',iconCls:'icon-ok'" style="width: 530px;height:800px">
				<div id="tabs" class="easyui-tabs">
					<!--这个地方采用tabs控件进行布局-->
				</div>
			</div>
			
		</div>
		<div id="win" class="easyui-window" title="My Window" style="width:280px;height:200px"   
        data-options="iconCls:'icon-save',modal:true,closed:true">   
                <form >
  <table  Style="width: 280px;height: 300px;">			
<thead>
<tr>
<td><label>旧密码：</label></td>
<td><input type="password" required="required" id="upassword1" ></td>
</tr>
<tr>
<td><label>新密码:</label></td>
<td><input type="password" required="required" id="upassword" ></td>
</tr>
<tr>
<td><label>确认密码：</label></td>
<td><input type="password" required="required" id="upassword2" ></td>
</tr>
<tr>
<td><label></label></td>
<td><a href="javascript:void(0)" class="easyui-linkbutton"  onclick="baocun()">保存</a></td>
</tr>
</thead>
</form>
</div>   
</div>  
	</body>
</html>