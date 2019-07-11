package com.kh.hys.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.hys.domain.SelectResInfoDto_Discussion;
import com.kh.hys.service.ISelectService_Discussion;
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/selectDiscussion/*")
public class SelectController_Discussion {
	
	@Inject
	ISelectService_Discussion selectService;
	
	@Inject
	INoticeBoardService noticeBoardService;
	
	// 토론 주제 추천 게시판으로 가기
	@RequestMapping(value = "/discussion_select_board", method=RequestMethod.GET)
	public String discussion_res_board(Model model, @RequestParam("a_no") int a_no, PagingDto pagingDto) throws Exception {
		
//		System.out.println("pagingDto"+ pagingDto);
	
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		int totalBoardCount = selectService.totalSelectBoardCount(pagingDto, a_no);
		pagingDto.setTotalData(totalBoardCount);
		
		List<SelectDiscussion_BoardVo> selectBoardList = selectService.getSelectBoardList(pagingDto ,a_no);
		List<SelectDiscussion_BoardVo> best3List = selectService.getBest3SelectBoard(a_no);
		
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("selectBoardList", selectBoardList);
		model.addAttribute("best3List", best3List);
		model.addAttribute("pagingDto", pagingDto);
		
		SimpleDateFormat mSimpleDateFormat = new SimpleDateFormat ( "yyyy-MM-dd", Locale.KOREA );
		Date currentTime = new Date ();
		String todayTime = mSimpleDateFormat.format ( currentTime );
		
		model.addAttribute("todayTime", todayTime);
		return "/discussion_board/discussion_select_board";
	}
	
	// 토론 주제 추천 게시판 글 상세보기 페이지
	@RequestMapping(value = "/discussion_select_read", method = RequestMethod.GET)
	public String readSelectBoard(Model model, PagingDto pagingDto, @RequestParam("b_no") int b_no, @RequestParam("a_no") int a_no, @RequestParam("u_email") String u_email) throws Exception {
//		System.out.println("readSelectBoard 실행");
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		SelectDiscussion_BoardVo selectDiscussion_BoardVo = selectService.readSelectBoard(b_no);
		model.addAttribute("selectDiscussion_BoardVo", selectDiscussion_BoardVo);
		
		SelectResInfoDto_Discussion selectResInfoDto_Discussion = new SelectResInfoDto_Discussion();
		selectResInfoDto_Discussion.setU_email(u_email);
		selectResInfoDto_Discussion.setB_no(b_no);
		
		// 해당 게시글 추천 수 정보 가져오기
//		System.out.println("selectResInfoDto_Discussion : " + selectResInfoDto_Discussion);
		
		int resCountByEmail = selectService.selectBoardResCountById(selectResInfoDto_Discussion);
		model.addAttribute("resCountByEmail", resCountByEmail);
		return "/discussion_board/discussion_select_read";
	}
	
	// 토론 주제 추천 게시판 글작성 페이지로 가기
	@RequestMapping(value="/discussion_select_write", method=RequestMethod.GET)
	public String selectBoardWriteForm(Model model, @RequestParam("a_no") int a_no) throws Exception {
		
		List<AreaDataVo> areaData = noticeBoardService.getAreaDataList();
		model.addAttribute("areaData", areaData);
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		AreaDataVo getAreaDataANo = noticeBoardService.getAreaDataANo(a_no);
		model.addAttribute("getAreaDataANo", getAreaDataANo);
		
		List<DetailDataVo> getDetailAreaData = noticeBoardService.getDetailAreaData(a_no);
		model.addAttribute("getDetailAreaData", getDetailAreaData);
		
		model.addAttribute("a_no", a_no);
		
		return "/discussion_board/discussion_select_write";
	}
	
	// 토론 주제 추천 게시판 글 작성 실행
	@RequestMapping(value="/discussion_select_write", method = RequestMethod.POST)
	public String selectBoardWrite(@RequestParam("a_no") int a_no, SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception {
		selectService.writeSelectBoard(selectDiscussion_BoardVo);
		
		return "redirect:/selectDiscussion/discussion_select_board?a_no="+a_no;
	}

	
	// 토론 주제 추천 게시판 글 수정 폼 으로 이동
	@RequestMapping(value = "/discussion_select_modify", method = RequestMethod.GET)
	public String selectBoardModifyForm(Model model, PagingDto pagingDto, @RequestParam("a_no") int a_no , @RequestParam("b_no") int b_no) throws Exception {
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		AreaDataVo getAreaDataANo = noticeBoardService.getAreaDataANo(a_no);
		model.addAttribute("getAreaDataANo", getAreaDataANo);
		
		List<DetailDataVo> getDetailAreaData = noticeBoardService.getDetailAreaData(a_no);
		model.addAttribute("getDetailAreaData", getDetailAreaData);
		
		SelectDiscussion_BoardVo selectDiscussion_BoardVo = selectService.readSelectBoard(b_no);
		model.addAttribute("selectDiscussion_BoardVo", selectDiscussion_BoardVo);
		
		model.addAttribute("a_no", a_no);
		
		return "/discussion_board/discussion_select_modify";
	}
	
	// 토론 주제 추천 게시판 글 수정 작업
	@RequestMapping(value = "/discussion_select_modify", method = RequestMethod.POST)
	public String selectBoardModify(Model model, @RequestParam("a_no") int a_no, @RequestParam("b_no") int b_no, @RequestParam("u_email") String u_email
			, PagingDto pagingDto,SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception {
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		AreaDataVo getAreaDataANo = noticeBoardService.getAreaDataANo(a_no);
		model.addAttribute("getAreaDataANo", getAreaDataANo);
		
		List<DetailDataVo> getDetailAreaData = noticeBoardService.getDetailAreaData(a_no);
		model.addAttribute("getDetailAreaData", getDetailAreaData);
		
		model.addAttribute("a_no", a_no);
		
		selectService.modifySelectBoard(selectDiscussion_BoardVo);
		
		selectDiscussion_BoardVo = selectService.readSelectBoard(b_no);
		model.addAttribute("selectDiscussion_BoardVo", selectDiscussion_BoardVo);
		
		SelectResInfoDto_Discussion selectResInfoDto_Discussion = new SelectResInfoDto_Discussion();
		selectResInfoDto_Discussion.setU_email(u_email);
		selectResInfoDto_Discussion.setB_no(b_no);
		
		int resCountByEmail = selectService.selectBoardResCountById(selectResInfoDto_Discussion);
		model.addAttribute("resCountByEmail", resCountByEmail);
		
		return "/discussion_board/discussion_select_read";
	}
	
	// 토론 주제 추천 게시판 글 삭제
	@RequestMapping(value = "/discussion_select_delete", method = RequestMethod.GET)
	public String selectBoardDelete(@RequestParam("a_no") int a_no, @RequestParam("b_no") int b_no) throws Exception {
		selectService.deleteSelectBoard(b_no);
		return "redirect:/selectDiscussion/discussion_select_board?a_no="+a_no;
	}
	
	// 토론 주제 추천 게시글 추천 버튼 작업
	@ResponseBody
	@RequestMapping(value="/selectUpcountUpdate", method = RequestMethod.GET)
	public ResponseEntity<HashMap<String, Integer>> selectUpcountUpdate(SelectResInfoDto_Discussion selectResInfoDto_Discussion)  throws Exception{
		ResponseEntity<HashMap<String, Integer>> entity = null;
//		System.out.println("SelectController_Discussion, selectResInfoDto_Discussion : " + selectResInfoDto_Discussion);
		
		try {
			selectService.insertBoardRes(selectResInfoDto_Discussion);
			
			HashMap<String, Integer> map = new HashMap<>();
			
			int resCountByEmail = selectService.selectBoardResCountById(selectResInfoDto_Discussion);
			int selectBoardUpCount = selectService.getSelectBoardUpCount(selectResInfoDto_Discussion.getB_no());
			
			map.put("resCountByEmail", resCountByEmail);
			map.put("selectBoardUpCount", selectBoardUpCount);
			
			entity = new ResponseEntity<> (map,HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<> (HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	
	// 토론 주제로 선정
	@RequestMapping(value="/seletDiscussion", method = RequestMethod.GET)
	public String seletDiscussion (Model model, @RequestParam("a_no") int a_no, @RequestParam("b_no") int b_no, PagingDto pagingDto)  throws Exception{
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		SelectDiscussion_BoardVo selectDiscussion_BoardVo = selectService.readSelectBoard(b_no);
		selectService.insertSelectDiscussion(selectDiscussion_BoardVo);
		
		int totalBoardCount = selectService.totalSelectBoardCount(pagingDto, a_no);
		pagingDto.setTotalData(totalBoardCount);
		
		List<SelectDiscussion_BoardVo> selectBoardList = selectService.getSelectBoardList(pagingDto ,a_no);
		List<SelectDiscussion_BoardVo> best3List = selectService.getBest3SelectBoard(a_no);
		
		model.addAttribute("areaDataVo", areaDataVo);
		model.addAttribute("selectBoardList", selectBoardList);
		model.addAttribute("best3List", best3List);
		model.addAttribute("pagingDto", pagingDto);
		
		return "redirect:/discussion_board/discussion_main_board?a_no="+a_no;
	}
}
