package com.lh.service;


import java.util.Map;

import com.lh.entity.FenyeRoles;
import com.lh.entity.Roles;
public interface RolesService {
public Map<String,Object> select(FenyeRoles fenyeRoles);
public Integer insert(Roles roles);
public Integer delete(Integer rid);
public Integer update(Roles roles);
public Integer insertRolesModules(String mid,Integer rid);
}
