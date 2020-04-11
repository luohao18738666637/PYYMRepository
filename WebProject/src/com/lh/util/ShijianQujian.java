
package com.lh.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class ShijianQujian {
	
	public static boolean is_shijianq(String begin,String end){
		SimpleDateFormat df = new SimpleDateFormat("HH:mm");// 设置日期格式
		// 初始化
		Date nowTime = null;
		Date beginTime = null;
		Date endTime = null;
		try {
			// 格式化当前时间格式
			nowTime = df.parse(df.format(new Date()));
			// 定义开始时间
			beginTime = df.parse(begin);
			// 定义结束时间
			endTime = df.parse(end);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 调用判断方法
		// 输出为结果
		return belongCalendar(nowTime, beginTime, endTime);
	}
	
	private static boolean belongCalendar(Date nowTime, Date beginTime, Date endTime) {
		// 设置当前时间
		Calendar date = Calendar.getInstance();
		date.setTime(nowTime);
		// 设置开始时间
		Calendar begin = Calendar.getInstance();
		begin.setTime(beginTime);
		// 设置结束时间
		Calendar end = Calendar.getInstance();
		end.setTime(endTime);
		// 处于开始时间之后，和结束时间之前的判断
		if (date.after(begin) && date.before(end)) {
			return true;
		} else {
			return false;
		}
	}

}
