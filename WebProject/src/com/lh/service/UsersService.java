package com.lh.service;

import java.util.List;

import com.lh.entity.FenyeUsers;
import com.lh.entity.Roles;
import com.lh.entity.Userroles;
import com.lh.entity.Users;

public interface UsersService {
	 FenyeUsers selectAll(FenyeUsers fenyeUsers);
	 Integer updateUser(Users users);
	
	 Integer deleteUser(Integer uid);
	 Integer insertUser(Users users);
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
	  * 
	  * 
	  */
	 Users selectU(String uname);
}
