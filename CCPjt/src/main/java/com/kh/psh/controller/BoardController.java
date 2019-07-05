package com.kh.psh.controller;


import java.util.List;

import javax.inject.Inject;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.psh.domain.Complaint_PaginationDto;
import com.kh.psh.domain.Complaint_PagingDto;
import com.kh.psh.service.IBoardService;

@Controller
@RequestMapping("/suggest_board/*")
public class BoardController {
	@Inject
	private IBoardService boardService;
	
	//글쓰기
	@RequestMapping(value="/suggest_write", method=RequestMethod.GET)
	public void writeGet(@RequestParam("a_no")int a_no, Model model) throws Exception {		
		List<AreaDataVo> areaData = boardService.getAreaDataList();
		model.addAttribute("areaData", areaData);
		AreaDataVo areaDataVo = boardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		AreaDataVo getAreaDataANo = boardService.getAreaDataANo(a_no);
		model.addAttribute("getAreaDataANo", getAreaDataANo);
		List<DetailDataVo> getDetailAreaData = boardService.getDetailAreaData(a_no);
		model.addAttribute("getDetailAreaData", getDetailAreaData);
		
		model.addAttribute("a_no", a_no);
	}
		
	@RequestMapping(value="/suggest_write",method=RequestMethod.POST)
	public String writePost(@RequestParam("a_no")int a_no, Complaint_BoardVo vo, Model model) throws Exception {
		boardService.suggest_insert(vo);
		model.addAttribute("a_no", a_no);			
		return "redirect:/suggest_board/suggest_list?a_no="+ a_no;
	}
	
	//글 목록
	@RequestMapping(value="/suggest_list", method=RequestMethod.GET)
	public void suggest_list(@RequestParam("a_no") int a_no, Complaint_PagingDto pagingDto, Model model) throws Exception {
		List<Complaint_BoardVo> suggest_list = boardService.suggest_list(pagingDto, a_no);
		AreaDataVo areaDataVo = boardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("list", suggest_list);
		Complaint_PaginationDto paginationDto = new Complaint_PaginationDto();
		paginationDto.setPagingDto(pagingDto);
		int count = boardService.listCount(pagingDto);
		paginationDto.setTotalCount(count);
		model.addAttribute("paginationDto", paginationDto);
		model.addAttribute("a_no", a_no);
		
	}
	//글 읽기
	@RequestMapping(value="/suggest_read", method=RequestMethod.GET)
	public void suggest_read(@RequestParam("b_no")int b_no, @RequestParam("a_no")int a_no ,Model model)throws Exception {
		Complaint_BoardVo vo = boardService.suggest_read(b_no, a_no);
		model.addAttribute("vo", vo);
		AreaDataVo areaDataVo = boardService.getAreaData(a_no);
		model.addAttribute("areaDataVo",areaDataVo);
		model.addAttribute("a_no", a_no);

	}
	//글수정 폼
	@RequestMapping(value="/suggest_update", method=RequestMethod.GET)
	public void suggest_update(@RequestParam("b_no") int b_no,@RequestParam("a_no")int a_no, Model model) throws Exception {
		Complaint_BoardVo vo = boardService.suggest_read(b_no, a_no);
		model.addAttribute("vo", vo);
		
		List<AreaDataVo> areaData = boardService.getAreaDataList();
		model.addAttribute("areaData", areaData);
		
		AreaDataVo areaDataVo = boardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		List<DetailDataVo> getDetailAreaData = boardService.getDetailAreaData(a_no);
		model.addAttribute("getDetailAreaData", getDetailAreaData);
		
		model.addAttribute("a_no", a_no);
	}
	//글수정 처리
	@RequestMapping(value="/suggest_update-run", method=RequestMethod.POST)
	public String suggest_updateRun(@RequestParam("a_no")int a_no ,Complaint_BoardVo vo) throws Exception {
		boardService.suggest_update(vo);
		return "redirect:/suggest_board/suggest_read?b_no=" + vo.getB_no() + "&a_no=" + a_no;
	}
	//글삭제
	
	@RequestMapping(value="/suggest_delete", method=RequestMethod.GET)
	public String suggest_delete(@RequestParam("b_no")int b_no, @RequestParam("a_no")int a_no, Model model) throws Exception {
		boardService.suggest_delete(b_no, a_no);
		model.addAttribute("a_no", a_no);
		
		AreaDataVo areaDataVo = boardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		return "redirect:/suggest_board/suggest_list?a_no="+ a_no;
	}
	
		
}