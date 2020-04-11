<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
"http://www.w3.org/TR/html4/loose.dtd">
<!--要显示的列  -->
<div id="showColumn" class="easyui-window" title="选择要隐藏的列"
		data-options="iconCls:'icon-add',minimizable:false,closed:true,"
		style="padding:10px;min-width:500px">
  <fieldset>
		<legend>要隐藏的列</legend>
	   <table id="disColumn">
		<tr>
		    <td colspan="4"><input type="checkbox" name="allChecked" id="allChecked" onchange="allChecked()" />全选</td>
		</tr>
		<tr>
			<td><input type="checkbox" name="check" value="sname" />姓名</td>
			<td><input type="checkbox" name="check" value="createTime" />创建时间</td>
			<td><input type="checkbox" name="check" value="sphone" />电话</td> 
			<td><input type="checkbox" name="check" value="sex" />性别</td>
			<td><input type="checkbox" name="check" value="age" />年龄</td>
		</tr>		
	 </table>
  </fieldset>
</div>