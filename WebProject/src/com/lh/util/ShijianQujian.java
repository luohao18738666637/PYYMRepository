
package com.lh.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.stereotype.Component;
@Component
public class ShijianQujian {
	
	public static boolean is_shijianq(String begin,String end){
		SimpleDateFormat df = new SimpleDateFormat("HH:mm");// �������ڸ�ʽ
		// ��ʼ��
		Date nowTime = null;
		Date beginTime = null;
		Date endTime = null;
		try {
			// ��ʽ����ǰʱ���ʽ
			nowTime = df.parse(df.format(new Date()));
			// ���忪ʼʱ��
			beginTime = df.parse(begin);
			// �������ʱ��
			endTime = df.parse(end);
		} catch (Exception e) {
			e.printStackTrace();
		}
		// �����жϷ���
		// ���Ϊ���
		return belongCalendar(nowTime, beginTime, endTime);
	}
	
	private static boolean belongCalendar(Date nowTime, Date beginTime, Date endTime) {
		// ���õ�ǰʱ��
		Calendar date = Calendar.getInstance();
		date.setTime(nowTime);
		// ���ÿ�ʼʱ��
		Calendar begin = Calendar.getInstance();
		begin.setTime(beginTime);
		// ���ý���ʱ��
		Calendar end = Calendar.getInstance();
		end.setTime(endTime);
		// ���ڿ�ʼʱ��֮�󣬺ͽ���ʱ��֮ǰ���ж�
		if (date.after(begin) && date.before(end)) {
			return true;
		} else {
			return false;
		}
	}

}
