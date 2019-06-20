package com.kh.hys.persistence;

import java.util.List;

import com.kh.hys.domain.Discussion_ReplyVo;

public interface IDiscussion_ReplyDao {
	
	// 토론 게시판 댓글 리스트 가져오기
	public List<Discussion_ReplyVo> getDiscussionReply() throws Exception;

}
