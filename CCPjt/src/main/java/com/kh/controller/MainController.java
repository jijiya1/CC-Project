package com.kh.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/main/*")
public class MainController {

	@RequestMapping(value="/sub_main", method=RequestMethod.GET)
	public void subMain() throws Exception {
		
	}
}
