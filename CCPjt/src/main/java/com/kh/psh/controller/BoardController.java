package com.kh.psh.controller;

import java.util.Iterator;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.psh.domain.Complaint_PaginationDto;
import com.kh.psh.domain.Complaint_PagingDto;
import com.kh.psh.service.IBoardService;

import sun.util.logging.resources.logging;

@Controller
@RequestMapping("/suggest_board/*")
public class BoardController {
	
	@Inject
	private IBoardService boardService;
	
	//글쓰기
	@RequestMapping(value="/suggest_write", method=RequestMethod.GET)
	public void writeGet() throws Exception {
		
	}
	
	
	@RequestMapping(value="/suggest_write",method=RequestMethod.POST)
	public String writePost(Complaint_BoardVo vo) throws Exception {
		boardService.suggest_insert(vo);
					
		return "redirect:/suggest_board/suggest_list";
	}
	
	//글 목록
	@RequestMapping(value="/suggest_list", method=RequestMethod.GET)
	public void suggest_list(Complaint_PagingDto pagingDto, Model model) throws Exception {
		List<Complaint_BoardVo> list = boardService.suggest_list(pagingDto);
		model.addAttribute("list", list);
		Complaint_PaginationDto paginationDto = new Complaint_PaginationDto();
		paginationDto.setPagingDto(pagingDto);
		int count = boardService.listCount(pagingDto);
		paginationDto.setTotalCount(count);
		model.addAttribute("paginationDto", paginationDto);
		
	}
	//글 읽기
	@RequestMapping(value="/suggest_read", method=RequestMethod.GET)
	public void suggest_read(@RequestParam("b_no")int b_no, Model model)throws Exception {
		Complaint_BoardVo vo = boardService.suggest_read(b_no);
		model.addAttribute("vo", vo);
	}
	//글수정 폼
	@RequestMapping(value="/suggest_update", method=RequestMethod.GET)
	public void suggest_update(@RequestParam("b_no")int b_no, Model model) throws Exception {
		Complaint_BoardVo vo = boardService.suggest_read(b_no);
		model.addAttribute("vo", vo);
	}
	//글수정 처리
	@RequestMapping(value="/suggest_update-run", method=RequestMethod.POST)
	public String suggest_updateRun(Complaint_BoardVo vo) throws Exception {
		boardService.suggest_update(vo);
		return "redirect:/suggest_board/suggest_read?b_no=" + vo.getB_no();
	}
	//글삭제
	@RequestMapping(value="/suggest_delete", method=RequestMethod.GET)
	public String suggest_delete(@RequestParam("b_no")int b_no) throws Exception {
		boardService.suggest_delete(b_no);
		return "redirect:/suggest_board/suggest_list";
	}
	
		
}