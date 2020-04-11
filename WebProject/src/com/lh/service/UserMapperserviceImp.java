package com.lh.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.apache.catalina.Session;
import com.lh.dao.UsersMapper;
import com.lh.entity.FenyeUsers;
import com.lh.entity.Users;
import com.ndktools.javamd5.Mademd5;

@Component
public class UserMapperserviceImp implements UsersMapperservice {
	@Resource
	private UsersMapper usersMapper;

	@Override
	public int insertU(Users users) {
		// TODO Auto-generated method stub
		int i;
		Mademd5 mad = new Mademd5();
		
		users.setUpassword(mad.toMd5(users.getUpassword()));
		if (usersMapper.selectU(users.getUname()) != null) {
			i = 2;
		} else {
			i = usersMapper.insertusers(users);
		}
		return i;
	}

	@Override
	public Integer denglu(Users users, HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		if (usersMapper.selectU(users.getUname()) == null) {
			request.getSession().setAttribute("uname", "Ù~Ì–´×Îå");
			return 3;

		}else if(usersMapper.selectU(users.getUname()).getLockout()==1){ 
			return 456;
		}else if (usersMapper.selectU(users.getUname()).getUname().equals(users.getUname())) {
			Users list = usersMapper.selectU(users.getUname());

			request.getSession().setAttribute("uname", list.getUname());
			request.getSession().setAttribute("uid", list.getUid());
			request.getSession().setAttribute("zname",list.getZname());
			
			request.getSession().setAttribute("phone", list.getUphone());
			request.getSession().setAttribute("email", list.getUemail());
			if (usersMapper.selectU(users.getUname()).getUpassword().equals(users.getUpassword())) {
				
				if (users.getYzm().equalsIgnoreCase((String) (request.getSession().getAttribute("text")))) {

					
					request.getSession().setAttribute("upassword", list.getUpassword());

					if ("yes".equals(users.getUsy2())) {

						Cookie userNameCookie = new Cookie("loginUserName", list.getUname());
						Cookie passwordCookie = new Cookie("loginPassword", list.getUpassword());
						userNameCookie.setMaxAge(7 * 24 * 60 * 60);
						userNameCookie.setPath("/");
						passwordCookie.setMaxAge(7 * 24 * 60 * 60);
						passwordCookie.setPath("/");
						response.addCookie(userNameCookie);
						response.addCookie(passwordCookie);
					} else {
						Cookie userNameCookie = new Cookie("loginUserName", null);
						Cookie passwordCookie = new Cookie("loginPassword", null);
						userNameCookie.setMaxAge(0);
						userNameCookie.setPath("/");
						passwordCookie.setMaxAge(0);
						passwordCookie.setPath("/");
						response.addCookie(userNameCookie);
						response.addCookie(passwordCookie);
					}

					return 1;

				} else {
					return 0;
				}

			} else {
				String uname = (String) request.getSession().getAttribute("uname");
				Integer uid=(Integer) request.getSession().getAttribute("uid");			
				users.setStatus(usersMapper.selectU(uname).getStatus() + 1);
				users.setUid(uid);
				usersMapper.updatecishu(users);
			
				if (usersMapper.selectU(uname).getStatus() >2) {
					users.setLockout(1);
					users.setStatus(0);
					usersMapper.updatesuoding(users);
				} else {
					return 2;
				}

				
			}
		}
		
		return 2;
		

	}

	@Override
	public Map<String, Object> select(FenyeUsers fenyeUsers) {
		// TODO Auto-generated method stub
		List<Users> list = usersMapper.selectUsers(fenyeUsers);
		Integer total = usersMapper.selectcount(fenyeUsers);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("total", total);
		map.put("rows", list);
		return map;
	}
}
