package com.kh.shj.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.shj.domain.NoticeBoardVo;
import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
import com.kh.shj.domain.NoPaginationDto;
import com.kh.shj.domain.NoPagingDto;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/notice_board/*")
public class NoticeController {
	
	@Inject
	INoticeBoardService noticeBoardService;
	
	// 공지사항 리스트
	@RequestMapping(value = "/notice_list", method = RequestMethod.GET)
	public void noticeBoardList(@RequestParam("a_no") int a_no, NoSearchDto noSearchDto, NoPagingDto noPagingDto, Model model) throws Exception {
//		System.out.println("notice_list get 실행함.");
//		System.out.println("noSearchDto : " + noSearchDto);
//		System.out.println("noPagingDto : " + noPagingDto);

		List<NoticeBoardVo> list = noticeBoardService.noticeBoardList(noSearchDto, noPagingDto, a_no);
		model.addAttribute("list", list);
//		System.out.println("list : " + list);
//		System.out.println("a_no : " + a_no);
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		int count = noticeBoardService.noticeBoardCount(noSearchDto);
		model.addAttribute("count", count);
		
		NoPaginationDto noPaginationDto = new NoPaginationDto();
		noPaginationDto.setNoSearchDto(noSearchDto);
		noPaginationDto.setNoPagingDto(noPagingDto);
		
		int contentCount = noticeBoardService.noticeBoardContentCount(noSearchDto, noPagingDto);
		noPaginationDto.setContentCount(contentCount);
		
		model.addAttribute("noPaginationDto", noPaginationDto);
	}
	
	// 공지사항 해당 글 읽기
	@RequestMapping(value="/notice_read", method=RequestMethod.GET)
	public void noticeBoardRead(@RequestParam("b_no") int b_no, @RequestParam("a_no") int a_no, Model model) throws Exception {
//		System.out.println("notice_read get 실행함.");
		NoticeBoardVo noticeBoardVo = noticeBoardService.noticeBoardRead(b_no, a_no);
		model.addAttribute("noticeBoardVo", noticeBoardVo);
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		model.addAttribute("a_no", a_no);
	}
	
	// 공지사항 작성 폼 이동
	@RequestMapping(value="/notice_write", method=RequestMethod.GET)
	public void noticeBoardWrite(@RequestParam("a_no") int a_no, Model model) throws Exception {
//		System.out.println("notice_write get 실행함.");
		List<AreaDataVo> areaData = noticeBoardService.getAreaDataList();
		model.addAttribute("areaData", areaData);
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		AreaDataVo getAreaDataANo = noticeBoardService.getAreaDataANo(a_no);
		model.addAttribute("getAreaDataANo", getAreaDataANo);
		
		List<DetailDataVo> getDetailAreaData = noticeBoardService.getDetailAreaData(a_no);
		model.addAttribute("getDetailAreaData", getDetailAreaData);
		
		model.addAttribute("a_no", a_no);
		
	}
	
	// 공지사항 작성 실행
	@RequestMapping(value="/notice_write", method=RequestMethod.POST)
	public String noticeBoardWrite(@RequestParam("a_no") int a_no, NoticeBoardVo noticeBoardVo, RedirectAttributes rttr, Model model) throws Exception {
//		System.out.println("notice_write post 실행함.");
//		System.out.println("noticeBoardVo : " + noticeBoardVo);
		noticeBoardService.noticeBoardWrite(noticeBoardVo);
		rttr.addFlashAttribute("message", "success_write");
		model.addAttribute("a_no", a_no);
		return "redirect:/notice_board/notice_list?a_no="+ a_no + "&searchType=b_addinfo&keyword=" + a_no;
	}
	
	// 공지사항 글 수정 폼 이동
	@RequestMapping(value="/notice_update", method=RequestMethod.GET)
	public void noticeBoardUpdate(@RequestParam("b_no") int b_no, @RequestParam("a_no") int a_no, Model model) throws Exception {
		NoticeBoardVo noticeBoardVo = noticeBoardService.noticeBoardRead(b_no, a_no);
		model.addAttribute("noticeBoardVo", noticeBoardVo);
	
		List<AreaDataVo> areaData = noticeBoardService.getAreaDataList();
		model.addAttribute("areaData", areaData);
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		List<DetailDataVo> getDetailAreaData = noticeBoardService.getDetailAreaData(a_no);
		model.addAttribute("getDetailAreaData", getDetailAreaData);
		
		model.addAttribute("a_no", a_no);
	}
	
	// 공지사항 글 수정 실행
	@RequestMapping(value="/notice_update", method=RequestMethod.POST)
	public String noticeBoardUpdate(@RequestParam("a_no") int a_no, NoticeBoardVo noticeBoardVo) throws Exception {
//		System.out.println("noticeBoardVo : " + noticeBoardVo);
		noticeBoardService.noticeBoardUpdate(noticeBoardVo);
		return "redirect:/notice_board/notice_read?b_no=" + noticeBoardVo.getB_no() + "&a_no=" + a_no;
	}
	
	// 공지사항 글 삭제 폼 이동
	@RequestMapping(value="/notice_delete", method=RequestMethod.GET)
	public void noticeBoardDelete(@RequestParam("b_no") int b_no, @RequestParam("a_no") int a_no, Model model) throws Exception {
		NoticeBoardVo noticeBoardVo = noticeBoardService.noticeBoardRead(b_no, a_no);
		model.addAttribute("noticeBoardVo", noticeBoardVo);
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		model.addAttribute("a_no", a_no);
	}
	
	// 공지사항 글 삭제 실행
	@RequestMapping(value="/notice_delete_action", method=RequestMethod.POST)
	public String noticeBoardDelete(@RequestParam("b_no") int b_no, @RequestParam("a_no") int a_no, Model model, RedirectAttributes rttr) throws Exception {
		noticeBoardService.noticeBoardDelete(b_no, a_no);
		model.addAttribute("a_no", a_no);
		rttr.addFlashAttribute("message", "success_delete");
		return "redirect:/notice_board/notice_list?a_no="+ a_no + "&searchType=b_addinfo&keyword=" + a_no;
	}
	
	// 공지사항 지역별 폼 이동
	@RequestMapping(value="/notice_location", method=RequestMethod.GET)
	public void noticeBoardLocation() throws Exception {
		
	}
	
}
