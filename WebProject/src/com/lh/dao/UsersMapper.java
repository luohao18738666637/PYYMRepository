package com.lh.dao;

import java.util.List;

import com.lh.entity.FenyeUsers;
import com.lh.entity.Modules;
import com.lh.entity.Node;
import com.lh.entity.Roles;
import com.lh.entity.Userroles;
import com.lh.entity.Users;

public interface UsersMapper {
	/**
	 * 多条件查询用户信息
	 * @param fenyeUsers
	 * @return
	 */
List<Users> selectUsers(FenyeUsers fenyeUsers);

/**
 * 多条件查询用户信息总条数
 */
Integer selectcount(FenyeUsers fenyeUsers);
/**
 * 修改用户信息
 * @param users
 * @return
 */
Integer updateusers(Users users);

/**
 * 删除用户信息
 * @param uid
 * @return
 */
Integer deleteusers(Integer uid);
/**
 * 添加用户信息
 * @param users
 * @return
 */
Integer insertusers(Users users);
/**
 * 根据用户名称查询用户信息
 * 
 * 
 */
Users selectU(String uname);
/**
 *根据用户id查询出其身份然后显示其能够管理的模块 
 */


/**
 * 查询所有角色
 * @return
 */
List<Roles> selectRolesAll();
/**
 * 查询该用户的角色
 */
List<Roles> selectUserRoles(String uid);
/**
 * 给该用户添加一个角色
 * @return
 */
Integer insertUserRoles(Userroles userroles);
/**
 * 删除该用户的一个角色
 * @return
 */
Integer deleteUserRoles(Userroles userroles);
/**
 * 查询所有用户的用户名（账号）
 * @return
 */
List<Users> selectUserUname();
/**
 * 修改用户密码
 */
Integer updateUpassword(Users users);
/**
 * 查询用户对应的角色id
 * 
 */
List<Userroles> selectByuid(Integer uid);
/**
 * 签退
 */
Integer updateQiantui(Users users);
/*
 * 签到
 */
Integer updateQiandao(Users users);
/*
 * 
 * 签退
 */
Integer qiantuiall(Integer qiandao);
/*
 * 自动分配
 */
List<Userroles> selectzxsid();
/*
 * 完善用户信息
 */
Users selectWanshan(String uname);
/*
 * 锁定用户
 */
Integer updatesuoding(Users users);
/*
 * 登陆次数
 */
Integer updatecishu(Users users);
/*
 * 完善个人信息
 */
Integer updategerenxx(Users users);
}

