package com.lh.dao;

import java.util.List;

import com.lh.entity.LeftTree;
import com.lh.entity.Modules;
import com.lh.entity.Node;
import com.lh.entity.RolesModules;

public interface ModulesMapper {
List<Node> selectRightModules(String uname);
List<Node> selectParentId(Integer id,String uname);
List<Node> selectParentId2(Integer id);
Integer insertM(Modules modules);
Integer deleteM(Integer mid);
Integer updateM(Modules modules);
List<Node> selectAll(String mname);
List<RolesModules> selectMid(Integer rid);
List<RolesModules> selectMid2(Integer mid);
List<Node> selectquanxianModules(Integer id);
}
