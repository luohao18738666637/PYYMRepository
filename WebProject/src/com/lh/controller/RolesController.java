package com.lh.controller;


import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lh.dao.RolesMapper;
import com.lh.dao.UsersMapper;
import com.lh.entity.FenyeRoles;
import com.lh.entity.Roles;
import com.lh.entity.Userroles;
import com.lh.service.RolesService;

@Controller
public class RolesController {
	@Resource
	private RolesMapper rolesMapper;
	@Resource
	private RolesService rolesService;
	@RequestMapping(value="juese",method=RequestMethod.POST)
	@ResponseBody
public Map<String,Object> select(FenyeRoles fenyeRoles){		
	return  rolesService.select(fenyeRoles);
	
}
	@RequestMapping(value="updateRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer update(Roles roles) {
		if(rolesMapper.selectP(roles.getRname()).isEmpty()) {
			return rolesService.update(roles);	
		}else {
			return 0;
		}		
			
	}
	@RequestMapping(value="insertRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer insert(Roles roles) {
		if(rolesMapper.selectP(roles.getRname()).isEmpty()) {
			return rolesService.insert(roles);	
		}else {
			return 0;
		}		
			
		
	}
	@RequestMapping(value="deleteRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer delete(Integer rid) {
		System.out.println(rid);	
		System.out.println(rolesMapper.selectByrid(rid));
		if(!rolesMapper.selectByrid(rid).isEmpty()){
		return -1;
	}else {
		return rolesService.delete(rid);
	}
		
		
	}
	@RequestMapping(value="tianjiaRoles",method=RequestMethod.POST)
	@ResponseBody
	public Integer RolesModules(Integer rid,String mid){
		
	
		return rolesService.insertRolesModules(mid, rid);		
	}
}
