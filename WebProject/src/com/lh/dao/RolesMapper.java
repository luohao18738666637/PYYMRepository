package com.lh.dao;

import java.util.List;

import com.lh.entity.FenyeRoles;
import com.lh.entity.Roles;
import com.lh.entity.RolesModules;
import com.lh.entity.Userroles;

public interface RolesMapper {
List<Roles> select(FenyeRoles fenyeRoles);
Integer selectNum(FenyeRoles fenyeRoles);
Integer insertRoles(Roles roles);
Integer deleteRoles(Integer rid);
Integer updateRoles(Roles roles);
List<Roles> selectP(String rname);
Integer deleteRolesModules(Integer rid);
Integer insertRolesModoules(List<RolesModules> rid);
List<Userroles> selectByrid(Integer rid);
}
