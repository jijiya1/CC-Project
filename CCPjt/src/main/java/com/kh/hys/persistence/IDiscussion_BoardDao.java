package com.kh.hys.persistence;

import java.util.List;

import com.kh.hys.domain.Discussion_BoardVo;

public interface IDiscussion_BoardDao {
	
	// 토론 주제 리스트 가져오기
	public List<Discussion_BoardVo> getDiscussionList() throws Exception;
}
