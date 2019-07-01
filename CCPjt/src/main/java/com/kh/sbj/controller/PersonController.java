package com.kh.sbj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.domain.AreaDataVo;
import com.kh.sbj.domain.PersonVo;
import com.kh.sbj.service.IPersonService;


@Controller
@RequestMapping("/person_board/*")
public class PersonController {
	
	@Inject
	private IPersonService personService;
	
	@RequestMapping(value = "/person_list", method = RequestMethod.GET)
	public String personBoardList(Model model, @RequestParam("a_no") int a_no) throws Exception {
		List<PersonVo> personList = personService.selectAll();
		AreaDataVo areaDataVo = personService.selectArea(a_no);
		System.out.println("ano = "+ a_no);
		System.out.println("areaData = "+ areaDataVo);
		model.addAttribute("personList", personList);
		model.addAttribute("areaDataVo", areaDataVo);
		return "/person_board/person_list";
	}
	
	@RequestMapping(value = "/person_minipage", method = RequestMethod.GET)
	public void personMinipage(@RequestParam("u_id") String u_id, Model model) throws Exception {
		PersonVo personVo = personService.selectPerson(u_id);
		model.addAttribute("personVo", personVo);
	}
	
}
