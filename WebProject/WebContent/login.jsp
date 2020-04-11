<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>登陆与注册</title>
		
 <link rel="stylesheet" href="jquery-easyui-1.4.3/themes/icon.css" />
<link rel="stylesheet"
	href="jquery-easyui-1.4.3/themes/default/easyui.css" />
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script> 
		<script src="js/login.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript">
	
		function denglu() {
			
			var uname = $("#uname").val();
			var upassword = $("#upassword").val();
			var yzm=$("#yzm").val();
			var y =$("[name='y']:checked").val();
		
			$.post("denglu", {
				uname: uname,
				upassword: upassword,
				yzm:yzm,
				usy2:y
			}, function(res) {
				if(res==1) {
					$.messager.show({
						title: '我的消息',
						msg: '登陆成功',
						timeout: 1000,
						showType: 'slide',
						style: {
							top: document.body.scrollTop + document.documentElement.scrollTop,
						}
					});				 								
					window.location.href = "home";
				}else if(res==2){
						
						$.messager.show({
							title: '我的消息',
							msg: '账号或密码错误',
							timeout: 1000,
							showType: 'slide',
							style: {
								top: document.body.scrollTop + document.documentElement.scrollTop,
							}
						});
						
					
					
					
					
				} else if(res==0){
					$.messager.show({
						title: '我的消息',
						msg: '验证码错误',
						timeout: 1000,
						showType: 'slide',
						style: {
							top: document.body.scrollTop + document.documentElement.scrollTop,
						}
					});
				}else if(res=456){
					$.messager.show({
						title: '我的消息',
						msg: '用户已锁定请联系管理员',
						timeout: 1000,
						showType: 'slide',
						style: {
							top: document.body.scrollTop + document.documentElement.scrollTop,
						}
					});
				}else{
					$.messager.show({
						title: '我的消息',
						msg: '用户不存在',
						timeout: 1000,
						showType: 'slide',
						style: {
							top: document.body.scrollTop + document.documentElement.scrollTop,
						}
					});
				}
			}, "json");
		}
		function chongzhi(){
			$('#denglu_form').form('reset');
			$.post("chongzhi",
					{
				
					},function(res) {
				if(res>0){
					$.messager.show({
						title: '我的消息',
						msg: '免密登录重置成功',
						timeout: 1000,
						showType: 'slide',
						style: {
							top: document.body.scrollTop + document.documentElement.scrollTop,
						}
					});
				}else{
					$.messager.show({
						title: '我的消息',
						msg: '免密登录重置失败',
						timeout: 1000,
						showType: 'slide',
						style: {
							top: document.body.scrollTop + document.documentElement.scrollTop,
						}
					});
				}
			}, "json");
		}
	
		</script>
		<style type="text/css">
			div{
				border: none;
			}
			.div_1 {
				width: 333px;
				height: 333px;
				text-align: right;
				padding: 200px 150px 10px 10px;
				margin: auto auto;
			}
			
			body {
				background-image: url(img/6.jpg);
				background-repeat: no-repeat;
				background-size: cover;
			}
			
			#d_2 {
				display: none;
			}
			
			#zhuce_form input {
				width: 160px;
			}
		
		</style>
	</head>
	<body>
		<div style="padding-right: 800px" class="div_1" id="d_1">
			<h1 style="margin-right: 50px;">登                         陆</h1>
			<form id="denglu_form">
				<div>
					登陆名：<input class="easyui-textbox" required="true" type="text" name="denglu_name" id="uname"></input>
				</div>
				<br />
				<div>
					密码：<input class="easyui-textbox" required="true" type="password" name="denglu_password" id="upassword"></input>
				</div>
				<br />
				<div>
					
               <img id="yzm_img" style="width: 100px;height: 30px;border-radius: 3px;padding-left: 20%" title="点击刷新验证码" src="getVerifiCode"/>
              
				<a href="javascript:getVerifiCode()">看不清?</a>            	
				<div>验证码：<input class="easyui-textbox" required="true" type="text" name="denglu_password" id="yzm"></input></div>
				<div><input type="checkbox" checked="checked" value="yes" id="y" name="y">自动登录</input></div>
				<div style="margin-right: 50px;">
					<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="denglu()">登陆</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#denglu_form').form('reset')">重置</a>&nbsp;&nbsp;					    
				</div>
				 </div>
			</form>
			<br />
			<span style="margin-right: 20px;"><a href="javascript:void(0)" type="button" onclick="tiao_zhu()">忘记密码？</a></span>
		</div>

		<div style="padding-right: 800px;padding-bottom: 100px" class="div_1" id="d_2">
			<h1 style="margin-right: 50px;">注册</h1>
			<form id="zhuce_form">
				<div>
					登陆名：<input class="easyui-textbox" required="true" type="text" name="zhuce_name" id="uname"></input>
				</div>
				<br />
				<div>
					密码：<input class="easyui-textbox" required="true" type="password" name="zhuce_password" id="upassword"></input>
				</div>
				<br />
				<div>
					确认密码：<input class="easyui-textbox" required="true" type="password" validType="equals['zhuce_password']" name="upassword2" id="upassword2"></input>
				</div>
				<br />
				<div>
					邮箱：<input class="easyui-textbox" required="true" type="text" validType="msn" name="zhuce_email" id="uemail"></input>
				</div>
				<br />
				<div>
					手机号：<input class="easyui-textbox" required="true" type="text" validType='mobile' name="zhuce_mtel" id="uphone"></input>
				</div>
				<br />
				<div>
					真实姓名：<input class="easyui-textbox" required="true" type="text" validType='mobile' name="zname" id="zname"></input>
				</div>
				<div style="margin-right: 50px;">
					<a href="javascript:void(0)" class="easyui-linkbutton" type="button" onclick="zhuce()">注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="$('#zhuce_form').form('reset')">清空</a>
				</div>
			</form>
			<br />
			<span style="margin-right: 20px;"><a href="javascript:void(0)" type="button" onclick="tiao_deng()">已经注册！马上登陆</a></span>
		</div>
		<body>
		
</html>