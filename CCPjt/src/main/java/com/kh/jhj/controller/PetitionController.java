package com.kh.jhj.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.domain.AreaDataVo;
import com.kh.jhj.domain.DoPageDto;
import com.kh.jhj.domain.DoSearchDto;
import com.kh.jhj.domain.PetitionVo;
import com.kh.jhj.service.IPeBoardService;

@Controller
@RequestMapping("/petition_board/*")
public class PetitionController {
	
	@Inject
	IPeBoardService peService;
	
	@RequestMapping(value="petitionList", method = RequestMethod.GET)
	public void petitionList(@RequestParam("a_no") int a_no,
						Model model, DoPageDto pageDto, DoSearchDto searchDto) throws Exception{
		int b_agree = 0;
		
		int listCount = peService.listCount(searchDto);
			pageDto.setTotalData(listCount);
		AreaDataVo areaVo = new AreaDataVo();
			areaVo.setA_no(a_no);
		
		System.out.println("listCount :" + listCount);
//		System.out.println("a_no :" + a_no);
		
//		HashMap<String, String> hashDto = new HashMap<>();

		List<PetitionVo> pList = peService.listAll(a_no);
		model.addAttribute("pList", pList);
		model.addAttribute("areaVo", areaVo);
	}
	
	@RequestMapping(value="petitionMain", method=RequestMethod.GET)
	public void petitionMain(@RequestParam("a_no") int a_no, Model model) throws Exception{
		List<PetitionVo> pMain = peService.listMain(a_no);
		AreaDataVo areaVo = new AreaDataVo();
		areaVo.setA_no(a_no);
		model.addAttribute("pMain", pMain);
		model.addAttribute("areaVo", areaVo);
	}
	

}
