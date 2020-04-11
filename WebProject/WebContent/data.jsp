<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
 <link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/icon.css" />
		<link rel="stylesheet" type="text/css" href="jquery-easyui-1.4.3/themes/default/easyui.css" />
		<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="js/data.js"></script>
</head>

<body>
	<table  class="easyui-datagrid" id="dg" title="CRM日志基本信息列表" style="width:300;height:400" 
data-options="rownumbers:true,singleSelect:true,pagination:true,toolbar:'#Usersdaohang',pageSize:10">
    <thead>
        <tr>
             <th data-options="field:'dataid',hidden:true">日志ID</th>
             <th data-options="field:'sname',width:100">学生姓名</th>                
            <th data-options="field:'zname',width:100">跟踪者</th> 
            <th data-options="field:'startTime',width:100">开始跟踪时间</th>
            <th data-options="field:'endTime',width:140">结束跟踪时间</th>
            <th data-options="field:'hFTime',width:100">回访时间</th>
            <th data-options="field:'hFqingkuang',width:180">回访情况</th>         
            <th data-options="field:'gZneirong',width:180">跟踪内容</th>   
            <th data-options="field:'gZfangshi',width:180">跟踪方式</th>   
            <th data-options="field:'xCgenzhongTime',width:180">下次跟踪时间</th>      
             <th data-options="field:'caozuo',width:120,align:'center',formatter:formatterData">操作项</th> 
              
                        
       </tr>
    </thead>
</table>

	<div id="Usersdaohang" style="padding: 5px; height: auto">
		<div style="margin-bottom: 5px">
		<form id="dataform">
			&nbsp;&nbsp;&nbsp;&nbsp;
			学生名称: <input class="easyui-textbox" id="sname" style="width: 80px">
			跟踪者名称: <input class="easyui-textbox" id="zname" style="width: 80px">
			跟踪起止时间:<input class="easyui-datetimebox"  id="startTime" data-options="required:false,showSeconds:false"  style="width:150px"> 
		            ~<input class="easyui-datetimebox"  id="endTime" data-options="required:false,showSeconds:false"  style="width:150px"> 		
			回访情况：<input class="easyui-textbox" id="hFqingkuang" style="width: 80px">
			跟踪方式：<input class="easyui-textbox" id="gZfangshi" style="width: 80px">
			<a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-search" onclick="selectInfo()">查找</a>
			</form>
		</div>
	</div>

	
	<!--查看的弹窗-->
<div id="lookData_window" class="easyui-window" title="跟踪内容详情"
		style="width: 500px; height: 300px; padding: 10px;"
		data-options="modal:true,closed:true,iconCls:'icon-save'">				
					<h3 style="text-align: center;">跟踪内容</h3>
		
				<textarea id="look" name="" class="easyui-validatebox" data-options="readonly:true" style="width: 450px; height: 190px;text-align: center;"></textarea>
			
	</div>


</body>
</html>