package com.lh.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class test {
	@RequestMapping(value="test")
	
public String t() {
	System.out.print("sds");
	return null;
	
}
}
