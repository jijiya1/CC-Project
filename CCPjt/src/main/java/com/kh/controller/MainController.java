package com.kh.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.domain.AreaDataVo;
import com.kh.domain.PagingDto;
import com.kh.hys.domain.BoardVo_Discussion;
import com.kh.hys.service.IBoardService_Discussion;
import com.kh.persistence.IMainDao;
import com.kh.shj.domain.NoSearchDto;
import com.kh.shj.domain.NoticeBoardVo;
import com.kh.shj.service.INoticeBoardService;

@Controller
@RequestMapping("/main/*")
public class MainController {
	
	@Inject
	INoticeBoardService noticeBoardService;
	
	@Inject
	IMainDao mainDao;
	
	@Inject
	IBoardService_Discussion boardService_Discussion;

	@RequestMapping(value="/sub_main", method=RequestMethod.GET)
	public void subMain(
			@RequestParam("a_no") int a_no, 
			PagingDto pagingDto, NoSearchDto noSearchDto,
			Model model
			) throws Exception {
		
		AreaDataVo areaDataVo = noticeBoardService.getAreaData(a_no);
		model.addAttribute("areaDataVo", areaDataVo);
		
		List<NoticeBoardVo> noticeList = mainDao.getSubNoticeBoardList(pagingDto, noSearchDto, a_no);
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
		
		model.addAttribute("a_no", a_no);
		
	}
}
