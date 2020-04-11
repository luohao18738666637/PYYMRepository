package com.lh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lh.dao.UsersMapper;
import com.lh.entity.FenyeUsers;
import com.lh.entity.Roles;
import com.lh.entity.Userroles;
import com.lh.entity.Users;

@Service
public class UsersServiceImp implements UsersService {
	@Resource
	private UsersMapper usersMapper;
	@Resource
	private FenyeUsers fenyeUsers;
	@Override
	public FenyeUsers selectAll(FenyeUsers fenyeUsers) {
		
		List<Users> list=  usersMapper.selectUsers(fenyeUsers);
		Integer total=usersMapper.selectcount(fenyeUsers);
		
		fenyeUsers.setTotal(total);
		fenyeUsers.setRows(list);
		return fenyeUsers;
	}
	@Override
	public Integer updateUser(Users users) {
		
		return usersMapper.updateusers(users);
	}
	@Override
	public Integer deleteUser(Integer uid) {
		
		return usersMapper.deleteusers(uid);
	}
	@Override
	public Integer insertUser(Users users) {
	
		return usersMapper.insertusers(users);
	}
	@Override
	public List<Roles> selectRolesAll() {
		
		return usersMapper.selectRolesAll();
	}
	@Override
	public List<Roles> selectUserRoles(String uid) {
		
		return usersMapper.selectUserRoles(uid);
	}
	@Override
	public Integer insertUserRoles(Userroles userroles) {		
		return usersMapper.insertUserRoles(userroles);
	}
	@Override
	public Integer deleteUserRoles(Userroles userroles) {		
		return usersMapper.deleteUserRoles(userroles);
	}
	@Override
	public List<Users> selectUserUname() {
		
		return usersMapper.selectUserUname();
	}
	@Override
	public Users selectU(String uname) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
