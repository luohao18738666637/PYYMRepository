<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title></title>
<link rel="stylesheet" href="jquery-easyui-1.4.3/themes/icon.css" />
<link rel="stylesheet"
	href="jquery-easyui-1.4.3/themes/default/easyui.css" />
<script type="text/javascript" src="jquery-easyui-1.4.3/jquery.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/jquery.easyui.min.js"></script>
<script type="text/javascript"
	src="jquery-easyui-1.4.3/locale/easyui-lang-zh_CN.js"></script> 
	<script type="text/javascript" src="js/Modules.js"></script>
</head>
<body>
<div class="easyui-layout" style="width:200px;height:500px;">
			<div title="" style="width:150px;">
				<div id="m">
					<!--这个地方显示树状结构-->
				</div>
			</div>
		</div>
		<div id="mm" class="easyui-menu" style="width:150px;">
        <div data-options="iconCls:'icon-add'" onclick="append()">添 加</div>
        <div data-options="iconCls:'icon-edit'" onclick="xiugai()">修 改</div>
        <div data-options="iconCls:'icon-remove'" onclick="removetree()">删 除</div>
    </div>
<div id="info" class="easyui-dialog" style="width:400px;height: 220px;" closed=true>
        <form id="myform">
            <input type="hidden" name="id" name="id" value="">
            <table style="margin: auto;" cellspacing="10">
                <tr>
                    <td>节点名称：</td>
                    <td><input class="easyui-textbox" id="text" name="text" value="" data-options="required:true"></td>
                </tr>
                <tr>
                    <td>路径：</td>
                    <td><input class="easyui-textbox" id="path" name="path" value=""></td>
                </tr>
                 <tr>
                    <td>权重：</td>
                    <td><input class="easyui-textbox" id="weight" name="weight" value=""></td>
                </tr>
                 <tr style="display: none">
                                <td><input type="hidden" class="easyui-textbox" id="parentId" name="parentId" value=""></td>
                </tr>
            </table>
            <div style="text-align: center; bottom: 15px; margin-top: 20px;">
                <a id="savebtn" class="easyui-linkbutton"
                    data-options="iconCls:'icon-save'" style="width: 20%;">保存</a> <a
                    id="cancelbtn" class="easyui-linkbutton"
                    data-options="iconCls:'icon-cancel'" style="width: 20%;">取消</a>
            </div>
        </form>
    </div>
</body>
</html>