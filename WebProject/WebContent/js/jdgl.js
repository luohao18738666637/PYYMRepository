var jiaoseid = null;

	function shezhi(index) {
		var data = $("#dg").datagrid("getData");
		var row = data.rows[index];
		$('#tt').tree({
			url: easyuiData.server + '/api/GetModulesByRoleId',
			queryParams: {
				roleId: row.Id,
				token: easyuiData.mytoken
			},
			checkbox: true
		});
		jiaoseid = null;
		jiaoseid = row.Id;
		$('#quanxiantree').window('open');
	}

	function baocun() {
		var trees = $("#tt").tree("getChecked", ["checked", "indeterminate"]);
		var ids = "";
		for(var i = 0; i < trees.length; i++) {
			if(ids == "") {
				ids = ids + trees[i].id;
			} else {
				ids = ids + "," + trees[i].id;
			}
		}
		$.post(easyuiData.server + "/api/SetSysRights", {
			parentIds: ids,
			rId: jiaoseid,
			token: easyuiData.mytoken
		}, function(res) {
			if(res.success) {
				$('#quanxiantree').window('close');
				$("#dg").datagrid("reload");
				$.messager.show({
					title: '我的消息',
					msg: '分配成功',
					timeout: 1000,
					showType: 'slide',
					style: {
						top: document.body.scrollTop + document.documentElement.scrollTop,
					}
				});
			} else {
				$('#quanxiantree').window('close');
				$("#dg").datagrid("reload");
				$.messager.show({
					title: '我的消息',
					msg: '分配失败',
					timeout: 1000,
					showType: 'slide',
					style: {
						top: document.body.scrollTop + document.documentElement.scrollTop,
					}
				});
			}
		}, "json");

	}

	function quxiao() {
		$('#win').window('close');
		$('#addjs').window('close');
	}

	function chushihua() {
		$("#dg").datagrid({
			url: easyuiData.server + '/api/GetRoles', //数据接口的地址
			queryParams: { //要发送的参数列表
				token: easyuiData.mytoken,
			}
		});
	}
	$(function() {
		$('#win').window('close');
		$('#addjs').window('close');
		$('#quanxiantree').window('close');
		chushihua();
	});

	function hhd(value, row, index) {
		return "<a href='javascript:void(0)' class='easyui-linkbuton' onclick='chakan(" + index + ")'>编辑</a>&nbsp;&nbsp;<a href='javascript:void(0)' class='easyui-linkbuton' onclick='shanchu(" + index + ")'>删除</a>";
	}

	function b1(value, row, index) {
		return "<a href='javascript:void(0)' class='easyui-linkbuton' onclick='shezhi(" + index + ")'>设置</a>";
	}

	function chakan(index) {
		var data = $("#dg").datagrid("getData");
		var row = data.rows[index];
		$('#ff').form('clear');
		$('#ff').form('load', row);
		$('#win').window('open');
	}

	function bianji() {
		var Id = $("#Id").val();
		var Name = $("#Name").val();
		$.post(easyuiData.server + "/api/UpdateRole", {
			name: Name,
			roleId: Id,
			token: easyuiData.mytoken
		}, function(res) {
			if(res.success) {
				$('#win').window('close');
				$("#dg").datagrid("reload");
				$.messager.show({
					title: '我的消息',
					msg: '更新成功',
					timeout: 1000,
					showType: 'slide',
					style: {
						top: document.body.scrollTop + document.documentElement.scrollTop,
					}
				});
			} else {
				$('#win').window('close');
				$("#dg").datagrid("reload");
				$.messager.show({
					title: '我的消息',
					msg: '更新失败',
					timeout: 1000,
					showType: 'slide',
					style: {
						top: document.body.scrollTop + document.documentElement.scrollTop,
					}
				});
			}
		}, "json");

	}

	function shanchu(index) {
		$.messager.confirm('确认', '您确认想要删除角色吗？', function(r) {
			if(r) {

				var data = $("#dg").datagrid("getData");
				var row = data.rows[index];
				$.post(easyuiData.server + "/api/DeleteRole", {
					roleId: row.Id,
					token: easyuiData.mytoken
				}, function(res) {
					if(res.success) {
						$("#dg").datagrid("reload");
						$.messager.show({
							title: '我的消息',
							msg: '删除成功',
							timeout: 1000,
							showType: 'slide',
							style: {
								top: document.body.scrollTop + document.documentElement.scrollTop,
							}
						});
					} else {
						$("#dg").datagrid("reload");
						$.messager.show({
							title: '我的消息',
							msg: '删除失败',
							timeout: 1000,
							showType: 'slide',
							style: {
								top: document.body.scrollTop + document.documentElement.scrollTop,
							}
						});
					}
				}, "json");
			}
		});
	}

	function addInfo() {
		$("#ffjs").form("reset");
		$('#addjs').window('open');
	}

	function tianjia() {
		var Name2 = $("#Name2").val();
		$.post(easyuiData.server + "/api/CreateRole", {
			name: Name2,
			token: easyuiData.mytoken
		}, function(res) {
			if(res.success) {
				$('#addjs').window('close');
				$("#dg").datagrid("reload");
				$.messager.show({
					title: '我的消息',
					msg: '添加成功',
					timeout: 1000,
					showType: 'slide',
					style: {
						top: document.body.scrollTop + document.documentElement.scrollTop,
					}
				});
			} else {
				$('#addjs').window('close');
				$("#dg").datagrid("reload");
				$.messager.show({
					title: '我的消息',
					msg: '添加失败',
					timeout: 1000,
					showType: 'slide',
					style: {
						top: document.body.scrollTop + document.documentElement.scrollTop,
					}
				});
			}
		}, "json");

	}