package com.lh.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.net.HttpCookie;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.YamlProcessor.ResolutionMethod;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lh.dao.UsersMapper;
import com.lh.entity.FenyeUsers;
import com.lh.entity.Users;
import com.lh.service.UsersMapperservice;
import com.lh.util.CookiesUtil;
import com.lh.util.SCaptcha;
import com.ndktools.javamd5.Mademd5;

@Controller
public class Dengluyanzheng {
	@Resource
	private UsersMapperservice usersMapperserviceImp;
	@Resource
	private UsersMapper usersMapper;
	@Resource
	private Users users;
@Resource
private CookiesUtil cookiesUtil;
	@RequestMapping("getVerifiCode")
	@ResponseBody
	public void getVerifiCode(HttpServletRequest request, HttpServletResponse response) throws IOException {
		/*
		 * 1.生成验证码 2.把验证码上的文本存在session中 3.把验证码图片发送给客户端
		 */

		SCaptcha ivc = new SCaptcha(); // 用我们的验证码类，生成验证码类对象

		BufferedImage image = ivc.getImage();
		/* System.out.println(ivc.getText()); */

		request.getSession().setAttribute("text", ivc.getText()); // 将验证码的文本存在session中

		ivc.output(image, response.getOutputStream());// 将验证码图片响应给客户端
	}
	@RequestMapping(value = "insertU", method = RequestMethod.POST)
	@ResponseBody
	public int zhuce(Users users, HttpServletRequest request) {
		System.out.print(users.getUname());
		Date date = new Date();
		SimpleDateFormat data = new SimpleDateFormat("yyyy--MM--dd HH:mm:ss");
		users.setUserTime(data.format(date));
		System.out.println(request.getSession().getAttribute("text") + "," + "ddddddddddddd");
		return usersMapperserviceImp.insertU(users);
	}
	
	@RequestMapping(value="login")
	public String denglu(HttpServletRequest request,HttpServletResponse response) {
		
		   HttpSession session=request.getSession();
		   Cookie useruanme =cookiesUtil.getCookieByName(request, "loginUserName"); 
		   Cookie userpassword =cookiesUtil.getCookieByName(request, "loginPassword");
		  
		   if(useruanme!=null&&useruanme.getValue()!=""&&userpassword!=null&& userpassword.getValue()!="") {			   			 	 
				   users.setUname(useruanme.getValue());
				   users.setUpassword(userpassword.getValue());		
				   users.setYzm((String)session.getAttribute("text")); 
				
				   denglu(users,request,response);	
				   return  "home";
		   }else {
			   return "login";	 
		   }
		
		
		
	}
	@RequestMapping(value = "denglu", method = RequestMethod.POST)
	@ResponseBody
	public int denglu(Users users, HttpServletRequest request,HttpServletResponse response) {
		
		  Mademd5 mad = new Mademd5();
		String upassword=mad.toMd5(users.getUpassword());
		  users.setUpassword(upassword);
	      System.out.println(usersMapper.selectU(users.getUname()));
		/*
		 * System.out.println(upassword); System.out.println(users.getUname());
		 */
			
		return usersMapperserviceImp.denglu(users,request,response);

		
	}
	
	@RequestMapping(value = "/chongzhi", method = RequestMethod.POST)
	@ResponseBody
	public int chongzhi( HttpServletRequest request,HttpServletResponse response) throws Exception {
		
		
						
		  Cookie userNameCookie = new Cookie("loginUserName", null); 
		  Cookie passwordCookie = new Cookie("loginPassword", null);
		  userNameCookie.setMaxAge(0);
		  userNameCookie.setPath("/");
		  passwordCookie.setMaxAge(0);
		  passwordCookie.setPath("/");
		  response.addCookie(userNameCookie);
		  response.addCookie(passwordCookie);
		  
		  request.getSession().removeAttribute("uid");
		  request.getSession().removeAttribute("uname");
		  request.getSession().removeAttribute("upassword");
		  if(request.getSession().getAttribute("uid") == null) {
			  return 1;  
		  }else {
				return 0; 
		  }
	


		
	}
	@RequestMapping(value="suoding",method=RequestMethod.POST)
	@ResponseBody
	public Integer suoding(Users users) {
		System.out.println(users.getLockout());
		System.out.println(users.getUid());
		return usersMapper.updatesuoding(users);
		
	}


}
