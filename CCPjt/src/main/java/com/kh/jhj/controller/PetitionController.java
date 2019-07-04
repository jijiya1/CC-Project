package com.kh.jhj.controller;

import java.util.List;

import javax.inject.Inject;
import javax.xml.soap.Detail;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
import com.kh.domain.PagingDto;
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
						Model model, PagingDto pageDto) throws Exception{
		
			if(pageDto.getCountRow() == 5) {
				pageDto.setCountRow(10);
			}
			
			int listCount = peService.listCount(pageDto, a_no);
			pageDto.setTotalData(listCount);

			
//			System.out.println("controller PageDto"+ pageDto);
//			System.out.println("pageDto:" + pageDto);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		
//		System.out.println("listCount :" + listCount);
//		System.out.println("a_no :" + a_no);
//		HashMap<String, String> hashDto = new HashMap<>();

		List<PetitionVo> pList = peService.listAll(pageDto,a_no);
		model.addAttribute("pList", pList);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("count", listCount);
		model.addAttribute("pageDto", pageDto);
	}
	
	@RequestMapping(value="petitionMain", method=RequestMethod.GET)
	public void petitionMain(@RequestParam("a_no") int a_no, Model model,
							PagingDto pageDto) throws Exception{
		List<PetitionVo> pMain = peService.listMain(a_no);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		
		int listCount = peService.listCount(pageDto, a_no);
		pageDto.setTotalData(listCount);
		
		model.addAttribute("pMain", pMain);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("count", listCount);
		model.addAttribute("pageDto", pageDto);
	}
	
	@RequestMapping(value="petitionRead", method=RequestMethod.GET)
	public void petitionRead(@RequestParam("b_no") int b_no, Model model,
							@RequestParam("a_no") int a_no,
							PagingDto pageDto) throws Exception{
//		System.out.println("bno :" + b_no);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		PetitionVo peVo = peService.petitionRead(b_no);
		model.addAttribute("peVo", peVo);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("areaDataVo", areaDataVo);
	}
	
	@RequestMapping(value="petitionDel", method=RequestMethod.GET)
	public String petitionDel(@RequestParam("b_serialno") String b_serialno,
							@RequestParam("a_no") int a_no, RedirectAttributes rttr) throws Exception{
		
		peService.petitionDel(b_serialno);
		
		return "redirect:/petition_board/petitionList?a_no="+a_no;
	}
	
	@RequestMapping(value="petitionRunOut", method=RequestMethod.GET)
	public void petitionRunOut(@RequestParam("a_no") int a_no,
								Model model, PagingDto pageDto) throws Exception{
		List<PetitionVo> pRunOut = peService.listRunOut(a_no);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		model.addAttribute("pRunOut",pRunOut);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("areaDataVo",areaDataVo);
	}
	
	@RequestMapping(value="petitionWrite", method=RequestMethod.GET)
	public void petitionWrite(@RequestParam("a_no") int a_no,
								Model model,
								PagingDto pageDto) throws Exception{
//		System.out.println("a_no : " + a_no);
		List<DetailDataVo> dArea = peService.detailArea(a_no);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("dArea", dArea);
	}

}
