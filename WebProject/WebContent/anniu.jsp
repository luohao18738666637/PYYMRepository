<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>jquery制作每天或每日打卡签到特效</title>
<meta name="description" content="jquery制作论坛或社交网站的每日或每天打卡签到特效，点击打卡标签显示打卡签到效果。jquery下载" />
</head>

<body>

<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;text-decoration:none;}
/*今日签到*/
.singer{border:1px solid #DCDBDB;padding:10px;height:45px;line-height:45px;width:290px;margin:20px auto;}
.singer_l_cont, .singer_r_img{float:left;}
.singer_l_cont{width:145px;background:url(images/sing_per.gif) no-repeat left 12px;text-indent:23px;font-size:12px;}
.singer_r_img{display:block;width:114px;height:52px;background:url(images/sing_week.gif) right 2px no-repeat;vertical-align:middle;float:right;*margin-bottom:-10px;}
.singer_r_img:hover{background-position:right -53px;text-decoration:none;}
.singer_r_img span{margin-left:14px;font-size:16px;font-family:'Hiragino Sans GB','Microsoft YaHei',sans-serif !important;font-weight:700;color:#165379;}
.singer_r_img.current{background:url(images/sing_sing.gif) no-repeat 0 2px;}
</style>

	<div class="singer">
		<div class="singer_l_cont">
		
		</div>
		<div class="singer_r_r">
			<a class="singer_r_img" href="javascript:void()">		
				<span id="sing_for_number"></span>
			</a>
		</div>
	</div><!--singer end-->

<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">
/*签到模块日期捕捉：*/
function week(){
	var objDate= new Date();
	var week = objDate.getDay();
	switch(week)
		{
			case 0:
			week="周日";
			break;
			case 1:
			week="周一";
			break;
			case 2:
			week="周二";
			break;
			case 3:
			week="周三";
			break;
			case 4:
			week="周四";
			break;
			case 5:
			week="周五";
			break;
			case 6:
			week="周六";
			break;
		}
	$("#sing_for_number").html( week );
}

$(document).ready(function(){
	week();
	$(".singer_r_img").click(function(){
		$(this).addClass("current");
	})
})
</script>
</body>
</html>
