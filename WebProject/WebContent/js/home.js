//树形结构显示
	$(function() {				
			$("#menuTree").tree({
				url:"tree",
				onClick: function(node){					
					 if (node.id) {
	                        look(node.text, node.path);
	                    }
				}
	            });				
			 function look(text, path) {
	                var content = '<iframe scrolling="auto" frameborder="0"  src="'+path+'" style="width:100%;height:800px;"></iframe>';
	                if ($("#tabs").tabs('exists', text)) {
	                    $('#tabs').tabs('select', text);
	                } else {
	                    $('#tabs').tabs('add', {
	                        title : text,
	                        closable : true,
	                        content : content,	                       
	                    });
	                }
	            }
	});
	