function tiao_zhu() {
		document.getElementById("d_1").style.display = "none"; //隐藏
		document.getElementById("d_2").style.display = "block"; //显示
	}
	function tiao_deng() {
		document.getElementById("d_2").style.display = "none"; //隐藏
		document.getElementById("d_1").style.display = "block"; //显示
	}
	function zhuce() {
		if($("#zhuce_form").form('validate')) {		
			var uname = $("#uname").val();
			var upassword = $("#upassword").val();
			var uemail = $("#uemail").val();
			var uphone = $("#uphone").val();
			var zname= $("#zname").val();
			$.post("insertU", {
				uname: uname,
				upassword: upassword,
				uemail: uemail,
				uphone: uphone,
				zname: zname
			}, function(res) {
				if(res==1) {
					$.messager.show({
						title: '我的消息',
						msg: '注册成功！马上去登陆！',
						timeout: 1000,
						showType: 'slide',
						style: {
							top: document.body.scrollTop + document.documentElement.scrollTop,
						}
					});
					document.getElementById("d_2").style.display = "none"; //隐藏
					document.getElementById("d_1").style.display = "block"; //显示
				}else if(res==2){
					$.messager.show({
						title: '我的消息',
						msg: '注册失败！用户名重复',
						timeout: 1000,
						showType: 'slide',
						style: {
							top: document.body.scrollTop + document.documentElement.scrollTop,
						}
					});
				} else {
					$.messager.show({
						title: '我的消息',
						msg: '注册失败！',
						timeout: 1000,
						showType: 'slide',
						style: {
							top: document.body.scrollTop + document.documentElement.scrollTop,
						}
					});
				}
			}, "json");
		} else {
			alert("对不起！您输入的内容不符合我们的要求，无法为您注册！");
		}
	}
	/*function denglu() {
		alert("dddddddddd");
		var uname = $("#uname").val();
		var upassword = $("#upassword").val();
		var yzm=$("#yzm").val();
		$.post("denglu", {
			uname: uname,
			upassword: upassword,
			yzm:yzm
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
				
			} else {
				$.messager.show({
					title: '我的消息',
					msg: '验证码错误',
					timeout: 1000,
					showType: 'slide',
					style: {
						top: document.body.scrollTop + document.documentElement.scrollTop,
					}
				});
			}
		}, "json");
	}*/
	function getVerifiCode() {
	    $("#yzm_img").prop('src','getVerifiCode?a='+new Date().getTime());	    
	}
