
/*function cz(value,row,index){

	return "<a style='cursor: pointer;' onclick='lookdata(" + index + ")'>删除</a>   "
}
function xb(value,row,index){
	return value==0?"男":"女";
}
function huifang(value,row,index){
	return value==0?"否":"是";
}
function sfyouxiao(value,row,index){
	return value==0?"否":"是";
}
function sftuifei(value,row,index){
	return value==0?"否":"是";
}
function sfjiaofei(value,row,index){
	return value==0?"否":"是";
}
function sfjinban(value,row,index){
	return value==0?"否":"是";
}
function shanchu(index){	
	var data = $("#dg").datagrid("getData");
	var row=data.rows[index];
	alert(row.sid);	
	$.messager.confirm("友情提示", "确定删除？", function(f) {
	if(f){
		$.post("delete",{
			sid:row.sid				
		},function(res){
			if(res>0){
			$("#dg").datagrid("load");
			$.messager.alert("提示","删除成功");				
			}else{
				$.messager.alert("提示","删除成功")	
			}
			
		})
	}
})		
}


function showDatastu(index) {	
	var sid=$("#dg").datagrid("getData").rows[index].sid;	

	//当前所有的日志
	 $("#stuData").datagrid({
    	url:'selectdatabySid',  //数据接口的地址
    	queryParams:{ //要发送的参数列表
        	sid:sid       
         }
   }); 
	 $("#showstudata_window").window("open");
		$('#showstudata_window').window('center');
}*/
/*//操作项
function formatterDatastulook(value,row,index) {
 	return "<a style='cursor: pointer;' onclick='lookdata(" + index + ")'>详情</a>";
 } */
//查看跟踪内容详情
/*function lookdata(index) {	

	//将当前行数据填入表单
	var neirong = $("#stuData").datagrid("getData").rows[index].gZneirong; 	
	$("#lookstudata").val(neirong);

	$("#lookstuData_window").window("open");
	$('#lookstuData_window').window('center');
}*/


//点击新增按钮
function formatteraddData(value, row, index) {
		return "<a style='cursor: pointer;' onclick='addDataInfo("+index+")'>新增</a>"
	}
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

/*function xiugai(){
	alert($("#sssex").combobox("getValue"));
	$.post("updateStudents",{
		sex:$("#sssex").combobox("getValue"),
		kecFangXiang:$("#kecFangXiang").val(),
		age:$("#ssage").val(),
		dafen:$("#dafen").val(),
		sphone:$("#sssphone").val(),
		sfyouxiao:$("#sfyouxiao").combobox("getValue"),
		xueli:$("#ssxueli").val(),
		wuxiaoyuanying:$("#wuxiaoyuanying").val(),
		status:$("#status").val(),
		sFhuifang:$("#sFhuifang").combobox("getValue"),
		messageChannel:$("#ssmessageChannel").val(),
		firsthuifangTime:$("#firsthuifangTime").val(),
		messageAddress:$("#ssmessageAddress").val(),
		sFshangmeng:$("#sFshangmeng").combobox("getValue"),
		messageWord:$("#ssmessageWord").val(),
		shangmengTime:$("#shangmengTime").val(),
		address:$("#address").val(),
		qq:$("#ssqq").val(),
		sFjiaofei:$("#sFjiaofei").combobox("getValue"),
		weChat:$("#ssweChat").val(),
		jiaofeiTime:$("#jiaofeiTime").val(),
		baobei:$("#ssbaobei").combobox("getValue"),
		money:$("#money").val(),
		askid:$("#ssaskname").combobox("getValue"),
		sFtuifei:$("#sFtuifei").val(),
		lururen:$("#lururen").val(),
		tuifeiyuanyin:$("#tuifeiyuanyin").val(),
		sFjinban:$("#sFjinban").combobox("getValue"),
		jinbanTime:$("#jinbanTime").val(),
		jinbanbeizhu:$("#jinbanbeizhu").val(),
		zXSbeizhu:$("#zXSbeizhu").val(),
		dingjinTime:$("#dingjinTime").val()		
	},function(res){
		
	},"json")
}
*/






