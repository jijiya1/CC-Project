package com.kh.jhj.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
import com.kh.domain.PagingDto;
import com.kh.domain.UserInfoVo;
import com.kh.jhj.domain.PetitionVo;
import com.kh.jhj.service.IPeBoardService;
import com.kh.jhj.service.IPeProgressService;
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/petition_board/*")
public class PetitionController {
	
	@Inject
	IPeBoardService peService;
	
	@Inject
	IPeProgressService peProgressService;
	
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

			SimpleDateFormat form1 = new SimpleDateFormat("yyyy-MM-dd");
			Date time = new Date();
			
			String formTime = form1.format(time);
//			System.out.println("controller formTime :"+ formTime);
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
		model.addAttribute("formTime", formTime);
	}
	
	@RequestMapping(value="petitionMain", method=RequestMethod.GET)
	public void petitionMain(@RequestParam("a_no") int a_no, Model model,
							PagingDto pageDto) throws Exception{
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		peProgressService.prevAgree();
		peProgressService.startAgree();
		peProgressService.ingAgree();
		peProgressService.rouOutAgree();
		String formTime = form1.format(time);
		
		int listCount = peService.listCount(pageDto, a_no);
		List<PetitionVo> pMain = peService.listMain(a_no);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		pageDto.setTotalData(listCount);
		
		model.addAttribute("pMain", pMain);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("count", listCount);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("formTime", formTime);
	}
	
	@RequestMapping(value="petitionRead", method=RequestMethod.GET)
	public void petitionRead(@RequestParam("b_serialno") String b_serialno, Model model,
							@RequestParam("a_no") int a_no,
							PagingDto pageDto) throws Exception{
//		System.out.println("bno :" + b_no);
		peService.readCount(b_serialno);
//		UserInfoVo userVo= (UserInfoVo)session.getAttribute("userVo");
		
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		PetitionVo peVo = peService.petitionRead(b_serialno);
		List<String> links = peService.readLink(b_serialno);
		
		model.addAttribute("peVo", peVo);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("links", links);
//		model.addAttribute("userVo", userVo);
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
		SimpleDateFormat form1 = new SimpleDateFormat("yyyy-MM-dd");
		Date time = new Date();
		
		String formTime = form1.format(time);
		
		if(pageDto.getCountRow() == 5) {
			pageDto.setCountRow(10);
		}
		
		int runOutCount = peService.runOutCount(pageDto, a_no);
		pageDto.setTotalData(runOutCount);
		
		List<PetitionVo> pRunOut = peService.listRunOut(a_no);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		
			
		
		model.addAttribute("pRunOut",pRunOut);
		model.addAttribute("pageDto", pageDto);
		model.addAttribute("areaDataVo",areaDataVo);
		model.addAttribute("count",runOutCount);
		model.addAttribute("formTime",formTime);
	}
	
	@RequestMapping(value="myPetition", method=RequestMethod.GET)
	public void myPetition(@RequestParam("u_id") String u_email,
							@RequestParam("a_no") int a_no,
							Model model, PagingDto pageDto) throws Exception{
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		
		List<PetitionVo> myList = peService.myList(u_email);
//		System.out.println(myList);
		model.addAttribute("myList", myList);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("a_no", a_no);
	}
	
	@RequestMapping(value="petitionWrite", method=RequestMethod.GET)
	public void petitionWrite(@RequestParam("a_no") int a_no,
								Model model) throws Exception{
//		System.out.println("a_no : " + a_no);
		List<DetailDataVo> dArea = peService.detailArea(a_no);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("a_no", a_no);
//		model.addAttribute("pageDto", pageDto);
		model.addAttribute("dArea", dArea);
	}
	
	@RequestMapping(value="petitionWrite", method=RequestMethod.POST)
	public String petitionWriteRun(@RequestParam("a_no") int a_no,
								Model model,HttpSession session,
								PetitionVo peVo) throws Exception{
		
		List<DetailDataVo> dArea = peService.detailArea(a_no);
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		
		UserInfoVo userVo = (UserInfoVo)session.getAttribute("userVo");
		String u_id = userVo.getU_email();
		String b_writer = userVo.getU_name()+"("+ u_id.substring(0,3)+"***)";
		
		peVo.setU_id(u_id);
		peVo.setB_writer(b_writer);
		
		peService.writeUrl(peVo);
		PetitionVo petitinVo = peService.confirm();
//		System.out.println("controller peVo : " + petitinVo);
//		System.out.println("peVo :" + peVo);
		
		model.addAttribute("peVo", petitinVo);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("dArea", dArea);
		model.addAttribute("a_no", a_no);

		return "/petition_board/petitionConfirm";
	}
	

	
	@RequestMapping(value="petitionConfirm", method=RequestMethod.POST)
	public String petitionConfirm(@RequestParam("a_no") int a_no,
								Model model) throws Exception{
		AreaDataVo areaDataVo = noService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("a_no", a_no);
		
		return "redirect:/petition_board/petitionList?a_no="+a_no;
	}

}
