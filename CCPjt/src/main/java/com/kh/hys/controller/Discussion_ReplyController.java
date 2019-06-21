package com.kh.hys.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.hys.domain.Discussion_ReplyPagingDto;
import com.kh.hys.domain.Discussion_ReplyPaginnationDto;
import com.kh.hys.domain.Discussion_ReplyVo;
import com.kh.hys.service.IDiscussion_ReplyService;

@RestController
@RequestMapping("/discussion_reply/*")
public class Discussion_ReplyController {
	
	@Inject
	IDiscussion_ReplyService discussion_ReplyService;
	
	// 토론 메인 게시판 댓글 리스트 가져오기
	@RequestMapping(value="/list/{nowDiscussion_b_serialno}", method = RequestMethod.GET)
	public List<Discussion_ReplyVo> getDiscussionReplyList(@PathVariable("nowDiscussion_b_serialno") String nowDiscussion_b_serialno, 
												Discussion_ReplyPagingDto replyPagingDto) throws Exception {
//		System.out.println("getDiscussionReplyList 실행");		
		
		Discussion_ReplyPaginnationDto replyPaginnationDto = new Discussion_ReplyPaginnationDto();
		replyPaginnationDto.setReplyPagingDto(replyPagingDto);

		List<Discussion_ReplyVo> discussionReplyList = discussion_ReplyService.getDiscussionReply(nowDiscussion_b_serialno);
//		System.out.println("discussionReplyList : " + discussionReplyList);
		
		
		return discussionReplyList;
	}

}
