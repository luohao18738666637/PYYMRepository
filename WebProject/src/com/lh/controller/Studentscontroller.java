package com.lh.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lh.dao.StudentsMapper;
import com.lh.dao.UsersMapper;
import com.lh.entity.Dongtai;
import com.lh.entity.FenyeStu;
import com.lh.entity.Fenyedt;
import com.lh.entity.Students;
import com.lh.entity.Userroles;
import com.lh.entity.Users;
import com.lh.service.Dongtaiservice;
import com.lh.service.StudentsService;

@Controller
public class Studentscontroller {
@Autowired
private StudentsService studentsService;
@Autowired
private StudentsMapper studentsMapper;
@Resource
private UsersMapper usersMapper;
@Resource
private Dongtaiservice dongtaiservice;
@RequestMapping(value="select",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> select(FenyeStu fenyeStu,HttpServletRequest request){
	Integer uid=(Integer) request.getSession().getAttribute("uid");
	List<Userroles> list=usersMapper.selectByuid(uid);
	for(Userroles l:list ) {
		if(l.getRid()==1) {
			fenyeStu.setAskid(uid);
		request.getSession().setAttribute("rid",1);
		}else  if(l.getRid()==2) {
			request.getSession().setAttribute("rid",2);
			fenyeStu.setNetaskid(uid);
			}
				  else if(l.getRid()>4) { 
					  fenyeStu.setAskid(uid);
				  
				  }
				 else {
			break;
		}
	}		
	return studentsService.select(fenyeStu);
		
}
@RequestMapping(value="delete",method=RequestMethod.POST)
@ResponseBody
public int delete(Integer sid) {
	return studentsService.delete(sid);	
}
@RequestMapping(value="zxs")
@ResponseBody
public List<Users> selectU(){
	return studentsMapper.selectU();	
}
@RequestMapping(value="wlzxs")
@ResponseBody
public List<Users> selectUU(){
	return studentsMapper.selectUU();	
}
@RequestMapping(value="insertStudents",method=RequestMethod.POST)
@ResponseBody
public Integer insertStu(Students students) {
	return studentsService.insertStu(students);	
}
@RequestMapping(value="updateStudents",method=RequestMethod.POST)
@ResponseBody
public Integer updateStu(Students students) {
	System.out.println(studentsService.updateStu(students));

	return studentsService.updateStu(students);
	
}
@RequestMapping(value="getExecl",method=RequestMethod.GET)
@ResponseBody
public void setexcel(HttpServletRequest request, HttpServletResponse response, String sid) {
	 try {
		 
		studentsService.daochuexcel(request, response, sid);
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}
@RequestMapping(value="JLStudnets",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> JLStudents(FenyeStu fenyeStu,HttpServletRequest request){
	
		
		return studentsService.select(fenyeStu);
		
}
@RequestMapping(value="fenpei",method=RequestMethod.POST)
@ResponseBody
public Map<String,Object> FenPei(FenyeStu fenyeStu){
	return studentsService.selectFenPei(fenyeStu);
	
}
@RequestMapping(value="fenpeiStudents",method=RequestMethod.POST)
@ResponseBody
public Integer fenpeiStudents(Students students) {
	String[] split=students.getFid().split(",");
	List<Integer> list=new ArrayList<Integer>();
	students.setList(list);
	for(int i=0;i<split.length;i++) {		
		list.add(Integer.parseInt(split[i]));
	}	
	return studentsMapper.updateFenpei(students);	
}
@RequestMapping(value="dongtai",method=RequestMethod.POST)
@ResponseBody
public Integer dongtai(Dongtai dongtai,HttpServletRequest request) {
	Integer sendid=(Integer) request.getSession().getAttribute("uid");
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:ss");
	Date date=new Date();
	dongtai.setSendTime(sdf.format(date));
	dongtai.setStatus(0);
	dongtai.setSendid(sendid);
	
	return studentsMapper.insertDT(dongtai);	
}
@RequestMapping(value="dongtaiTanchuang",method=RequestMethod.POST)
@ResponseBody
public Integer dongtaiTanchuang(Dongtai dongtai,HttpServletRequest request) {
	Integer zxsid=(Integer) request.getSession().getAttribute("uid");
	List<Dongtai>  list=studentsMapper.selectDDTT(zxsid);
	if(list.size()>0) {
	return list.size();
	}else {
		return 0;
	}
	

}
@RequestMapping(value="dongtaishuju",method=RequestMethod.POST)
@ResponseBody
public List<Dongtai> lookdtxx(Dongtai dongtai,HttpServletRequest request) {
	
	Integer zxsid=(Integer) request.getSession().getAttribute("uid");
	dongtai.setStatus(0);
	dongtai.setZxsid(zxsid);
	return dongtaiservice.selectDT(dongtai);

}
@RequestMapping(value="updatedongtaixx",method=RequestMethod.POST)
@ResponseBody
public Integer updatedtxx(Dongtai dongtai) {
	dongtai.setStatus(1);
	
	return dongtaiservice.updateDT(dongtai);

}


}
