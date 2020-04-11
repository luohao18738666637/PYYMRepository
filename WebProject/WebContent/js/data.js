
function selectInfo(){		   
	$('#dg').datagrid({    
	    url:'selectdataAll',  
	    method:"post",
	    queryParams:{
	    	sname:$("#sname").val(),
	    	zname:$("#zname").val(),
	    	startTime:$("#startTime").textbox("getValue"),
	    	endTime:$("#endTime").textbox("getValue"),
	    	hFqingkuang:$("#hFqingkuang").val(),
	    	gZfangshi:$("#gZfangshi").val()
		}  
	}); 
	
	$("#dataform").form("clear");
}
$(function(){	
	selectInfo()	
})

//操作项
function formatterData(value,row,index) {
 	return "<a style='cursor: pointer;' onclick='lookdata(" + index + ")'>查看</a>   <a style='cursor: pointer;' onclick='deletedataInfo()'>删除</a>";
 } 
 //查看跟踪内容详情
function lookdata(index) {	

	//将当前行数据填入表单
	var neirong = $("#dg").datagrid("getData").rows[index].gZneirong; 	
	$("#look").val(neirong);

	$("#lookData_window").window("open");
	$('#lookData_window').window('center');
}
//删除一条日志数据
function deletedataInfo(){
	$.messager.confirm('确认','您确认想要删除这条日志信息吗？',function(r){
		if(r){
			var dataid=$("#dg").datagrid("getSelected").dataid;
			$.post("deletedatabyId",{
				dataid:dataid		
			},function(res) {
				if(res>0) {
					$.messager.alert("提示","删除这条日志信息成功!");			
					$("#dg").datagrid("load");
				}else{
					$.messager.alert("提示","删除这条日志信息失败!");
				}
			},"json");
		}
})
}


