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
<jsp:include page="column.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
		chaxun();	
		wlzxs();
		showSetColumn()
	})	
	function guanbi(){
		$("#dtshuju").window("close");
	}
	function wlzxs() {
		$('#wlzxs').combobox({
			url : 'wlzxs',
			valueField : 'uid',
			textField : 'uname'
		});
	}
	function zhixunshi() {
		$('#ssaskname').combobox({
			url : 'zxs',
			valueField : 'uid',
			textField : 'uname'
		});
	}
	$(function(){
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
	})
	function dt(){
		$("#dtshuju").window("open");
		 $("#dtsj").datagrid({
		url:"dongtaishuju",
		method:"post"
	
		}) 		
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
				sphone : $("#sphone").val(),
				sfyouxiao : $("#sfyouxiao").combobox("getValue"),
				sFhuifang : $("#sFhuifang").combobox("getValue"),
				startcreateTime : $("#startcreateTime").textbox("getValue"),
				endcreateTime : $("#endcreateTime").textbox("getValue")
			}
		})
		$("#f").form("clear");
		
	}
	//查看该学生的日志
	function formatterDatastu(value, row, index) {
		return "<a style='cursor: pointer;' onclick='showDatastu(" + index
				+ ")'>查看</a>";
	}
	//操作项
	function formatterDatastulook(value, row, index) {
		return "<a style='cursor: pointer;' onclick='lookdata(" + index
				+ ")'>详情</a>";
	}
	function xxgg(value,row,index){
		return "<a style='cursor: pointer;' onclick='xg(" + index
		+ ")'>完善信息</a>"
	}
	function lookdata(index) {

		//将当前行数据填入表单
		var neirong = $("#stuData").datagrid("getData").rows[index].gZneirong;
		$("#lookstudata").val(neirong);

		$("#lookstuData_window").window("open");
		$('#lookstuData_window').window('center');
	}
	function bb(value,row,index){
	 return value == 0 ? "否" : "是";
	}
	function st(value, row, index) {
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
	function formatteraddData(value, row, index) {
		return "<a style='cursor: pointer;' onclick='addDataInfo()'>新增</a>"
	}
	function daochu() {
		var data = $("#dg").datagrid("getSelections");
		if (data != null && data != "") {
			var sid = "";
			for (var i = 0; i < data.length; i++) {
				if (i == 0) {
					sid = sid + data[i].sid;
				} else {
					sid = sid + "," + data[i].sid;
				}
			}
			$.messager.confirm("友情提示！", "确定导出数据？", function(r) {
				if (r) {
					window.location.href = "getExecl?sid=" + sid
				}
			})
		} else {
			$.messager.alert("友情提示！", "请选择学生");
		}

	}
	function xg(index){
		zhixunshi();
		
		var data=$("#dg").datagrid("getData");
		var row=data.rows[index];
		$("#updateSS").form("load",row);
		$("#updateStu").window("open");
	}
	function zxsxiugai(){
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
			dingjinTime:$("#sdingjinTime").textbox("getValue")		
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
				<th data-options="field:'status',width:100,formatter:st">状态</th>
				<th data-options="field:'messageChannel',width:100">留言渠道</th>
				<th data-options="field:'messageAddress',width:100">留言地址</th>
				<th data-options="field:'messageWord',width:100,hidden:true">留言关键词</th>				
				<th data-options="field:'askname',width:100">咨询师</th>
				<th data-options="field:'address',width:100">地址</th>
				<th data-options="field:'weChat',width:100">微信</th>
				<th data-options="field:'qq',width:100">QQ</th>
				<th data-options="field:'messagedept',width:100">留言部门</th>
				<th data-options="field:'bb',width:100,formatter:bb">报备</th>
				<th data-options="field:'kecFangXiang',width:100">课程方向</th>
				<th data-options="field:'sfyouxiao',width:100,formatter:sfyouxiao">是否有效</th>
				<th data-options="field:'dafen',width:100,hidden:true">打分</th>
				<th data-options="field:'sFhuifang',width:100,formatter:huifang">是否回访</th>
				<th data-options="field:'firsthuifangTime',width:100">第一次回访时间</th>
				<th data-options="field:'sFshangmeng',width:100">是否上门</th>
				<th data-options="field:'shangmengTime',width:100">上门时间</th>
				<th data-options="field:'wuxiaoyuanying',width:100">无效时间</th>
				<th data-options="field:'sFjiaofei',width:100,formatter:sfjiaofei">是否缴费</th>
				<th data-options="field:'jiaofeiTime',width:100">缴费时间</th>
				<th data-options="field:'money',width:100">学费</th>
				<th data-options="field:'sFtuifei',width:100,formatter:sftuifei">是否退费</th>
				<th data-options="field:'lururen',width:100,hidden:true">录入人</th>
				<th data-options="field:'zXSbeizhu',width:100">咨询师备注</th>
				<th data-options="field:'sFjinban',width:100,formatter:sfjinban">是否进班</th>
				<th data-options="field:'jinbanTime',width:100">进班时间</th>
				<th data-options="field:'jinbanbeizhu',width:100">进班备注</th>
				<th data-options="field:'tuifeiyuanyin',width:100">退费原因</th>
				<th data-options="field:'dingjin',width:100">定金</th>
				<th data-options="field:'dingjinTime',width:100">定金时间</th>
				<th
					data-options="field:'caozuostudata',width:120,align:'center',formatter:formatterDatastu">日志</th>
				<th
					data-options="field:'addstudata',width:120,align:'center',formatter:formatteraddData">添加日志</th>
					<th
					data-options="field:'xxgg',width:120,align:'center',formatter:xxgg">信息管理</th>
			</tr>
		</thead>
	</table>
	<div id="tab">
		<form id="f">
			<table>

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
							<option value="0">否</option>
					</select></th>
					<th><label>是否缴费:</label></th>
					<th><select id="sFjiaofei" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="1">是</option>
							<option value="0">否</option>
					</select></th>
					<th><label>是否回访:</label></th>
					<th><select id="sFhuifang" class="easyui-combobox"
						style="width: 90px;">
							<option value="">--请选择--</option>
							<option value="1">是</option>
							<option value="0">否</option>
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
					<th><a href="javascript:void(0)" class="easyui-linkbutton"
						onclick="daochu()">Excel导出数据</a></th>
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
	<!--添加的弹窗-->
	<div id="addData_window" class="easyui-window" title="日志信息"
		style="width: 500px; height: 360px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">
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
<!-- 咨询师和网络咨询师修改学生信息 -->
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
					<td><select id="sssex" name="sex" readonly="readonly" class="easyui-combobox"
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
					<td><input class="easyui-textbox" name="age" readonly="readonly" type="text" id="ssage"
						data-options="required:true"></input></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否有效:</td>
					<td><select  id="ssfyouxiao" name="sfyouxiao" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td>电话:</td>
					<td><input class="easyui-textbox" type="text" readonly="readonly" name="sphone" id="sssphone"
						data-options="required:true"></input></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>无效原因:</td>
					<td><input class="easyui-textbox" name="wuxiaoyuanying" id="wuxiaoyuanying"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>
				<tr>
					<td>学历:</td>
					<td><select  id="ssxueli" name="xueli" readonly="readonly" class="easyui-combobox"
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
							<option value="0">否</option>
					</select></td>
						
				</tr>
				<tr>
					<td>状态:</td>
					<td><select id="ssstatus"  name="status" readonly="readonly" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">离校</option>
							<option value="0">在校</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>首访时间:</td>
					<td><input class="easyui-datebox" name="firsthuifangTime" id="firsthuifangTime"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>来源渠道:</td>
					<td><select id="ssmessageChannel" name="messageChannel" readonly="readonly" class="easyui-combobox"
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
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td>来源地址:</td>
					<td><select id="ssmessageAddress" name="messageAddress" readonly="readonly" class="easyui-combobox"
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
					<td><input class="easyui-textbox" name="messageWord" readonly="readonly" id="ssmessageWord"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>定金金额:</td>
					<td><input class="easyui-textbox" name="dingjin" id="dingjin"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>
				<tr>
					<td>所在地区:</td>
					<td><select id="address" name="address" readonly="readonly" class="easyui-combobox"
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
							<option value="0">否</option>
					</select></td>
				</tr>
				<tr>
					<td>QQ:</td>
					<td><input class="easyui-textbox" name="qq" readonly="readonly" id="ssqq"
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
					<td><input class="easyui-textbox" name="weChat" readonly="readonly" id="ssweChat"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>缴费金额:</td>
					<td><input class="easyui-textbox" name="money" id="money"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>	
				<tr>
					<td>是否报备：:</td>
					<td><select  id="ssbaobei"  readonly="readonly" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否退费:</td>
					<td><select id="sFtuifei"  name="sFtuifei" class="easyui-combobox"
						style="width: 90px;">
							<option value="1">是</option>
							<option value="0">否</option>
					</select></td>
				</tr>	
				<tr>
					<td>咨询师:</td>
					<td><select id="ssaskname" readonly="readonly"  class="easyui-combobox"
						style="width: 90px;">
							
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>退费原因:</td>
					<td><input class="easyui-textbox" name="tuifeiyuanyin" id="tuifeiyuanyin"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>	
				<tr>
					<td>录入人:</td>
					<td><select id="wlzxs" id="wlzxs" readonly="readonly" class="easyui-combobox"
						style="width: 90px;">
							
					</select></td>
						<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>是否进班:</td>
					<td><select id="sFjinban" id="sFjinban" name="sFjinban" class="easyui-combobox"
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
					<td><input class="easyui-datebox" id="jinbanTime" name="jinbanTime" id="baobei"
						data-options="required:true,showSeconds:false"
						style="width: 150px"></td>
				</tr>				
				<tr>
					<td></td>
					<td></td>
					<td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td>进班备注:</td>
					<td><input class="easyui-textbox" id="jinbanbeizhu" name="jinbanbeizhu" id="baobei"
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
	<div id="dtshuju" class="easyui-window"
		title=""
		style="width:600px; height: 200px; padding: 10px;"
		data-options="iconCls:'icon-save',modal:true,closed:true,closable:true">
		
			<table name="center" class="easyui-datagrid" id="dtsj" title=""
				style="padding: 10px;"
				>
				<thead>
					<tr>
						<th data-options="field:'dtid',hidden:true">id</th>
						<th data-options="field:'uname',width:100">发送人</th>
						<th data-options="field:'sendTime',width:100">发送时间</th>
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