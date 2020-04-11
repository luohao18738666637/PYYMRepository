	var flag;//判断是添加还是修改的标记
$(function() {	
		$('#m').tree({
			url: "tree1"	,	
			onContextMenu: function(e, node) {
				e.preventDefault();
				// 查找节点
				$('#m').tree('select', node.target);
				// 显示快捷菜单
				$('#mm').menu('show', {
					left: e.pageX,
					top: e.pageY
				});
			}

		});	
	    function exit(){
	        $('#mm').menu('hide');
	    }
        //保存按钮
        $('#savebtn').click(function(){
        	alert("添加");
            if(flag=='add'){
                //1做前台更新
                //（1）获取所选中的节点，也就是父节点
                var node=$('#m').tree('getSelected'); 
                //2后台同步更新
                $.ajax({
                    type:'post',
                    url:'insertModules',
                    cache:false,
                    data:{
                    	parentId:node.parentId,
                    	 path:$('#myform').find('input[name=path]').val(),
                        mname:$('#myform').find('input[name=text]').val(),
                        weight:$('#myform').find('input[name=weight]').val()
                    },
                    dataType:'json',
                    success:function(result){
                        if(result==1){
                            //重新加载
                            var parent=$('#m').tree('getParent',node.target);
                            $('#m').tree('reload');

                            $.messager.alert("提示信息","添加成功" );
                        }else if(result==0){
                        	$.messager.alert("提示信息","名称重复" );
                        }else{
                        	$.messager.alert("提示信息","添加失败" );
                        }
                    }
                });
                //3关闭dialog
                $('#info').dialog('close');
                $('#myform').form('clear');
            }else{
                $.ajax({
                    type:'post',
                    url:'updateModules',
                    cache:false,
                    data:{
                        mid:$('#myform').find('input[name=id]').val(),
                        mname:$('#myform').find('input[name=text]').val(),
                        path:$('#myform').find('input[name=path]').val(),
                        weight:$('#myform').find('input[name=weight]').val()
                    },
                    dataType:'json',
                    success:function(result){
                        if(result==1){
                            //刷新节点，刷新选中节点的父亲
                            var node=$('#m').tree('getSelected');
                            var parent=$('#m').tree('getParent',node.target);
                            $('#m').tree('reload');
                            //提示信息
                            $.messager.alert("提示信息","修改成功" );                                                 
                        }else if(result==0){
                        	$.messager.alert("提示信息","名称重复" );
                        }else{
                        	$.messager.alert("提示信息","修改失败" );
                        }
                    }
                });
            }
            //3关闭dialog
            $('#info').dialog('close');
            $('#myform').form('clear');

        });
        //取消按钮
        $('#cancelbtn').click(function(){
            $('#info').dialog('close');
            $('#myform').form('clear');
        });
    });

//添加模块弹出框
function append(){
        flag='add';//添加标记
$('#info').dialog('open').dialog('setTitle','增加');
        $('#myform').form('clear');
    }
//修改模块给form表单赋值
    function xiugai(){
        flag='edit';
        //清空表单数据
        $('#myform').form('clear');
        //清空表单数据库，重新填充选中的节点里的id，name，url属性
        var node=$('#m').tree('getSelected');
        $('#myform').form('load',{
            id:node.id,
            text:node.text,
            weight:node.weight,
            path:node.path
            
        });
        //打开dialog
    $('#info').dialog('open').dialog('setTitle','修改');
    }
    function removetree(){
        //前台删除
        var node=$('#m').tree('getSelected');
        $('#m').tree('reload',node.target);
        //后台删除
        $.messager.confirm("提示信息","确定删除？",function(r){
        	if(r){
        		 $.post('deleteModules',{mid:node.id},function(result){
        	            //给出提示信息
        	            if(result==1){
        	            	$('#m').tree('reload');
        	            	$.messager.alert("提示信息","删除成功" );
        	            
        	            }else if(result==2){
        	            	$.messager.alert("提示信息","不能删除,已有角色!" );
        	            }else{
        	            	$.messager.alert("提示信息","删除失败" );
        	            }
        	        });
        	}
        	
        })
   
    }
    //退出菜单
  /*  function exit(){
        $('#mm').menu('hide');
    }	*/