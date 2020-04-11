package com.lh.service;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.SimpleFormatter;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lh.dao.StudentsMapper;
import com.lh.entity.FenyeStu;
import com.lh.entity.Students;
import com.lh.entity.Users;
@Service
public class StudentsServiceImp implements StudentsService{
@Autowired
private StudentsMapper studentsMapper;
	@Override
	public Map<String, Object> select(FenyeStu fenyeStu) {
		// TODO Auto-generated method stub
		fenyeStu.setPage((fenyeStu.getPage()-1)*fenyeStu.getRows());
		List<Students> list=studentsMapper.selectAll(fenyeStu);
		Integer total=studentsMapper.selectNum(fenyeStu);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("rows", list);
		map.put("total", total);
		return map;
	}
	@Override
	public Integer delete(Integer sid) {
		// TODO Auto-generated method stub
		return studentsMapper.deleteStu(sid);
	}
	@Override
	public Integer insertStu(Students students) {
		// TODO Auto-generated method stub
		Date date = new Date();
		SimpleDateFormat data = new SimpleDateFormat("yyyy--MM--dd HH:mm:ss");
		students.setCreateTime(data.format(date));
		return studentsMapper.insertStu(students);
	}
	@Override
	public Integer updateStu(Students students) {
		// TODO Auto-generated method stub
		return studentsMapper.updateStu(students);
	}
	@Override
	public void daochuexcel(HttpServletRequest request, HttpServletResponse response, String sid) 
		// TODO Auto-generated method stub
		
		throws IOException {
			// TODO Auto-generated method stub
		
			String[] split = sid.split(",");
			List<Integer> list = new ArrayList<Integer>();
			for (int i = 0; i < split.length; i++) {
				list.add(Integer.parseInt(split[i]));
			}
			System.out.println(list);
			List<Students> studentlist = studentsMapper.sssssss(list);
			System.out.println(studentlist.size());
			for (int i = 0; i < studentlist.size(); i++) {
				Users askname = studentsMapper.selectUExecl(studentlist.get(i).getAskid());
				Users netaskname = studentsMapper.selectUExecl(studentlist.get(i).getNetaskid());
				studentlist.get(i).setAskname(askname.getUname());
				studentlist.get(i).setNetaskname(netaskname.getUname());
			}

			// 创建HSSFWorkbook对象(excel的文档对象)
			HSSFWorkbook wkb = new HSSFWorkbook();
			// 建立新的sheet对象（excel的表单）
			HSSFSheet sheet = wkb.createSheet("学生信息");
			// 在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个
			HSSFRow row1 = sheet.createRow(0);
			// 创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个
			HSSFCell cell = row1.createCell(0);
			// 设置单元格内容
			cell.setCellValue("学生信息");
			// 合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));
			// 在sheet里创建第二行

			HSSFRow row2 = sheet.createRow(1);
			// 创建单元格并设置单元格内容
			/*
			 * row2.createCell(0).setCellValue("sj_id");
			 * row2.createCell(1).setCellValue("sj_name");
			 * row2.createCell(2).setCellValue("sj_jage");
			 * row2.createCell(3).setCellValue("sj_zuozhe");
			 */

			String columnStr = "姓名，性别，年龄，电话，创建时间，学历，个人状态，来源渠道，来源网站，"
					+ "来源关键字，所在区域，微信，qq，来源部门，是否报备，课程方向，是否有效，打分，" + "是否回访，首次回访时间，是否上门，上门时间，无效原因，是否缴费，缴费时间，金额，是否退费，"
					+ "是否进班，进班时间，进班备注，退费原因，定金金额，定金时间，咨询师，咨询师备注";
			String[] heads = columnStr.split("，");
			for (int i = 0; i < heads.length; i++) {
				row2.createCell(i).setCellValue("" + heads[i] + "");
			}
			for (int i = 0; i < studentlist.size(); i++) {
				HSSFRow row3 = sheet.createRow(i + 2);
				Students stu = studentlist.get(i);
				row3.createCell(0).setCellValue(stu.getSname() == null ? "" : stu.getSname());
				row3.createCell(1).setCellValue(stu.getSex() == null ? "" : (stu.getSex() == 1 ? "男" : "女"));
				row3.createCell(2).setCellValue(stu.getAge() == null ? "" : "" + stu.getAge());
				row3.createCell(3).setCellValue(stu.getSphone() == null ? "" : stu.getSphone());
				row3.createCell(4).setCellValue(stu.getCreateTime() == null ? "" : stu.getCreateTime());
				row3.createCell(5).setCellValue(stu.getXueli() == null ? "" : stu.getXueli());
				row3.createCell(6).setCellValue(stu.getStatus() == null ? "" : (stu.getStatus()==1?"在校":"离校"));
				row3.createCell(7).setCellValue(stu.getMessageChannel() == null ? "" : stu.getMessageChannel());
				row3.createCell(8).setCellValue(stu.getMessageAddress() == null ? "" : stu.getMessageAddress());
				row3.createCell(9).setCellValue(stu.getMessageWord() == null ? "" : stu.getMessageWord());
				row3.createCell(10).setCellValue(stu.getAddress() == null ? "" : stu.getAddress());
				row3.createCell(11).setCellValue(stu.getWeChat() == null ? "" : stu.getWeChat());
				row3.createCell(12).setCellValue(stu.getQq() == null ? "" : stu.getQq());
				row3.createCell(13).setCellValue(stu.getMessagedept() == null ? "" : stu.getMessagedept());
				row3.createCell(14).setCellValue(stu.getKecFangXiang()==null ? "" : stu.getKecFangXiang());				
				row3.createCell(15).setCellValue(
						stu.getBaobei() == null ? "" : (stu.getBaobei().equals("1") ? "已报备" : "未报备"));	
				row3.createCell(16)
						.setCellValue(stu.getSfyouxiao() == null ? "" : (stu.getSfyouxiao() == 1 ? "有效" : "无效"));
				row3.createCell(17).setCellValue(stu.getDafen() == null ? "" : stu.getDafen());
				row3.createCell(18)
						.setCellValue(stu.getsFhuifang() == null ? "" : (stu.getsFhuifang() == 1 ? "已回访" : "未回访"));
				row3.createCell(19)
						.setCellValue(stu.getFirsthuifangTime() == null ? "" : stu.getFirsthuifangTime());
				row3.createCell(20)
						.setCellValue(stu.getsFshangmeng() == null ? "" : (stu.getsFshangmeng() == 1 ? "是" : "否"));
				row3.createCell(21).setCellValue(stu.getShangmengTime() == null ? "" : stu.getShangmengTime());
				row3.createCell(22).setCellValue(stu.getWuxiaoyuanying() == null ? "" : stu.getWuxiaoyuanying());
				row3.createCell(23)
						.setCellValue(stu.getsFjiaofei() == null ? "" : (stu.getsFjiaofei() == 1 ? "是" : "否"));
				row3.createCell(24).setCellValue(stu.getJiaofeiTime() == null ? "" : stu.getJiaofeiTime());
				row3.createCell(25).setCellValue(stu.getMoney() == null ? 0 : stu.getMoney());
				row3.createCell(26)
						.setCellValue(stu.getsFtuifei() == null ? "" : (stu.getsFtuifei() == 1 ? "是" : "否"));
				row3.createCell(27)
						.setCellValue(stu.getsFjinban() == null ? "" : (stu.getsFjinban() == 1 ? "是" : "否"));
				row3.createCell(28).setCellValue(stu.getJinbanTime() == null ? "" : stu.getJinbanTime());
				row3.createCell(29).setCellValue(stu.getJinbanbeizhu() == null ? "" : stu.getJinbanbeizhu());
				row3.createCell(30).setCellValue(stu.getTuifeiyuanyin() == null ? "" : stu.getTuifeiyuanyin());
				row3.createCell(31).setCellValue(stu.getDingjin() == null ? 0 : stu.getDingjin());
				row3.createCell(32).setCellValue(stu.getDingjinTime() == null ? "" : stu.getDingjinTime());
				row3.createCell(33).setCellValue(stu.getAskname() == null ? "暂无咨询师"
						: (stu.getAskname()== null ? "" : stu.getAskname()));
				row3.createCell(34)
						.setCellValue(stu.getNetaskname() == null ? "暂无录入人"
								: (stu.getNetaskname()== null ? ""
										: stu.getNetaskname()));
				row3.createCell(35).setCellValue(stu.getzXSbeizhu() == null ? "" : stu.getzXSbeizhu());
			}
			// 输出Excel文件
			OutputStream output = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment; filename="+new String("学生信息.xls".getBytes("GB2312"),"ISO8859-1"));
			response.setContentType("application/msexcel");
			wkb.write(output);
			output.close();
		}
	@Override
	public Map<String, Object> selectFenPei(FenyeStu fenyeStu) {
		// TODO Auto-generated method stub
		fenyeStu.setPage((fenyeStu.getPage()-1)*fenyeStu.getRows());
		List<Students> list=studentsMapper.selectFenpeik(fenyeStu);
		Integer total=studentsMapper.selectFenpei(fenyeStu);
		Map<String, Object> map=new HashMap<String,Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}

}
