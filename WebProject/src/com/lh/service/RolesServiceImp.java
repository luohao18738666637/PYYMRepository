package com.lh.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lh.dao.RolesMapper;
import com.lh.entity.FenyeRoles;
import com.lh.entity.Roles;
import com.lh.entity.RolesModules;

@Service
public class RolesServiceImp implements RolesService {
	@Resource
	private RolesMapper rolesMapper;

	@Override
	public Map<String, Object> select(FenyeRoles fenyeRoles) {
		// TODO Auto-generated method stub
		fenyeRoles.setPage((fenyeRoles.getPage() - 1) * fenyeRoles.getRows());
		List<Roles> list = rolesMapper.select(fenyeRoles);
		System.out.print(list);
		Integer total = rolesMapper.selectNum(fenyeRoles);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}

	@Override
	public Integer insert(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.insertRoles(roles);
	}

	@Override
	public Integer delete(Integer rid) {
		// TODO Auto-generated method stub
		return rolesMapper.deleteRoles(rid);
	}

	@Override
	public Integer update(Roles roles) {
		// TODO Auto-generated method stub
		return rolesMapper.updateRoles(roles);
	}

	@Override
	public Integer insertRolesModules(String mid, Integer rid) {
		// TODO Auto-generated method stub

		if (mid != null && mid != "") {
			String[] split = mid.split(",");
			List<RolesModules> list = new ArrayList<RolesModules>();
			for (int i = 0; i < split.length; i++) {
				RolesModules r = new RolesModules();
				r.setMid(Integer.parseInt(split[i]));
				r.setRid(rid);
				list.add(r);
			}
			
			Integer l = rolesMapper.deleteRolesModules(rid);

			rolesMapper.insertRolesModoules(list);
			return 1;
		} else {
			return 0;
		}

	}

}
