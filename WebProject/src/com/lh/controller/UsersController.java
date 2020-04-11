package com.lh.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lh.dao.StudentsMapper;
import com.lh.dao.UsersMapper;
import com.lh.entity.FenyeUsers;
import com.lh.entity.Roles;
import com.lh.entity.Students;
import com.lh.entity.Userroles;
import com.lh.entity.Users;
import com.lh.service.UsersService;
import com.lh.util.ShijianQujian;
import com.ndktools.javamd5.Mademd5;

@Controller
public class UsersController {
	@Resource
	private FenyeUsers fenyeUsers;
	@Resource
	private UsersService usersServiceImp;
	@Resource
	private UsersMapper usersMapper;
	@Resource
	private StudentsMapper studentsMapper;
	@Resource
	private Students students;
	@RequestMapping(value = "/selectAll", method = RequestMethod.POST)
	@ResponseBody
	public FenyeUsers selectAll(Integer page, Integer rows, String uname, String setTime, String endTime,
			Integer lockout) {
		fenyeUsers.setPage((page - 1) * rows);
		fenyeUsers.setPageSize(rows);
		fenyeUsers.setUname(uname);
		fenyeUsers.setSetTime(setTime);
		fenyeUsers.setEndTime(endTime);
		fenyeUsers.setLockout(lockout);
		return usersServiceImp.selectAll(fenyeUsers);
	}

	@RequestMapping(value = "/updateUsers", method = RequestMethod.POST)
	@ResponseBody
	public Integer updateUsers(Users users) {
		/*
		 * Mademd5 mad = new Mademd5();
		 * users.setUpassword(mad.toMd5(users.getUpassword()));
		 */
		return usersServiceImp.updateUser(users);
	}

	@RequestMapping(value = "/deleteUsers", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteUsers(Integer uid) {
		return usersServiceImp.deleteUser(uid);
	}

	@RequestMapping(value = "/insertUsers", method = RequestMethod.POST)
	@ResponseBody
	public Integer insertUsers(Users users) {
		Mademd5 mad = new Mademd5();
		
		String upassword=mad.toMd5(users.getUpassword().trim());
		String uname=users.getUname().trim();
		users.setUname(uname);
		users.setLockout(0);
		users.setStatus(0);
		users.setUpassword(upassword);
		System.out.print(upassword);
		return usersServiceImp.insertUser(users);
	}

	@RequestMapping(value = "/selectRolesAll", method = RequestMethod.POST)
	@ResponseBody
	public List<Roles> selectRolesAll() {
		return usersServiceImp.selectRolesAll();
	}

	@RequestMapping(value = "/selectUserRoles", method = RequestMethod.POST)
	@ResponseBody
	public List<Roles> selectUserRoles(String uid) {
		return usersServiceImp.selectUserRoles(uid);
	}

	@RequestMapping(value = "/insertUserRoles", method = RequestMethod.POST)
	@ResponseBody
	public Integer insertUserRoles(Userroles userroles) {
		return usersServiceImp.insertUserRoles(userroles);
	}

	@RequestMapping(value = "/deleteUserRoles", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteUserRoles(Userroles userroles) {
		return usersServiceImp.deleteUserRoles(userroles);
	}

	@RequestMapping(value = "/selectUserUname", method = RequestMethod.POST)
	@ResponseBody
	public List<Users> selectUserUname() {
		return usersServiceImp.selectUserUname();
	}

	@RequestMapping(value = "updateUsersPassword", method = RequestMethod.POST)
	@ResponseBody
	public Integer updateUsersPassword(Users users, HttpServletRequest request) {
		Mademd5 mad = new Mademd5();
		users.setUpassword1(mad.toMd5(users.getUpassword1()));

		String uname = (String) request.getSession().getAttribute("uname");
		users.setUname(uname);
		String u = usersMapper.selectU(uname).getUpassword();
		if (!u.equals(users.getUpassword1())) {
			return 4;
		} else if (!users.getUpassword().equals(users.getUpassword2())) {
			return 2;
		} else if (u.equals(mad.toMd5(users.getUpassword()))) {
			return 3;
		} else {

			users.setUpassword(mad.toMd5(users.getUpassword()));
			return usersMapper.updateUpassword(users);
		}

	}
	@RequestMapping(value = "qiandaoUsers", method = RequestMethod.POST)
	@ResponseBody
	public Integer Usersqiandao(Users users, HttpServletRequest request) {
	
		Date date1=new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		  boolean shijian = ShijianQujian.is_shijianq("8:00", "20:00"); 
		  System.out.print(shijian);
		if (users.getUuid() != "" && users.getUuid() != null) {
			String[] split = users.getUuid().split(",");
			List<Integer> list = new ArrayList<Integer>();
			for (int i = 0; i < split.length; i++) {
				list.add(Integer.parseInt(split[i]));
			}
			users.setList(list);
			System.out.print(list);
			users.setQiandao(0);

			return usersMapper.updateQiantui(users);
		} else if(shijian==false){
			String uname=(String) request.getSession().getAttribute("uname");
			if(usersMapper.selectU(uname).getQiandao()==1) {
				return 4;
			}else {
				System.out.print(users.getQiandao());
				Integer uid = (Integer) request.getSession().getAttribute("uid");
				users.setUid(uid);
				users.setQiandaoTime(df.format(date1));
				 usersMapper.updateQiandao(users);
				return 2;
			}
			
		}else {
			String uname=(String) request.getSession().getAttribute("uname");
			if(usersMapper.selectU(uname).getQiandao()==1) {
				return 4;
			}else {
			Integer uid = (Integer) request.getSession().getAttribute("uid");
			users.setUid(uid);
			users.setQiandaoTime(df.format(date1));
			return usersMapper.updateQiandao(users);
		}
		}
	}
	@RequestMapping(value = "qiantuiUsers", method = RequestMethod.POST)
	@ResponseBody
	public Integer Usersqiantui(Users users, HttpServletRequest request) {
	
		Date date1=new Date();
		SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd hh:mm:ss");
		  boolean shijian = ShijianQujian.is_shijianq("8:00", "20:00");
		 if(shijian==true) {
			String uname=(String) request.getSession().getAttribute("uname");
			 if(usersMapper.selectU(uname).getQiandao()==0) {
				 return 3;
			 }else {
				 return 2;
			 }
			
		 }else{
			 String uname=(String) request.getSession().getAttribute("uname");
			 if(usersMapper.selectU(uname).getQiandao()==0) {
				 return 3;
			 }else {
			 Integer uid = (Integer) request.getSession().getAttribute("uid");
			 users.setUid(uid);
			 users.setQiandaoTime(df.format(date1));
			 return usersMapper.updateQiandao(users); 
		 }
		 }
		
	}
	@RequestMapping(value = "/qiantuiall", method = RequestMethod.POST)
	@ResponseBody
	public Integer qiantuiall(Integer qiandao) {
		return usersMapper.qiantuiall(qiandao);
	}
	@RequestMapping(value = "/wanshanxx", method = RequestMethod.POST)
	@ResponseBody
	public Users wanshanxx(Users users,HttpServletRequest request) {
		String uname=(String) request.getSession().getAttribute("uname");
		System.out.print(usersMapper.selectWanshan(uname)+"dddddddd");
		return usersMapper.selectWanshan(uname);
				
	}
	@RequestMapping(value="gerenxx",method=RequestMethod.POST)
	@ResponseBody
public Integer updategerenxx(Users users,HttpServletRequest request) {
		Integer uid=(Integer) request.getSession().getAttribute("uid");
		users.setUid(uid);
		
	return usersMapper.updategerenxx(users);
	
}

}
