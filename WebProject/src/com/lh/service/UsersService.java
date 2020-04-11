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
	  * ��ѯ���н�ɫ
	  * @return
	  */
	 List<Roles> selectRolesAll();
	 /**
	  * ��ѯ���û��Ľ�ɫ
	  */
	 List<Roles> selectUserRoles(String uid);
	 /**
	  * �����û����һ����ɫ
	  * @return
	  */
	 Integer insertUserRoles(Userroles userroles);
	 /**
	  * ɾ�����û���һ����ɫ
	  * @return
	  */
	 Integer deleteUserRoles(Userroles userroles);
	 /**
	  * ��ѯ�����û����û������˺ţ�
	  * @return
	  */
	 List<Users> selectUserUname();
	 /**
	  * 
	  * 
	  */
	 Users selectU(String uname);
}
