package com.kh.jhj.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/petition/*")
public class PetitionController {
	
	@RequestMapping(value="petitionList", method = RequestMethod.GET)
	public void petitionList(Model model) throws Exception{
		
	}
	
	

}
