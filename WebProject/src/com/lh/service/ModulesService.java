package com.lh.service;

import java.util.List;

import com.lh.entity.LeftTree;
import com.lh.entity.Modules;
import com.lh.entity.Node;
import com.lh.entity.RolesModules;

public interface ModulesService {
public List<Node> selectRightModules(String uname);
public List<Node> selectParentId(Integer id,String uname);
public List<Node> selectParentId2(Integer id);
public Integer  update(Modules modules);
public Integer insert(Modules modules);
public Integer delete(Integer mid);
public List<RolesModules> selectMid(Integer rid);
public List<Node> selectMM(Integer id);
}
