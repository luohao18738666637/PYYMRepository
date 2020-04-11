package com.lh.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lh.dao.UsersMapper;
import com.lh.entity.Data;
import com.lh.entity.FenyeData;
import com.lh.entity.Userroles;
import com.lh.service.DataService;

@Controller
public class DataController {
	@Resource
	private DataService dataService;
	@Resource
	private FenyeData fenyeData;
	@Resource
	private UsersMapper usersMapper;

	@RequestMapping(value = "/selectdataAll", method = RequestMethod.POST)
	@ResponseBody
	public FenyeData selectdataAll(Integer page, Integer rows, String sname, String zname, String startTime,
			String endTime, String hFqingkuang, String gZfangshi, HttpServletRequest request) {
		fenyeData.setPage((page - 1) * rows);
		fenyeData.setPageSize(rows);
		fenyeData.setSname(sname);
		fenyeData.setZname(zname);
		fenyeData.setStartTime(startTime);
		fenyeData.setEndTime(endTime);
		fenyeData.sethFqingkuang(hFqingkuang);
		fenyeData.setgZfangshi(gZfangshi);
		Integer uid = (Integer) request.getSession().getAttribute("uid");
		fenyeData.setUid(uid);
		List<Userroles> list=usersMapper.selectByuid(uid);
		for(int i=0;i<list.size();i++) {
			if(list.get(i).getRid()==3) {
				uid=null;
				fenyeData.setUid(uid);
				return dataService.selectdataAll(fenyeData);
			}else if(list.get(i).getRid()==1) {
				return dataService.selectdataAll(fenyeData);
			}
		}
		return dataService.selectdataAll(fenyeData);
	}

	@RequestMapping(value = "/selectdatabySid", method = RequestMethod.POST)
	@ResponseBody
	public List<Data> selectdatabySid(Integer sid) {
		return dataService.selectdatabySid(sid);
	}

	@RequestMapping(value = "/deletedatabyId", method = RequestMethod.POST)
	@ResponseBody
	public Integer deletedatabyId(Integer dataid) {

		return dataService.deletedatabyId(dataid);
	}

	@RequestMapping(value = "/insertData", method = RequestMethod.POST)
	@ResponseBody
	public Integer insertData(Data data, HttpServletRequest request) {
		data.setUid((Integer) request.getSession().getAttribute("uid"));
		return dataService.insertData(data);
	}

}
