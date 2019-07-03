package com.kh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	

	@RequestMapping(value="user_list", method=RequestMethod.GET)
	public void getUserList() throws Exception {
		
	}
	
}
