package com.kh.hys.service;

import java.util.List;

import com.kh.hys.domain.BoardVo_Discussion;

public interface IBoardService_Discussion {
	// 토론 주제 리스트 가져오기
	public List<BoardVo_Discussion> getDiscussionList() throws Exception;
}
