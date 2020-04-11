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

			// ����HSSFWorkbook����(excel���ĵ�����)
			HSSFWorkbook wkb = new HSSFWorkbook();
			// �����µ�sheet����excel�ı���
			HSSFSheet sheet = wkb.createSheet("ѧ����Ϣ");
			// ��sheet�ﴴ����һ�У�����Ϊ������(excel����)��������0��65535֮����κ�һ��
			HSSFRow row1 = sheet.createRow(0);
			// ������Ԫ��excel�ĵ�Ԫ�񣬲���Ϊ��������������0��255֮����κ�һ��
			HSSFCell cell = row1.createCell(0);
			// ���õ�Ԫ������
			cell.setCellValue("ѧ����Ϣ");
			// �ϲ���Ԫ��CellRangeAddress����������α�ʾ��ʼ�У������У���ʼ�У� ������
			sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 3));
			// ��sheet�ﴴ���ڶ���

			HSSFRow row2 = sheet.createRow(1);
			// ������Ԫ�����õ�Ԫ������
			/*
			 * row2.createCell(0).setCellValue("sj_id");
			 * row2.createCell(1).setCellValue("sj_name");
			 * row2.createCell(2).setCellValue("sj_jage");
			 * row2.createCell(3).setCellValue("sj_zuozhe");
			 */

			String columnStr = "�������Ա����䣬�绰������ʱ�䣬ѧ��������״̬����Դ��������Դ��վ��"
					+ "��Դ�ؼ��֣���������΢�ţ�qq����Դ���ţ��Ƿ񱨱����γ̷����Ƿ���Ч����֣�" + "�Ƿ�طã��״λط�ʱ�䣬�Ƿ����ţ�����ʱ�䣬��Чԭ���Ƿ�ɷѣ��ɷ�ʱ�䣬���Ƿ��˷ѣ�"
					+ "�Ƿ���࣬����ʱ�䣬���౸ע���˷�ԭ�򣬶��������ʱ�䣬��ѯʦ����ѯʦ��ע";
			String[] heads = columnStr.split("��");
			for (int i = 0; i < heads.length; i++) {
				row2.createCell(i).setCellValue("" + heads[i] + "");
			}
			for (int i = 0; i < studentlist.size(); i++) {
				HSSFRow row3 = sheet.createRow(i + 2);
				Students stu = studentlist.get(i);
				row3.createCell(0).setCellValue(stu.getSname() == null ? "" : stu.getSname());
				row3.createCell(1).setCellValue(stu.getSex() == null ? "" : (stu.getSex() == 1 ? "��" : "Ů"));
				row3.createCell(2).setCellValue(stu.getAge() == null ? "" : "" + stu.getAge());
				row3.createCell(3).setCellValue(stu.getSphone() == null ? "" : stu.getSphone());
				row3.createCell(4).setCellValue(stu.getCreateTime() == null ? "" : stu.getCreateTime());
				row3.createCell(5).setCellValue(stu.getXueli() == null ? "" : stu.getXueli());
				row3.createCell(6).setCellValue(stu.getStatus() == null ? "" : (stu.getStatus()==1?"��У":"��У"));
				row3.createCell(7).setCellValue(stu.getMessageChannel() == null ? "" : stu.getMessageChannel());
				row3.createCell(8).setCellValue(stu.getMessageAddress() == null ? "" : stu.getMessageAddress());
				row3.createCell(9).setCellValue(stu.getMessageWord() == null ? "" : stu.getMessageWord());
				row3.createCell(10).setCellValue(stu.getAddress() == null ? "" : stu.getAddress());
				row3.createCell(11).setCellValue(stu.getWeChat() == null ? "" : stu.getWeChat());
				row3.createCell(12).setCellValue(stu.getQq() == null ? "" : stu.getQq());
				row3.createCell(13).setCellValue(stu.getMessagedept() == null ? "" : stu.getMessagedept());
				row3.createCell(14).setCellValue(stu.getKecFangXiang()==null ? "" : stu.getKecFangXiang());				
				row3.createCell(15).setCellValue(
						stu.getBaobei() == null ? "" : (stu.getBaobei().equals("1") ? "�ѱ���" : "δ����"));	
				row3.createCell(16)
						.setCellValue(stu.getSfyouxiao() == null ? "" : (stu.getSfyouxiao() == 1 ? "��Ч" : "��Ч"));
				row3.createCell(17).setCellValue(stu.getDafen() == null ? "" : stu.getDafen());
				row3.createCell(18)
						.setCellValue(stu.getsFhuifang() == null ? "" : (stu.getsFhuifang() == 1 ? "�ѻط�" : "δ�ط�"));
				row3.createCell(19)
						.setCellValue(stu.getFirsthuifangTime() == null ? "" : stu.getFirsthuifangTime());
				row3.createCell(20)
						.setCellValue(stu.getsFshangmeng() == null ? "" : (stu.getsFshangmeng() == 1 ? "��" : "��"));
				row3.createCell(21).setCellValue(stu.getShangmengTime() == null ? "" : stu.getShangmengTime());
				row3.createCell(22).setCellValue(stu.getWuxiaoyuanying() == null ? "" : stu.getWuxiaoyuanying());
				row3.createCell(23)
						.setCellValue(stu.getsFjiaofei() == null ? "" : (stu.getsFjiaofei() == 1 ? "��" : "��"));
				row3.createCell(24).setCellValue(stu.getJiaofeiTime() == null ? "" : stu.getJiaofeiTime());
				row3.createCell(25).setCellValue(stu.getMoney() == null ? 0 : stu.getMoney());
				row3.createCell(26)
						.setCellValue(stu.getsFtuifei() == null ? "" : (stu.getsFtuifei() == 1 ? "��" : "��"));
				row3.createCell(27)
						.setCellValue(stu.getsFjinban() == null ? "" : (stu.getsFjinban() == 1 ? "��" : "��"));
				row3.createCell(28).setCellValue(stu.getJinbanTime() == null ? "" : stu.getJinbanTime());
				row3.createCell(29).setCellValue(stu.getJinbanbeizhu() == null ? "" : stu.getJinbanbeizhu());
				row3.createCell(30).setCellValue(stu.getTuifeiyuanyin() == null ? "" : stu.getTuifeiyuanyin());
				row3.createCell(31).setCellValue(stu.getDingjin() == null ? 0 : stu.getDingjin());
				row3.createCell(32).setCellValue(stu.getDingjinTime() == null ? "" : stu.getDingjinTime());
				row3.createCell(33).setCellValue(stu.getAskname() == null ? "������ѯʦ"
						: (stu.getAskname()== null ? "" : stu.getAskname()));
				row3.createCell(34)
						.setCellValue(stu.getNetaskname() == null ? "����¼����"
								: (stu.getNetaskname()== null ? ""
										: stu.getNetaskname()));
				row3.createCell(35).setCellValue(stu.getzXSbeizhu() == null ? "" : stu.getzXSbeizhu());
			}
			// ���Excel�ļ�
			OutputStream output = response.getOutputStream();
			response.reset();
			response.setHeader("Content-disposition", "attachment; filename="+new String("ѧ����Ϣ.xls".getBytes("GB2312"),"ISO8859-1"));
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
