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
<script type="text/javascript" src="js/yanzheng.js"></script>
<jsp:include page="column.jsp"></jsp:include>
<script type="text/javascript">

	$(function() {	
		
		chaxun();
		showSetColumn();
		tanchuang()
		
	})
	
	function zhixunshi() {
		$('#ssaskname').combobox({
			url : 'zxs',
			valueField : 'uid',
			textField : 'uname'
		});
	}
	function zt(value,row,index){
		return value==0?"未读":"已读";
	}
function dtshujuchaozuo(value,row,index){
		return "<a href='javascript:void(0)' onclick='updateddtt("+index+")'>标读</a>"
	} 
	 function updateddtt(index){
		var data=$("#dtsj").datagrid("getData");
		var row=data.rows[index];
		$.post("updatedongtaixx",{
			dtid:row.dtid			
		},function(res){			
		})
		$("#dtsj").datagrid("reload");
	} 
	
	function tanchuang(){
	
		$.post("dongtaiTanchuang",{
			
		},function(res){
			if(res>0){
				$.messager.confirm("消息提示！","你有"+res+"条动态学生信息！",function(r){
					if(r){
						dt();
					}
				})
			}
		})
	}
	function guanbi(){
		$("#dtshuju").window("close");
	}
	function dt(){
		$("#dtshuju").window("open");
		 $("#dtsj").datagrid({
		url:"dongtaishuju",
		method:"post"
	
		}) 		
	} 
	$(function() {
		zxs();
		wlzxs();
	})
	function wlzxs() {
		$('#swlzxs').combobox({
			url : 'wlzxs',
			valueField : 'uid',
			textField : 'uname'
		});
	}
	function zxs() {
		$('#askname').combobox({
			url : 'zxs',
			valueField : 'uid',
			textField : 'uname'
		});
	}
	function zhixunshi(){
		$('#ssaskname').combobox({
			url : 'zxs',
			valueField : 'uid',
			textField : 'uname'
		});
	}
	function chaxun() {

		$("#dg").datagrid({
			url : "select",
			method : "post",
			pagination : true,
			rownumbers : true,	
			pageSize : 10,
			toolbar : "#tab",
			queryParams : {
				sname : $("#sname").val(),
				qq : $("#qq").val(),
				sFjiaofei : $("#sFjiaofei").combobox("getValue"),
				askid : $("#askname").combobox("getValue"),
				sphone : $("#sphone").val(),
				sfyouxiao : $("#sfyouxiao").combobox("getValue"),
				sFhuifang : $("#sFhuifang").combobox("getValue"),
				startcreateTime : $("#startcreateTime").textbox("getValue"),
				endcreateTime : $("#endcreateTime").textbox("getValue")
			}
		})
		$("#f").form("clear");
	}
	//所有操作
	
	function formatterDatastu(value, row, index) {
		var rid="${rid}";
		if(rid==1){
			$("#tj").hide();
			return "<a style='cursor: pointer;' onclick='showDatastu(" + index
			+ ")'>查看日志</a>    <a style='cursor: pointer;' onclick='xxg(" + index
			+ ")'>完善信息</a>     <a style='cursor: pointer;' onclick='addDataInfo("+index+")'>新增日志</a>";
		}else if(rid==2){
			$("#tj").hide();
			return "<a style='cursor: pointer;' onclick='showDatastu(" + index
			+ ")'>查看日志</a>  <a style='cursor: pointer;' onclick='addDataInfo("+index+")'>新增日志</a> ";
		}else{
			return "<a style='cursor: pointer;' onclick='showDatastu(" + index
			+ ")'>查看日志</a>   <a href='javascript:void(0)'onclick='dongtai(" + index
			+ ")'>添加动态信息</a>   <a href='javascript:void(0)' onclick='xg(" + index
			+ ")'>修改</a>   <a style='cursor: pointer;' onclick='shanchu(" + index
			+ ")'>删除</a>    ";
		}
		
	}
//操作项
	function formatterDatastulook(value, row, index) {
		return "<a style='cursor: pointer;' onclick='lookdata(" + index
				+ ")'>详情</a>";
	}
	//动态添加
		/* function dongtai(value,row,index){
		return "<a href='javascript:void(0)'onclick='dt(" + index
		+ ")'>添加动态信息</a>"
	} */
	/* function formatteraddData(value, row, index) {
		return "<a style='cursor: pointer;' onclick='addDataInfo("+index+")'>新增日志</a>"
	} */
function addDataInfo(index) {
	$("#addDataForm").form("clear");
	var stuid=$("#dg").datagrid("getData").rows[index].sid;
	$("#studatajia").val(stuid);
	$("#addData_window").window("open");
	$('#addData_window').window('center');
}
//点击新增保存按钮
function addDataForm(){					
	
	var sid_i=$("#studatajia").val();
	
	var  hFqingkuang_i= $("#hFqingkuang_i").val();	
	var  gZneirong_i= $("#gZneirong_i").val();	
	var gZfangshi_i = $("#gZfangshi_i").val();				
	var	hFTime_i=$("#hFTime_i").textbox("getValue");
	var	xCgenzhongTime_i=$("#xCgenzhongTime_i").textbox("getValue");
	$.post("insertData",{
		sid:sid_i,
		
		hFqingkuang:hFqingkuang_i,
		gZneirong:gZneirong_i,
		gZfangshi:gZfangshi_i,
		hFTime:hFTime_i,
		xCgenzhongTime:xCgenzhongTime_i
		
		},
		function(res) {	
			if(res>0){
				$.messager.alert("提示","添加日志信息成功");
				$("#addData_window").window("close");
				$("#dg").datagrid("load");
			}else{
				$.messager.alert("提示","添加日志信息失败");
			}	
		},"json");	
}

//点击取消，关闭添加弹窗
function addDataFormclose() {	
	$("#addData_window").window("close");
}
	var sname="";
	formatterDatastulook
	var zxsid="";
	function dongtai(index){
		$("#insertDT").window("open");
		var data=$("#dg").datagrid("getData");
		var row=data.rows[index];
		sname=row.sname
		
		zxsid=row.askid   
	}
	function ddtt(){
		$.post("dongtai",{
			sname:sname,
		
			dtext:$("#dtext").val(),
			zxsid:zxsid
			
			
		},function (res){
			if(res>0){
				$.messager.alert("提示","添加成功");
				$("#insertDT").window("close");
			}else{
				$.messager.alert("提示","添加失败");
			}
		})
	}
	function qqxx(){
		$("#insertDT").window("close");
	}
	function lookdata(index) {

		//将当前行数据填入表单
		var neirong = $("#stuData").datagrid("getData").rows[index].gZneirong;
		$("#lookstudata").val(neirong);
		$("#lookstuData_window").window("open");
		$('#lookstuData_window').window('center');
	}
	/* function cz(value, row, index) {
		return "<a href='javascript:void(0)' onclick='xg(" + index
				+ ")'>修改</a>"
	}
	function updatestudents(value, row, index){
		return "<a style='cursor: pointer;' onclick='shanchu(" + index
		+ ")'>删除</a> "
	}
	function xxgg(value,row,index){
		return "<a style='cursor: pointer;' onclick='xxg(" + index
		+ ")'>完善信息</a>"
	} */
	function xxg(index){
		zhixunshi();
		
		var data=$("#dg").datagrid("getData");
		var row=data.rows[index];
		$("#supdateSS").form("load",row);
		$("#supdateStu").window("open");
	}
	function xxiugai(){
		alert($("#sssaskname").textbox("getValue"));
		alert($("#sssstatus").val());
		$.post("updateStudents",{
			netaskid:$("#swlzxs").textbox("getValue"),
			sid:$("#sssid").val(),
			sex:$("#ssssex").textbox("getValue"),
			kecFangXiang:$("#skecFangXiang").textbox("getValue"),
			age:$("#sssage").val(),
			dafen:$("#sdafen").textbox("getValue"),
			sphone:$("#ssssphone").val(),
			sfyouxiao:$("#sssfyouxiao").textbox("getValue"),
			xueli:$("#sssxueli").textbox("getValue"),
			wuxiaoyuanying:$("#swuxiaoyuanying").val(),
			status:$("#sssstatus").val(),
			sFhuifang:$("#sssFhuifang").textbox("getValue"),
			messageChannel:$("#sssmessageChannel").textbox("getValue"),
			firsthuifangTime:$("#sfirsthuifangTime").textbox("getValue"),
			messageAddress:$("#sssmessageAddress").textbox("getValue"),
			sFshangmeng:$("#ssFshangmeng").textbox("getValue"),
			messageWord:$("#sssmessageWord").val(),
			shangmengTime:$("#sshangmengTime").textbox("getValue"),
			address:$("#saddress").textbox("getValue"),
			qq:$("#sssqq").val(),
			sFjiaofei:$("#sssFjiaofei").textbox("getValue"),
			weChat:$("#sssweChat").val(),
			jiaofeiTime:$("#sjiaofeiTime").textbox("getValue"),
			baobei:$("#sssbaobei").textbox("getValue"),
			money:$("#smoney").val(),
			askid:$("#sssaskname").textbox("getValue"),
			sFtuifei:$("#ssFtuifei").val(),
			lururen:$("#slururen").val(),
			tuifeiyuanyin:$("#stuifeiyuanyin").val(),
			sFjinban:$("#ssFjinban").textbox("getValue"),
			jinbanTime:$("#sjinbanTime").textbox("getValue"),
			jinbanbeizhu:$("#sjinbanbeizhu").val(),
			zXSbeizhu:$("#szXSbeizhu").val(),
			dingjinTime:$("#sdingjinTime").textbox("getValue"), 
			dingjin:$("#sdingjin").val()
		},function(res){
			if(res>0){
				$.messager.alert("友情提示！","修改成功");
				$("#supdateStu").window("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("友情提示！","修改失败");
			}
		},"json")
	}
	function bb(value,row,index){
		 return value == 2 ? "已报备" : "未报备";
		}
	function st(value,index,index){
		return value==2?"在校":"离校";
	}
	function xb(value, row, index) {
		return value == 2 ? "男" : "女";
	}
	function huifang(value, row, index) {
		return value == 2 ? "否" : "是";
	}
	function sfyouxiao(value, row, index) {
		return value == 2 ? "否" : "是";
	}
	function sftuifei(value, row, index) {
		return value == 2 ? "否" : "是";
	}
	function sfjiaofei(value, row, index) {
		return value == 2 ? "否" : "是";
	}
	function sfjinban(value, row, index) {
		return value == 2 ? "否" : "是";
	}
	function sfshangmeng(value,row,index){
		return value==1?"是":"否";
	}
	//删除学生信息
	function shanchu(index) {
		var data = $("#dg").datagrid("getData");
		var row = data.rows[index];
		alert(row.sid);
		$.messager.confirm("友情提示", "确定删除？", function(f) {
			if (f) {
				$.post("delete", {
					sid : row.sid
				}, function(res) {
					if (res > 0) {
						$("#dg").datagrid("load");
						$.messager.alert("提示", "删除成功");
					} else {
						$.messager.alert("提示", "删除成功")
					}

				})
			}
		})
	}
	function tj() {
		
		$("#insertStu").window("open");
	}
	//添加学生信息
	function insertStu(){
		if($("#insertStu").form("validate")){
		$.post("insertStudents",
				{
			      sname:$("#ssname").val(),
			     sphone:$("#ssphone").val(),
			     sex:$("#ssex").textbox("getValue"),
			     age:$("#sage").val(),
			     xueli:$("#sxueli").textbox("getValue"),
			     status:$("#sstatus").textbox("getValue"),
			     messageChannel:$("#smessageChannel").textbox("getValue"),
			     messageAddress:$("#smessageAddress").textbox("getValue"),
			     messageWord:$("#smessageWord").val(),
			     weChat:$("#sweChat").val(),
			     qq:$("#sqq").val(),
			     baobei:$("#sbaobei").val()			
		},function(res){
			if(res>0){
				$.messager.alert("友情提示！","添加成功");
				$("#insertStu").window("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("友情提示！","添加失敗");
			}
		})
		}else{
			alert("手机号格式不正确");
		}
	}
	function qx(){
		$("#insertStu").window("close");
	}
	function xx(){
		$("#updateStu").window("close");
	}
	function xg(index){
		zhixunshi();
		
		var data=$("#dg").datagrid("getData");
		var row=data.rows[index];		
		$("#updateSS").form("load",row);
		$("#updateStu").window("open");
	}
	//修改学生信息
	function xiugai(){
		if($("#updateSS").form("validate")){
			
		
		alert($("#ssaskname").textbox("getValue"));
		alert($("#ssstatus").val());
		$.post("updateStudents",{
			netaskid:$("#swlzxs").textbox("getValue"),
			sid:$("#ssid").val(),
			sex:$("#sssex").textbox("getValue"),
			kecFangXiang:$("#kecFangXiang").textbox("getValue"),
			age:$("#ssage").val(),
			dafen:$("#dafen").textbox("getValue"),
			sphone:$("#sssphone").val(),
			sfyouxiao:$("#ssfyouxiao").textbox("getValue"),
			xueli:$("#ssxueli").textbox("getValue"),
			wuxiaoyuanying:$("#wuxiaoyuanying").val(),
			status:$("#ssstatus").val(),
			sFhuifang:$("#ssFhuifang").textbox("getValue"),
			messageChannel:$("#ssmessageChannel").textbox("getValue"),
			firsthuifangTime:$("#firsthuifangTime").textbox("getValue"),
			messageAddress:$("#ssmessageAddress").textbox("getValue"),
			sFshangmeng:$("#sFshangmeng").textbox("getValue"),
			messageWord:$("#ssmessageWord").val(),
			shangmengTime:$("#shangmengTime").textbox("getValue"),
			address:$("#address").textbox("getValue"),
			qq:$("#ssqq").val(),
			sFjiaofei:$("#ssFjiaofei").textbox("getValue"),
			weChat:$("#ssweChat").val(),
			jiaofeiTime:$("#jiaofeiTime").textbox("getValue"),
			baobei:$("#ssbaobei").textbox("getValue"),
			money:$("#money").val(),
			askid:$("#ssaskname").textbox("getValue"),
			sFtuifei:$("#sFtuifei").val(),
			lururen:$("#lururen").val(),
			tuifeiyuanyin:$("#tuifeiyuanyin").val(),
			sFjinban:$("#sFjinban").textbox("getValue"),
			jinbanTime:$("#jinbanTime").textbox("getValue"),
			jinbanbeizhu:$("#jinbanbeizhu").val(),
			zXSbeizhu:$("#zXSbeizhu").val(),
			dingjinTime:$("#dingjinTime").textbox("getValue"),
			dingjin:$("#dingjin").val()
		},function(res){
			if(res>0){
				$.messager.alert("友情提示！","修改成功");
				$("#updateStu").window("close");
				$("#dg").datagrid("reload");
			}else{
				$.messager.alert("友情提示！","修改失败");
			}
		},"json")
		}else{
			alert("手机号码格式不正确");
		}
	}

	function showDatastu(index) {
		var sid = $("#dg").datagrid("getData").rows[index].sid;
		//当前所有的日志
		$("#stuData").datagrid({
			url : 'selectdatabySid', //数据接口的地址
			queryParams : { //要发送的参数列表
				sid : sid
			}
		});
		$("#showstudata_window").window("open");
		$('#showstudata_window').window('center');
	}
	
	function daochu(){
		var data=$("#dg").datagrid("getSelections");
		if(data!=null && data!=""){
			var sid="";
			for(var i=0;i<data.length;i++){
				if(i==0){
					sid=sid+data[i].sid;
				}else{
					sid=sid+","+data[i].sid;
				}
			}
			$.messager.confirm("友情提示！","确定导出数据？",function(r){
				if(r){
					window.location.href="getExecl?sid="+sid
				}
			})
		}else{
		$.messager.alert("友情提示！","请选择学生");	
		}
	
		
	}
	
	//隐藏列
	function setShowColumn() {
		
		$("#showColumn").window('open');
		 
	}
	//设置需要显示的例
	function showSetColumn() {		
		$("#disColumn").find("input[name=check]").change(function(res) {
			if (this.checked == true) {
				$("#dg").datagrid("hideColumn", this.value);
			} else {
				$("#dg").datagrid("showColumn", this.value);
			}
		});
	}
	//全选
	function allChecked() {
		$("#disColumn").find("input").prop("checked",
				$("#allChecked").prop("checked"));
		var len = $("#disColumn").find("input[name=check]").length;
		for (var i = 0; i < len; i++) {
			$("#disColumn").find("input[name=check]").eq(i).change();//绑定change事件
		}
	}
</script>

</head>
<body>
	<table id="dg" class="easyui-datagrid"
		style="width: auto; height: auto" >
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
				<th data-options="field:'status',width:100,formatter:st">状态</th>
				<th data-options="field:'messageChannel',width:100">来源渠道</th>
				<th data-options="field:'messageAddress',width:100">来源地址</th>
				<th data-options="field:'messageWord',width:100">来源关键词</th>
				<th data-options="field:'askname',width:100">咨询师</th>
				<th data-options="field:'address',width:100,hidden:true">地址</th>
				<th data-options="field:'weChat',width:100">微信</th>
				<th data-options="field:'qq',width:100">QQ</th>
				<th data-options="field:'messagedept',width:100,hidden:true">来源部门</th>
				<th data-options="field:'baobei',width:100,formatter:bb">报备</th>
				<th data-options="field:'kecFangXiang',width:100">课程方向</th>
				<th data-options="field:'sfyouxiao',width:100,formatter:sfyouxiao">是否有效</th>
				<th data-options="field:'dafen',width:100">打分</th>
				<th data-options="field:'sFhuifang',width:100,formatter:huifang">是否回访</th>
				<th data-options="field:'firsthuifangTime',width:100">第一次回访时间</th>
				<th data-options="field:'sFshangmeng',width:100,formatter:sfshangmeng">是否上门</th>
				<th data-options="field:'shangmengTime',width:100">上门时间</th>
				<th data-options="field:'wuxiaoyuanying',width:100">无效时间</th>				
				<th data-options="field:'sFjiaofei',width:100,formatter:sfjiaofei">是否缴费</th>
				<th data-options="field:'jiaofeiTime',width:100">缴费时间</th>
				<th data-options="field:'money',width:100,hidden:true">学费</th>
				<th data-options="field:'sFtuifei',width:100,formatter:sftuifei">是否退费</th>
				<th data-options="field:'lururen',width:100">录入人</th>
				<th data-options="field:'zXSbeizhu',width:100">咨询师备注</th>
				<th data-options="field:'sFjinban',width:100,formatter:sfjinban">是否进班</th>
				<th data-options="field:'jinbanTime',width:100">进班时间</th>
				<th data-options="field:'jinbanbeizhu',width:100">进班备注</th>
				<th data-options="field:'tuifeiyuanyin',width:100">退费原因</th>
				<th data-options="field:'dingjin',width:100">学费</th>
				<th data-options="field:'dingjinTime',width:100">定金时间</th>
				<!-- <th data-options="field:'cz',width:100,align:'center',formatter:cz">操作</th> -->
				<th
					data-options="field:'caozuostudata',width:300,align:'center',formatter:formatterDatastu">操作</th>
				<!-- <th
					data-options="field:'addstudata',width:120,align:'center',formatter:formatteraddData">添加日志</th>
					<th
					data-options="field:'dongtai',width:120,align:'center',formatter:dongtai">添加动态信息</th>
					<th
					data-options="field:'updatestudents',width:120,align:'center',formatter:updatestudents">删除</th>
					<th
					data-options="field:'xxgg',width:120,align:'center',formatter:xxgg">信息管理</th> -->
			</tr>
		</thead>
	</table>
	<div id="tab">
		<form id="f">
			<table style="height: 60px">
				<tr>
					<th><label>姓名:</label></th>
					<th><input class="easyui-textbox" type="text" id="sname"
						style="width: 60px;" /></th>
					<th><label>电话:</label></th>
					<th><input class="easyui-textbox" type="text" id="sphone"
						style="width: 60px;" /></th>
					<th><label>是否有效:</label></th>
					<th><select id="sfyouxiao" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="1">是</option>
							<option value="2">否</option>
					</select></th>
					<th><label>缴费:</label></th>
					<th><select id="sFjiaofei" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="1">是</option>
							<option value="2">否</option>
					</select></th>
					<th><label>回访:</label></th>
					<th><select id="sFhuifang" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="1">是</option>
							<option value="2">否</option>
					</select></th>
					<th><label>咨询师:</label></th>
					<th><select id="askname" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
					</select></th>
					<th><label>QQ:</label></th>
					<th><input class="easyui-textbox" type="text" id="qq"
						style="width: 60px;" /></th>
					<th><label>创建时间:</label></th>
					<th><input class="easyui-datebox" type="text"
						id="startcreateTime" style="width: 60px;" />~</th>
					<th><input class="easyui-datebox" type="text"
						id="endcreateTime" style="width: 60px;" /></th>
					<th><a href="javascript:void(0)" class="easyui-linkbutton"
						data-options="iconCls:'icon-search'" onclick="chaxun()">搜索</a></th>
					<th><a id="tj" href="javascript:void(0)" class="easyui-linkbutton"
						onclick="tj()">添加</a></th>
						
				</tr>	
				<tr>
				<th><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="daochu()">导出Excel</a></th>
				<th><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="setShowColumn()">管理列</a></th>
						</tr>		
			</table>
		</form>
	</div>
	<!--学生界面查看日志的弹窗-->
	<div id="showstudata_window" class="easyui-window"
		title="您正在查看该学生的日志信息"
		style="width: 700px; height: 500px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">
		<form id="showRolesForm">
			<table name="center" class="easyui-datagrid" id="stuData" title="日志"
				style="padding: 10px;"
				data-options="rownumbers:true,singleSelect:true,method:'post',pageSize:10">
				<thead>
					<tr>
						<th data-options="field:'sname',width:100">学生姓名</th>
						<th data-options="field:'startTime',width:140">开始跟踪时间</th>
						<th data-options="field:'gZneirong',width:140">跟踪内容</th>
						<th data-options="field:'xCgenzhongTime',width:140">下次跟踪时间</th>
						<th
							data-options="field:'caozuostu',width:100,align:'center',formatter:formatterDatastulook">操作</th>
					</tr>
				</thead>
			</table>

		</form>


		<!--查看的弹窗-->
		<div id="lookstuData_window" class="easyui-window" title="跟踪内容详情"
			style="width: 500px; height: 300px; padding: 10px;"
			data-options="modal:true,closed:true,iconCls:'icon-save'">
			<h3 style="text-align: center;">跟踪内容</h3>
			<textarea id="lookstudata" name="" class="easyui-validatebox"
				data-options="readonly:true"
				style="width: 450px; height: 190px; text-align: center;"></textarea>
		</div>
	</div>
	<!--添加日志的弹窗-->
	<div id="addData_window" class="easyui-window" title="日志信息"
		style="width: 500px; height: 360px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">
		 <input id="studatajia" type="text" style="display: none" > 
		<form id="addDataForm">
			<table cellpadding="5">
				<tr>
					<td>回访情况:</td>
					<td><input class="easyui-textbox" type="text"
						id="hFqingkuang_i" data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>回访时间:</td>
					<td><input class="easyui-datetimebox" id="hFTime_i"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>跟踪内容:</td>
					<td><input class="easyui-textbox" type="text" id="gZneirong_i"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>跟踪方式:</td>
					<td><input class="easyui-textbox" type="text" id="gZfangshi_i"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>下次跟踪时间:</td>
					<td><input class="easyui-datetimebox" id="xCgenzhongTime_i"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
			</table>
		</form>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-ok'" onclick="addDataForm()">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-cancel'" onclick="addDataFormclose()">取消</a>
		</div>
	</div>
	<!-- 添加学生动态信息 -->
	<div id="insertDT" class="easyui-window" title="添加学生"
		style="width: 300px; height: 200px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">
		<form id="insertSS">
			<table cellpadding="5">
				<tr>
					<td>内容：:</td>
					<td><textarea  type="text" id="dtext"
						data-options="required:true"></textarea></td>
				</tr>
				</tr>
			</table>
		</form>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-ok'" onclick="ddtt()">保存</a>
				 <a
				href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-cancel'" onclick="qqxx()">取消</a>
		</div>
	</div>
	<!-- 添加学生信息 -->
	<div id="insertStu" class="easyui-window" title="添加学生"
		style="width: 300px; height: 500px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">
		<form id="insertSS">
			<table cellpadding="5">
				<tr>
					<td>学生姓名：:</td>
					<td><input class="easyui-textbox" type="text" id="ssname"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>电话:</td>
					<td><input class="easyui-textbox" id="ssphone"
						data-options="required:true,showSeconds:false"
						style="width: 150px"  validType="mobile"></td>
				</tr>
				<tr>
					<td>性别:</td>
					<td><select id="ssex" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="1">女</option>
							<option value="2">男</option>
					</select></td>
				</tr>
				<tr>
					<td>年龄:</td>
					<td><input class="easyui-textbox" type="text" id="sage"
						data-options="required:true"></input></td>
				</tr>
				<tr>
					<td>学历:</td>
					<td><select id="sxueli" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="未知">未知</option>
							<option value="大专">大专</option>
							<option value="高中">高中</option>
							<option value="中专">中专</option>
							<option value="初中">初中</option>
							<option value="本科">本科</option>
							<option value="其它">其它</option>
					</select></td>
				</tr>
				<tr>
					<td>状态:</td>
					<td><select id="sstatus" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="1">在校</option>
							<option value="2">離校</option>
					</select></td>
				</tr>
				<tr>
					<td>来源渠道:</td>
					<td><select id="smessageChannel" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="未知">未知</option>
							<option value="百度">百度</option>
							<option value="百度移动端">百度移动端</option>
							<option value="360">360</option>
							<option value="360移动端">360移动端</option>
							<option value="搜狗">搜狗</option>
							<option value="搜狗移动端">搜狗移动端</option>
							<option value="UC移动端">UC移动端</option>
							<option value="直接输入">直接输入</option>
							<option value="自然流量">自然流量</option>
							<option value="直电">直电</option>
							<option value="微信">微信</option>
							<option value="qq">qq</option>
					</select></td>
				</tr>
				<tr>
					<td>来源地址:</td>
					<td><select id="smessageAddress" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="其它">其它</option>
							<option value="职英B站">职英B站</option>
							<option value="高考站">高考站</option>
							<option value="职英A站">职英A站</option>
							
					</select></td>
				</tr>
				<tr>
					<td>来源关键词:</td>
					<td><input class="easyui-textbox" id="smessageWord"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>微信:</td>
					<td><input class="easyui-textbox" id="sweChat"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>qq:</td>
					<td><input class="easyui-textbox" id="sqq"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>报备:</td>
					<td><select id="sbaobei" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="1">是</option>
							<option value="2">否</option>
							
							
					</select></td>
				</tr>
			</table>
		</form>
		<div style="text-align: center; padding: 5px">		
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-ok'" onclick="insertStu()">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-cancel'" onclick="qx()">取消</a>
		</div>
	</div>
	<!-- 修改学生信息 -->
	 <div id="updateStu" class="easyui-window" title="修改"
		style="width:600px; height: 500px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">
		<table>
		
		</table>
		<form id="updateSS">
			<table cellpadding="5">
			<tr style="display: none;">
			<td><input class="easyui-textbox" id="ssid"   type="text" name="sid" 
						data-options="required:true"></input></td>
			</tr>
				<tr>
					<td>学生姓名：</td>
					<td><input class="easyui-textbox" readonly="readonly"  type="text" name="sname" 
						data-options="required:true"></input></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>课程方向:</td>
					<td><select id="kecFangXiang" name="kecFangXiang" class="easyui-combobox"
						style="width: 90px;">							
							<option value="软件开发">软件开发</option>
							<option value="软件设计">软件设计</option>
							<option value="网站营销">网站营销</option>
							
					</select></td>
				</tr>
				<tr>
					<td>性别:</td>
					<td><select id="sssex" name="sex" class="easyui-combobox"
						style="width: 90px;">							
							<option value="1">女</option>
							<option value="0">男</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>打分:</td>
					<td></input><select  id="dafen" name="dafen" class="easyui-combobox"
						style="width: 90px;">
							<option value="近期报名">近期报名</option>
							<option value="一个月以内可报名">一个月以内可报名</option>
							<option value="长期跟踪">长期跟踪</option>
							<option value="无效">无效</option>
							
					</select></td>
				</tr>
				<tr>
					<td>年龄:</td>
					<td><input class="easyui-textbox" name="age" type="text" id="ssage"
						data-options="required:true"></input></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否有效:</td>
					<td><select  id="ssfyouxiao" name="sfyouxiao" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
				</tr>
				<tr>
					<td>电话:</td>
					<td><input class="easyui-textbox" type="text" name="sphone" id="sssphone"
						data-options="required:true" validType="mobile"></input></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>无效原因:</td>
					<td><input class="easyui-textbox" name="wuxiaoyuanying" id="wuxiaoyuanying"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>学历:</td>
					<td><select  id="ssxueli" name="xueli" class="easyui-combobox"  
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="未知">未知</option>
							<option value="大专">大专</option>
							<option value="高中">高中</option>
							<option value="中专">中专</option>
							<option value="初中">初中</option>
							<option value="本科">本科</option>
							<option value="其它">其它</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否回访:</td>
					<td><select id="ssFhuifang" name="sFhuifang" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
						
				</tr>
				<tr>
					<td>状态:</td>
					<td><select id="ssstatus"  name="status" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">离校</option>
							<option value="2">在校</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>首访时间:</td>
					<td><input class="easyui-datebox" name="firsthuifangTime" id="firsthuifangTime"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>来源渠道:</td>
					<td><select id="ssmessageChannel" name="messageChannel" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="未知">未知</option>
							<option value="百度">百度</option>
							<option value="百度移动端">百度移动端</option>
							<option value="360">360</option>
							<option value="360移动端">360移动端</option>
							<option value="搜狗">搜狗</option>
							<option value="搜狗移动端">搜狗移动端</option>
							<option value="UC移动端">UC移动端</option>
							<option value="直接输入">直接输入</option>
							<option value="自然流量">自然流量</option>
							<option value="直电">直电</option>
							<option value="微信">微信</option>
							<option value="qq">qq</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否上门:</td>
					<td><select id="sFshangmeng" id="sFshangmeng" name="sFshangmeng" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
				</tr>
				<tr>
					<td>来源地址:</td>
					<td><select id="ssmessageAddress" name="messageAddress" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="其它">其它</option>
							<option value="职英B站">职英B站</option>
							<option value="高考站">高考站</option>
							<option value="职英A站">职英A站</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>上门时间:</td>
					<td><input class="easyui-datebox" name="shangmengTime" id="shangmengTime"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>来源关键词:</td>
					<td><input class="easyui-textbox" name="messageWord" id="ssmessageWord"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>学费:</td>
					<td><input class="easyui-textbox" name="dingjin" id="dingjin"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>所在地区:</td>
					<td><select id="address" name="address" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="未知">未知</option>
							<option value="其它">其它</option>
							<option value="郑州">郑州</option>
							<option value="开封">开封</option>
							<option value="洛阳">洛阳</option>
							<option value="南阳">南阳</option>
							<option value="漯河">漯河</option>
							<option value="三门峡">三门峡</option>
							<option value="平顶山">平顶山</option>
							<option value="周口">周口</option>
							<option value="驻马店">驻马店</option>
							<option value="新乡">新乡</option>
							<option value="鹤壁">鹤壁</option>
							<option value="焦作">焦作</option>
							<option value="安阳">安阳</option>
							<option value="濮阳">濮阳</option>
							<option value="安阳">安阳</option>
							<option value="商丘">商丘</option>
							<option value="信阳">信阳</option>
							<option value="济源">济源</option>
							
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否缴费:</td>
					<td><select  id="ssFjiaofei" name="sFjiaofei" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
				</tr>
				<tr>
					<td>QQ:</td>
					<td><input class="easyui-textbox" name="qq" id="ssqq"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>缴费时间:</td>
					<td><input class="easyui-datebox" name="jiaofeiTime" id="jiaofeiTime"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>微信:</td>
					<td><input class="easyui-textbox" name="weChat" id="ssweChat"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<!-- <td>缴费金额:</td>
					<td><input class="easyui-textbox" name="money" id="money"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td> -->
				</tr>	
				<tr>
					<td>是否报备：:</td>
					<td><select  id="ssbaobei" name="baobei" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否退费:</td>
					<td><select id="sFtuifei"  name="sFtuifei" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
				</tr>	
				<tr>
					<td>咨询师:</td>
					<td><select id="ssaskname"  class="easyui-combobox"
						style="width: 90px;">
							
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>退费原因:</td>
					<td><input class="easyui-textbox" name="tuifeiyuanyin" id="tuifeiyuanyin"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>	
				<tr style="display: none">
					<td>录入人:</td>
					<td><select id="swlzxs"  class="easyui-combobox"
						style="width: 90px;">
							
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否进班:</td>
					<td><select id="sFjinban" id="sFjinban" name="sFjinban" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
				</tr>			
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>进班时间:</td>
					<td><input class="easyui-datebox" id="jinbanTime" name="jinbanTime" 
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>				
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>进班备注:</td>
					<td><input class="easyui-textbox" id="jinbanbeizhu" name="jinbanbeizhu" 
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>				
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>咨询师备注:</td>
					<td><input class="easyui-textbox"  name="zXSbeizhu" id="zXSbeizhu"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>	
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>定金时间:</td>
					<td><input class="easyui-datebox" name="dingjinTime" id="dingjinTime"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
														
			</table>
			
		</form>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-ok'" onclick="xiugai()">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-cancel'" onclick="xx()">取消</a>
		</div>
	</div>
	<!-- 咨询师和网络咨询师修改学生信息 -->
	 <div id="supdateStu" class="easyui-window" title="修改"
		style="width:600px; height: 500px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">
		<table>
		
		</table>
		<form id="supdateSS">
			<table cellpadding="5">
			<tr style="display: none;">
			<td><input class="easyui-textbox" id="sssid"   type="text" name="sid" 
						data-options="required:true"></input></td>
			</tr>
				<tr>
					<td>学生姓名：</td>
					<td><input class="easyui-textbox" disabled="disabled"   type="text" name="sname" 
						data-options="required:true"></input></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>课程方向:</td>
					<td><select id="skecFangXiang" name="kecFangXiang" class="easyui-combobox"
						style="width: 90px;">							
							<option value="软件开发">软件开发</option>
							<option value="软件设计">软件设计</option>
							<option value="网站营销">网站营销</option>
							
					</select></td>
				</tr>
				<tr style="display: none;">
					<td>性别:</td>
					<td><select id="ssssex" name="sex" disabled="disabled"  class="easyui-combobox"
						style="width: 90px;">							
							<option value="1">女</option>
							<option value="2">男</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>打分:</td>
					<td></input><select  id="sdafen" name="dafen" class="easyui-combobox"
						style="width: 90px;">
							<option value="近期报名">近期报名</option>
							<option value="一个月以内可报名">一个月以内可报名</option>
							<option value="长期跟踪">长期跟踪</option>
							<option value="无效">无效</option>
							
					</select></td>
				</tr>
				<tr>
					<td>年龄:</td>
					<td><input class="easyui-textbox" name="age" disabled="disabled" type="text" id="sssage"
						data-options="required:true"></input></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否有效:</td>
					<td><select  id="sssfyouxiao" name="sfyouxiao" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
				</tr>
				<tr>
					<td>电话:</td>
					<td><input class="easyui-textbox" type="text" disabled="disabled" name="sphone" id="ssssphone"
						data-options="required:true"></input></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>无效原因:</td>
					<td><input class="easyui-textbox" name="wuxiaoyuanying" id="swuxiaoyuanying"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>学历:</td>
					<td><select  id="sssxueli" name="xueli" disabled="disabled" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="未知">未知</option>
							<option value="大专">大专</option>
							<option value="高中">高中</option>
							<option value="中专">中专</option>
							<option value="初中">初中</option>
							<option value="本科">本科</option>
							<option value="其它">其它</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否回访:</td>
					<td><select id="sssFhuifang" name="sFhuifang" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
						
				</tr>
				<tr>
					<td>状态:</td>
					<td><select id="sssstatus"  name="status" disabled="disabled" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">离校</option>
							<option value="2">在校</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>首访时间:</td>
					<td><input class="easyui-datebox" name="firsthuifangTime" id="sfirsthuifangTime"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>来源渠道:</td>
					<td><select id="sssmessageChannel" name="messageChannel" disabled="disabled" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="未知">未知</option>
							<option value="百度">百度</option>
							<option value="百度移动端">百度移动端</option>
							<option value="360">360</option>
							<option value="360移动端">360移动端</option>
							<option value="搜狗">搜狗</option>
							<option value="搜狗移动端">搜狗移动端</option>
							<option value="UC移动端">UC移动端</option>
							<option value="直接输入">直接输入</option>
							<option value="自然流量">自然流量</option>
							<option value="直电">直电</option>
							<option value="微信">微信</option>
							<option value="qq">qq</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否上门:</td>
					<td><select id="ssFshangmeng"  name="sFshangmeng" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
				</tr>
				<tr>
					<td>来源地址:</td>
					<td><select id="sssmessageAddress" name="messageAddress" disabled="disabled" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="其它">其它</option>
							<option value="职英B站">职英B站</option>
							<option value="高考站">高考站</option>
							<option value="职英A站">职英A站</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>上门时间:</td>
					<td><input class="easyui-datebox" name="shangmengTime" id="sshangmengTime"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>来源关键词:</td>
					<td><input class="easyui-textbox" name="messageWord" disabled="disabled" id="sssmessageWord"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>学费:</td>
					<td><input class="easyui-textbox" name="dingjin" id="sdingjin"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr style="display: none">
					<td>所在地区:</td>
					<td><select id="saddress" name="address" disabled="disabled" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="未知">未知</option>
							<option value="其它">其它</option>
							<option value="郑州">郑州</option>
							<option value="开封">开封</option>
							<option value="洛阳">洛阳</option>
							<option value="南阳">南阳</option>
							<option value="漯河">漯河</option>
							<option value="三门峡">三门峡</option>
							<option value="平顶山">平顶山</option>
							<option value="周口">周口</option>
							<option value="驻马店">驻马店</option>
							<option value="新乡">新乡</option>
							<option value="鹤壁">鹤壁</option>
							<option value="焦作">焦作</option>
							<option value="安阳">安阳</option>
							<option value="濮阳">濮阳</option>
							<option value="安阳">安阳</option>
							<option value="商丘">商丘</option>
							<option value="信阳">信阳</option>
							<option value="济源">济源</option>
							
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否缴费:</td>
					<td><select  id="sssFjiaofei" name="sFjiaofei" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
				</tr>
				<tr>
					<td>QQ:</td>
					<td><input class="easyui-textbox" name="qq" disabled="disabled" id="sssqq"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>缴费时间:</td>
					<td><input class="easyui-datebox" name="jiaofeiTime" id="sjiaofeiTime"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>微信:</td>
					<td><input class="easyui-textbox" name="weChat" disabled="disabled" id="sssweChat"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<!-- <td>缴费金额:</td>
					<td><input class="easyui-textbox" name="money" id="smoney"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td> -->
				</tr>	
				<tr>
					<td>是否报备：:</td>
					<td><select  id="sssbaobei"  disabled="disabled" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否退费:</td>
					<td><select id="ssFtuifei"  name="sFtuifei" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="2">否</option>
					</select></td>
				</tr>	
				<tr style="display: none">
					<td>咨询师:</td>
					<td><select id="sssaskname" disabled="disabled"  class="easyui-combobox"
						style="width: 90px;">
							
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>退费原因:</td>
					<td><input class="easyui-textbox" name="tuifeiyuanyin" id="stuifeiyuanyin"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>	
				<tr style="display: none">
					<td>录入人:</td>
					<td><select id="wlzxs"  disabled="disabled" class="easyui-combobox"
						style="width: 90px;">
							
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否进班:</td>
					<td><select id="ssFjinban" id="ssFjinban" name="sFjinban" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>			
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>进班时间:</td>
					<td><input class="easyui-datebox" id="sjinbanTime" name="jinbanTime" 
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>				
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>进班备注:</td>
					<td><input class="easyui-textbox" id="sjinbanbeizhu" name="jinbanbeizhu" 
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>				
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>咨询师备注:</td>
					<td><input class="easyui-textbox"  name="zXSbeizhu" id="szXSbeizhu"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>	
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>定金时间:</td>
					<td><input class="easyui-datebox" name="dingjinTime" id="sdingjinTime"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>录入人:</td>
					<td><input class="easyui-textbox"  name="lururen" id="slururen"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>				
														
			</table>
			
		</form>
		<div style="text-align: center; padding: 5px">
			<a href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-ok'" onclick="xxiugai()">保存</a> <a
				href="javascript:void(0)" class="easyui-linkbutton" type="button"
				data-options="iconCls:'icon-cancel'" onclick="xx()">取消</a>
		</div>
	</div>
	<div id="dtshuju" class="easyui-window"
		title=""
		style="width:700px; height: 200px; padding: 10px;"
		data-options="iconCls:'icon-save',modal:true,closed:true,closable:true">
		
			<table name="center" class="easyui-datagrid" id="dtsj" title=""
				style="padding: 10px;"
				>
				<thead>
					<tr>
						<th data-options="field:'dtid',hidden:true">id</th>
						<th data-options="field:'uname',width:100">发送人</th>
						<th data-options="field:'sendTime',width:100">发送时间</th>
						<th data-options="field:'sname',width:100">学生姓名</th>
						<th data-options="field:'status',width:100,formatter:zt">状态</th>
						<th data-options="field:'dtext',width:200">内容</th>					
						<th data-options="field:'dtshujuchaozuo',width:140,formatter:dtshujuchaozuo">操作</th> 
						
					</tr>
				</thead>
			</table>
     <div><a href="javascript:void(0)" class="easyui-linkbutton" onclick="guanbi()">关闭</a></div>
		
		</div>
</body>
</html>