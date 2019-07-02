package com.kh.hys.service;

import java.util.List;

import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;

public interface ISelectService_Discussion {
	
	// 토론 주제 추천 게시판 글 리스트 가져오기
	public List<SelectDiscussion_BoardVo> getSelectBoardList(PagingDto pagingDto,int b_addInfo) throws Exception;
	
	// 토론 주제 추천 게시판 글갯수 가져오기
	public int totalSelectBoardCount(int b_addInfo) throws Exception;

}
