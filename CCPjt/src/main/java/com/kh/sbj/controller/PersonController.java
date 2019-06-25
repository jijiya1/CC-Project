package com.kh.sbj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.sbj.domain.PersonVo;
import com.kh.sbj.service.IPersonService;


@Controller
@RequestMapping("/person_board/*")
public class PersonController {
	
	@Inject
	private IPersonService personService;
	
	@RequestMapping(value = "/person_list", method = RequestMethod.GET)
	public String personBoardList(Model model) throws Exception {
		List<PersonVo> personList = personService.selectAll();
		model.addAttribute("personList", personList);
		return "/person_board/person_list";
	}
	
	@RequestMapping(value = "/person_minipage", method = RequestMethod.GET)
	public String personBoardList() throws Exception {
		
		return "/person_board/person_minipage";
	}
}
