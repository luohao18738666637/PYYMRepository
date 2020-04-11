package com.lh.controller;

import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.lh.entity.FenyeRoles;
import com.lh.service.RolesService;

@Controller
public class Login {

@RequestMapping(value="home")
public String home(HttpServletRequest request) {
	if(request.getSession().getAttribute("upassword")==null) {
		return "login";	
	}else {
		return "home";	
	}
		
}
@RequestMapping(value="users")
public String users(HttpServletRequest request) {
	if(request.getSession().getAttribute("uid")==null) {
		return "login";	
	}else {
		return "users";	
	}
	
}
@RequestMapping(value="modules")
public String modules(HttpServletRequest request) {
	
	if(request.getSession().getAttribute("uid")==null) {
		return "login";	
	}else {
		return "modules";		
	}
}
@RequestMapping(value="roles")

public String select(HttpServletRequest request){

if(request.getSession().getAttribute("uid")==null) {
	return "login";	
}else {
	return  "roles";	
}

}
@RequestMapping(value="students")
public String stu(HttpServletRequest request) {
	
	if(request.getSession().getAttribute("uname")==null) {
		return "login";	
	}else {
		return "students";
	}
}
@RequestMapping(value="data")
public String stuData(HttpServletRequest request) {
		
	if(request.getSession().getAttribute("uid")==null) {
		return "login";	
	}else {
		return "data";
	}
}
@RequestMapping(value="Mynews")
public String Mynews(HttpServletRequest request) {
	
	if(request.getSession().getAttribute("uid")==null) {
		return "login";	
	}else {
		return "Mynews";	
	}
}
@RequestMapping(value="netStudents")
public String NetStudents(HttpServletRequest request) {
		
	if(request.getSession().getAttribute("uid")==null) {
		return "login";	
	}else {
		return "NetStudents";	
	}
}
@RequestMapping(value="fenpei")
public String Fenpei(HttpServletRequest request) {
	
	
	if(request.getSession().getAttribute("uid")==null) {
		return "login";	
	}else {
		return "FenPei";		
	}
}
@RequestMapping(value="userswanshan")
public String wanshan() {
	

	return "Userswanshan";
}
}
