package com.kh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.domain.AreaDataVo;
import com.kh.domain.DetailDataVo;
import com.kh.domain.PagingDto;
import com.kh.domain.SearchMemberDto;
import com.kh.domain.UserInfoVo;
import com.kh.hys.domain.BoardVo_Discussion;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.hys.service.IBoardService_Discussion;
import com.kh.hys.service.ISelectService_Discussion;
import com.kh.jhj.domain.PetitionVo;
import com.kh.persistence.IMainDao;
import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.service.IMainService;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Inject
	INoticeBoardService noticeBoardService;
	
	@Inject
	IMainService mainService;
	
	@Inject
	IBoardService_Discussion boardService_Discussion;
	
	@Inject
	ISelectService_Discussion selectService;

	@RequestMapping(value="/sub_main", method=RequestMethod.GET)
	public void subMain(
			@RequestParam("a_no") int a_no, 
			PagingDto pagingDto, NoSearchDto noSearchDto,
			Model model
			) throws Exception {
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		List<NoticeBoardVo> noticeList = mainService.getSubNoticeBoardList(pagingDto, noSearchDto, a_no);
		model.addAttribute("noticeList", noticeList);
		
		List<BoardVo_Discussion> discussionList =  boardService_Discussion.getDiscussionList(a_no);
		model.addAttribute("discussionList", discussionList);
		
		// 리스트 안에 글이 하나라도 있을 경우
		if(discussionList.size() != 0) {
			int discussionListSize = discussionList.size();
			String firstDiscussion_b_serialno =  discussionList.get(0).getB_serialno();
			
			model.addAttribute("discussionListSize", discussionListSize);
			model.addAttribute("firstDiscussion_b_serialno", firstDiscussion_b_serialno);
		}//if
		
		List<SelectDiscussion_BoardVo> selectBoardList = mainService.getSubSelectDiscussionBoardList(pagingDto, a_no);
		model.addAttribute("selectBoardList", selectBoardList);
//		System.out.println("selectBoardList : " + selectBoardList);
		
		List<PetitionVo> getPetitionRankingList = mainService.getPetitionRankingList(a_no);
		model.addAttribute("pMain", getPetitionRankingList);
		
		List<Complaint_BoardVo> getComplaintBoardList = mainService.getComplaintBoardList(pagingDto, a_no);
		model.addAttribute("boardList", getComplaintBoardList);
//		System.out.println("getComplaintBoardList : " + getComplaintBoardList);
		
		String a_name = areaDataVo.getA_name();
//		System.out.println("a_name : " + a_name);
		
		List<UserInfoVo> getMemberList = mainService.getMemberList(a_name);
		model.addAttribute("memberVo", getMemberList);
		
		int getMemberCount = mainService.getMemberCount(a_name);
		model.addAttribute("memberCount", getMemberCount);
//		System.out.println("Control / getMemberCount : " + getMemberCount);
		
		model.addAttribute("a_no", a_no);
		
	}
	
	@RequestMapping(value="/search_all", method=RequestMethod.GET)
	public void searchAll(@RequestParam("a_no") int a_no, NoSearchDto noSearchDto, Model model) throws Exception {
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		String a_name = areaDataVo.getA_name();
		
		List<UserInfoVo> getMemberList = mainService.getMemberList(a_name);
		model.addAttribute("memberVo", getMemberList);
		
		List<UserInfoVo> getSearchMemberList = mainService.getSearchMemberList(noSearchDto);
		model.addAttribute("SearchMemberList", getSearchMemberList);
		
		int getSearchMemberCount = mainService.getSearchMemberCount(noSearchDto);
		model.addAttribute("getSearchMemberCount", getSearchMemberCount);
		
		model.addAttribute("a_no", a_no);
	}
	
	@RequestMapping(value="/member_search_area", method=RequestMethod.GET)
	public void searchArea(Model model) throws Exception {
	}
	
	//선거구 의원찾기
	@RequestMapping(value = "/searchMember/{a_no}/{d_no}", method = RequestMethod.GET)
	public ResponseEntity<UserInfoVo> searchMember(@PathVariable("a_no") int a_no, @PathVariable("d_no") int d_no) throws Exception {
		ResponseEntity<UserInfoVo> entity = null;
		SearchMemberDto searchMemberDto = new SearchMemberDto(a_no, d_no);
		try {
			UserInfoVo memberVo = mainService.searchMember(searchMemberDto);
			entity = new ResponseEntity<UserInfoVo>(memberVo, HttpStatus.OK);
		}catch(Exception e)	{
			e.printStackTrace();
			entity = new ResponseEntity<UserInfoVo>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
}
