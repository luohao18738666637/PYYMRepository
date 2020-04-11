package com.lh.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lh.dao.ModulesMapper;
import com.lh.dao.UsersMapper;
import com.lh.entity.LeftTree;
import com.lh.entity.Modules;
import com.lh.entity.Node;
import com.lh.entity.RolesModules;
import com.lh.service.ModulesService;

@Controller
public class ModulesController {
	@Resource
	private ModulesMapper modulesMapper;
	@Resource
	private ModulesService modulesService;
	@Resource
	private UsersMapper usersMapper;

	@RequestMapping(value = "/tree", method = RequestMethod.POST)
	@ResponseBody
	/**
	 * 树形菜单
	 * @param request
	 * @return
	 */
	public List<Node> select(HttpServletRequest request) {
		String uname = (String) request.getSession().getAttribute("uname");
		List<Node> list = modulesService.selectRightModules(uname);
		return getchildren(list, uname);
	}
	public List<Node> getchildren(List<Node> list,String uname) {
		for (Node node : list) {
			List<Node> list2= modulesService.selectParentId(node.getId(), uname);
			if (list2.isEmpty()) {

			} else {
				getchildren(list2, uname);
				node.setChildren(list2);
			}
		}
		return list;
	}
/**
 * 模块管理
 * @return
 */
	@RequestMapping(value = "/tree1", method = RequestMethod.POST)
	@ResponseBody
	public List<Node> select1() {

		List<Node> list = modulesService.selectParentId2(0);
		return getchildren1(list);
	}

	public List<Node> getchildren1(List<Node> list) {
		for (Node node : list) {
			List<Node> childrenlist = modulesService.selectParentId2(node.getId());
			if (childrenlist.isEmpty()) {

			} else {
				getchildren1(childrenlist);
				node.setChildren(childrenlist);
			}
		}
		return list;
	}
/**
 * 增删改角色权限
 */
	int id1 = 0;
	@RequestMapping(value = "/rolesTree", method = RequestMethod.POST)
	@ResponseBody
	public List<Node> select2(Integer rid) {
		System.out.print(rid);
		id1 = rid;
		List<Node> list = modulesService.selectParentId2(0);
		return getchildren2(list);
	}

	public List<Node> getchildren2(List<Node> list) {
		List<RolesModules> list1 = modulesService.selectMid(id1);
		for (Node node : list) {
			List<Node> childrenlist = modulesService.selectParentId2(node.getId());
			if (childrenlist.isEmpty()) {

			} else {
				getchildren2(childrenlist);
				node.setChildren(childrenlist);
				for (Node node1 : childrenlist) {
					for (RolesModules node2 : list1) {
						if (node1.getId() == node2.getMid()) {
							node1.setChecked(true);
						}
					}
				}
			}
		}
		return list;
	}
/**
 * 修改角色名称
 * @param modules
 * @return
 */
	@RequestMapping(value = "updateModules", method = RequestMethod.POST)
	@ResponseBody
	public Integer update(Modules modules) {

		if (modulesMapper.selectAll(modules.getMname()).isEmpty()) {
			return modulesService.update(modules);
		} else {
			return 0;

		}
	}
/**
 * 删除角色
 * @param mid
 * @return
 */
	@RequestMapping(value = "deleteModules", method = RequestMethod.POST)
	@ResponseBody
	public Integer delete(Integer mid) {
   if(!modulesMapper.selectMid2(mid).isEmpty()) {
	   return 2;
   }else {
	   return modulesService.delete(mid);
   }
		
	}
/**
 * 添加修改角色权限
 * @param modules
 * @return
 */
	@RequestMapping(value = "insertModules", method = RequestMethod.POST)
	@ResponseBody
	public Integer insert(Modules modules) {
		if (modulesMapper.selectAll(modules.getMname()).isEmpty()) {
			return modulesService.insert(modules);
		} else {
			return 0;

		}

	}
}
