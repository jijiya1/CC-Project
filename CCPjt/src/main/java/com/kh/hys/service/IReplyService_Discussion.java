package com.kh.hys.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hys.domain.ReplyPagingDto_Discussion;
import com.kh.hys.domain.ReplyVo_Discussion;

public interface IReplyService_Discussion {
	
	// 토론 게시판 댓글 리스트 가져오기
	public List<ReplyVo_Discussion> getDiscussionReply(ReplyPagingDto_Discussion replyPagingDto) throws Exception;
	
	// 토론 게시판 댓글수
	public int getReplyCount(ReplyPagingDto_Discussion replyPagingDto) throws Exception;
}
