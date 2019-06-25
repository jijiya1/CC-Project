package com.kh.sbj.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kh.sbj.domain.PersonPromiseVo;
import com.kh.sbj.domain.PersonVo;
import com.kh.sbj.service.IPersonMinipageService;
import com.kh.sbj.service.IPersonService;


@RestController
@RequestMapping("/person_mini/*")
public class PersonMinipageController {
	
	@Inject
	private IPersonMinipageService personMinipageService;
	
	@RequestMapping(value = "/promise_list/{u_id}", method = RequestMethod.GET)
	public ResponseEntity<List<PersonPromiseVo>> personPromiseList(@PathVariable("u_id") String u_id) throws Exception {
		System.out.println("미니컨트롤러 리스트호출");
		ResponseEntity<List<PersonPromiseVo>> entity = null;
		try {
			System.out.println("u_id = "+u_id);
			List<PersonPromiseVo> list = personMinipageService.selectAllPromise(u_id);
			System.out.println("controller LIST = "+list);
			entity = new ResponseEntity<List<PersonPromiseVo>>(list, HttpStatus.OK);
		}catch(Exception e)	{
			e.printStackTrace();
			entity = new ResponseEntity<List<PersonPromiseVo>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value="/promise_insert", method=RequestMethod.PUT)
	public ResponseEntity<String> insert(@RequestBody PersonPromiseVo personPromiseVo) throws Exception{
		ResponseEntity<String> entity = null;
		try {
			personMinipageService.insertPromise(personPromiseVo);
			entity = new ResponseEntity<String>("success", HttpStatus.OK);
		}catch(Exception e){
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
