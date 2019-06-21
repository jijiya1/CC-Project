package com.kh.hys.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hys.domain.Discussion_ReplyVo;

public interface IDiscussion_ReplyService {
	
	// 토론 게시판 댓글 리스트 가져오기
	public List<Discussion_ReplyVo> getDiscussionReply(String b_serialno) throws Exception;
}
