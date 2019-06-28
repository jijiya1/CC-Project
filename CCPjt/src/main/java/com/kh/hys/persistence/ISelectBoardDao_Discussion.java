package com.kh.hys.persistence;

import java.util.List;

import com.kh.hys.domain.LocalDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;

public interface ISelectBoardDao_Discussion {
	// 토론 주제 추천 게시판 글 리스트 가져오기
	public List<SelectDiscussion_BoardVo> getSelectBoardList(LocalDto localDto) throws Exception;
}
