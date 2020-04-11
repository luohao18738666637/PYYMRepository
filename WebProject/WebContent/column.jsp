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
		<tr>
			<td><input type="checkbox" name="check" value="xueli" />学历</td>
			<td><input type="checkbox" name="check" value="status" />状态</td>
			<td><input type="checkbox" name="check" value="messageChannel"/>来源渠道</td> 
			<td><input type="checkbox" name="check" value="messageAddress"/>来源网址</td>
			<td><input type="checkbox" name="check" value="messageWord"/>来源关键词</td>
		</tr>
		<tr>
		  <td><input type="checkbox" name="check" value="jinbanbeizhu" />进班备注</td>
			<td><input type="checkbox" name="check" value="address"  />所在区域</td>
			<td><input type="checkbox" name="check" value="weChat" />微信</td>
			<td><input type="checkbox" name="check" value="qq"  />学员QQ</td>
			<td><input type="checkbox" name="check" value="messagedept"  />来源部门</td>
		</tr>
		<tr>
		    <td><input type="checkbox" name="check" value="baobei" />是否报备</td>
		    <td><input type="checkbox" name="check" value="kecFangXiang" />课程方向</td>
		    <td><input type="checkbox" name="check" value="sfyouxiao"  />是否有效</td>
		    <td><input type="checkbox" name="check" value="dafen" />打分</td> 
		    <td><input type="checkbox" name="check" value="sFhuifang" />是否回访</td>
		    <td><input type="checkbox" name="check" value="zXSbeizhu" />咨询师备注</td>
		</tr>
		<tr>
		    <td><input type="checkbox" name="check" value="firsthuifangTime"  />首次回访时间</td>
		    <td><input type="checkbox" name="check" value="sFshangmeng"  />是否上门</td>
		    <td><input type="checkbox" name="check" value="shangmengTime"  />上门时间</td>
		    <td><input type="checkbox" name="check" value="wuxiaoyuanying" />无效原因</td>
		    <td><input type="checkbox" name="check" value="sFjiaofei" />是否缴费</td>
		</tr>
		<tr>
	        <td><input type="checkbox" name="check" value="jiaofeiTime"  />缴费时间</td>
	        <td><input type="checkbox" name="check" value="money"  />学费</td>
	        <td><input type="checkbox" name="check" value="sFtuifei" />是否退费</td>
	        <td><input type="checkbox" name="check" value="sFjinban" />是否进班</td>
	        <td><input type="checkbox" name="check" value="jinbanTime" />进班时间</td>
		</tr>
	    <tr>
	        
	        <td><input type="checkbox" name="check" value="askname" />咨询师</td>
	        <td><input type="checkbox" name="check" value="tuifeiyuanyin" />退费原因</td>
	        <td><input type="checkbox" name="check" value="dingjin"/>订金金额</td>
	        <td><input type="checkbox" name="check" value="dingjinTime"/>订金时间</td>
	    </tr>
	 </table>
  </fieldset>
</div>