package com.kh.hys.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.kh.hys.domain.ReplyPagingDto_Discussion;
import com.kh.hys.domain.ReplyPaginnationDto_Discussion;
import com.kh.hys.domain.ReplyVo_Discussion;
import com.kh.hys.service.IReplyService_Discussion;

@RestController
@RequestMapping("/discussion_reply/*")
public class ReplyController_Discussion {
	
	@Inject
	IReplyService_Discussion discussion_ReplyService;
	
	// 토론 메인 게시판 댓글 리스트 가져오기
	@RequestMapping(value="/list/{nowDiscussion_b_serialno}/{nowReplyPage}", method = RequestMethod.GET)
	public List<ReplyVo_Discussion> getDiscussionReplyList(@PathVariable("nowDiscussion_b_serialno") String nowDiscussion_b_serialno,
															@PathVariable("nowReplyPage") int nowReplyPage,
															ReplyPagingDto_Discussion replyPagingDto) throws Exception {
//		System.out.println("getDiscussionReplyList 실행");	

		// 현재 불러오려는 글의 시리얼 넘버 담기
		replyPagingDto.setB_serialno(nowDiscussion_b_serialno);
		
		// 페이징 하려는 번호 담기
		replyPagingDto.setNowReplyPage(nowReplyPage);
		
		// 댓글 총 갯수 정보 담기
		int replyCount = discussion_ReplyService.getReplyCount(replyPagingDto);
		System.out.println("getDiscussionReplyList, replyCount:" + replyCount);
		
		System.out.println("ReplyController_Discussion, getDiscussionReplyList replyPagingDto : " + replyPagingDto);
		
		List<ReplyVo_Discussion> discussionReplyList = discussion_ReplyService.getDiscussionReply(replyPagingDto);
//		discussionReplyList.add(discussionReplyList.size(), );
//		System.out.println("discussionReplyList : " + discussionReplyList);
		
		return discussionReplyList;
	}

}
