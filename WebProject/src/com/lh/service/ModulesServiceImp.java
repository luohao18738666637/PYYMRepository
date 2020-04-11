package com.lh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lh.dao.ModulesMapper;
import com.lh.entity.LeftTree;
import com.lh.entity.Modules;
import com.lh.entity.Node;
import com.lh.entity.RolesModules;
@Service
public class ModulesServiceImp implements ModulesService {
@Resource
private ModulesMapper modulesMapper;
	@Override
	public List<Node> selectRightModules(String uname) {
		// TODO Auto-generated method stub
		return modulesMapper.selectRightModules(uname);
	}	
	@Override
	public List<Node> selectParentId(Integer id,String uname) {
		// TODO Auto-generated method stub
		
		return modulesMapper.selectParentId(id, uname);
	}
	@Override
	public List<Node> selectParentId2(Integer id) {
		// TODO Auto-generated method stub
		return modulesMapper.selectParentId2(id);
	}
	@Override
	public Integer update(Modules modules) {
		// TODO Auto-generated method stub
		return modulesMapper.updateM(modules);
	}
	@Override
	public Integer insert(Modules modules) {
		// TODO Auto-generated method stub
		return modulesMapper.insertM(modules);
	}
	@Override
	public Integer delete(Integer mid) {
		// TODO Auto-generated method stub
		return modulesMapper.deleteM(mid);
	}
	@Override
	public List<RolesModules> selectMid(Integer rid) {
		// TODO Auto-generated method stub
		return modulesMapper.selectMid(rid);
	}
	@Override
	public List<Node> selectMM(Integer id) {
		// TODO Auto-generated method stub
		return modulesMapper.selectquanxianModules(id);
	}


}
