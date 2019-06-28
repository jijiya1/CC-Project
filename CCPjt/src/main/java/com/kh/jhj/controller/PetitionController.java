package com.kh.jhj.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	public void petitionList(Model model, DoPageDto pageDto, DoSearchDto searchDto) throws Exception{
		int b_agree = 0;
		
		int listCount = peService.listCount(searchDto);
		pageDto.setTotalData(listCount);
		System.out.println("listCount :" + listCount);
		HashMap<String, String> hashDto = new HashMap<>();
		String startRow = Integer.toString(pageDto.getStartRow());
		String endRow = Integer.toString(pageDto.getEndRow());
		String serchType = searchDto.getSearchType();
		String searchVal = searchDto.getSearchVal();
		
		hashDto.put("startRow", startRow);
		hashDto.put("endRow", endRow);
		hashDto.put("serchType", serchType);
		hashDto.put("searchVal", searchVal);
		
		List<PetitionVo> pList = peService.listAll(b_agree);
		model.addAttribute("pList", pList);
	}
	
	@RequestMapping(value="petitionMain", method=RequestMethod.GET)
	public void petitionMain(Model model) throws Exception{
		
	}
	

}
