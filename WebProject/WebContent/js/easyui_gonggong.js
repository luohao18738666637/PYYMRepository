var zhuti = window.localStorage.getItem("zhuti");
if(!(zhuti!=null && zhuti!="")){
	zhuti="default";
}
var yuyan=window.localStorage.getItem("yuyan");
if(!(yuyan!=null && yuyan!="")){
	yuyan="easyui-lang-zh_CN.js";
}
/*var easyuiData = {
	server: "http://stuapi.ysd3g.com",
	pre: "http://127.0.0.1/EasyUI_xiangmu",
	mytoken: "071a6b0a-3182-4f2d-9afd-928b8dec35de",
	setyonghu: function(uid, uname, roleNames) {
		sessionStorage.setItem("uid", uid);
		sessionStorage.setItem("uname", uname);
		sessionStorage.setItem("roleNames", roleNames);
	},
	getuid: function() {
		return sessionStorage.getItem("uid");
	},
	getuname: function() {
		return sessionStorage.getItem("uname");
	},
	getroleNames: function() {
		var roleNames = sessionStorage.getItem("roleNames");
		var rn = roleNames.split(",");
		for(var i = 0; i < rn.length; i++) {
			rn[i] = "\'" + rn[i] + "\'";
		}
		return eval("[" + arr.join() + "]");
	}
}*/
document.write('<link rel="stylesheet" type="text/css" href="WebProject/jquery-easyui-1.4.3/themes/icon.css" />');
document.write('<link rel="stylesheet" type="text/css" href="WebProject/jquery-easyui-1.4.3/themes/'+zhuti+'/easyui.css" />');
document.write('<script src="WebProject/jquery-easyui-1.4.3/jquery.min.js" type="text/javascript" charset="utf-8"></script>');
document.write('<script src="WebProject/jquery-easyui-1.4.3/jquery.easyui.min.js" type="text/javascript" charset="utf-8"></script>');
document.write('<script src="WebProject/jquery-easyui-1.4.3/locale/'+yuyan+'" type="text/javascript" charset="utf-8"></script>');
document.write('<script src="WebProject/js/yanzheng.js" type="text/javascript" charset="utf-8"></script>');