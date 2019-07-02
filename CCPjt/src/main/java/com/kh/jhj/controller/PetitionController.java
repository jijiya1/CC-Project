package com.kh.jhj.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.domain.AreaDataVo;
import com.kh.domain.LocalDto;
import com.kh.jhj.domain.DoPageDto;
import com.kh.jhj.domain.DoSearchDto;
import com.kh.jhj.domain.PetitionVo;
import com.kh.jhj.service.IPeBoardService;
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/petition_board/*")
public class PetitionController {
	
	@Inject
	IPeBoardService peService;
	
	@Inject
	INoticeBoardService noService;
	
	@RequestMapping(value="petitionList", method = RequestMethod.GET)
	public void petitionList(@RequestParam("a_no") int a_no,
						Model model, DoPageDto pageDto, DoSearchDto searchDto) throws Exception{
		
		int listCount = peService.listCount(searchDto, a_no);
			pageDto.setTotalData(listCount);
//			System.out.println("pageDto:" + pageDto);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		areaDataVo.setA_no(a_no);
		
//		System.out.println("listCount :" + listCount);
//		System.out.println("a_no :" + a_no);
//		HashMap<String, String> hashDto = new HashMap<>();

		List<PetitionVo> pList = peService.listAll(a_no);
		model.addAttribute("pList", pList);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("count", listCount);
	}
	
	@RequestMapping(value="petitionMain", method=RequestMethod.GET)
	public void petitionMain(@RequestParam("a_no") int a_no, Model model) throws Exception{
		List<PetitionVo> pMain = peService.listMain(a_no);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		areaDataVo.setA_no(a_no);
		model.addAttribute("pMain", pMain);
		model.addAttribute("areaDataVo", areaDataVo);
	}
	
	@RequestMapping(value="petitionRead", method=RequestMethod.GET)
	public void petitionRead(@RequestParam("b_no") int b_no, Model model,
							@RequestParam("a_no") int a_no) throws Exception{
//		System.out.println("bno :" + b_no);
		AreaDataVo areaDataVo = new AreaDataVo();
		areaDataVo.setA_no(a_no);
		PetitionVo peVo = peService.petitionRead(b_no);
		model.addAttribute("peVo", peVo);
		model.addAttribute("areaDataVo", areaDataVo);
	}
	
	@RequestMapping(value="petitionDel", method=RequestMethod.GET)
	public String petitionDel(@RequestParam("b_serialno") String b_serialno,
							@RequestParam("a_no") int a_no, RedirectAttributes rttr) throws Exception{
		System.out.println("petitionDel : 됩니까" + b_serialno );
		peService.petitionDel(b_serialno);
		AreaDataVo areaDataVo = new AreaDataVo();
		areaDataVo.setA_no(a_no);
		rttr.addAttribute("areaDataVo", areaDataVo);
		return "redirect:/petition_board/petitionList";
	}
	

}
