package com.kh.hys.service;

import java.util.List;

import com.kh.domain.PagingDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;

public interface ISelectService_Discussion {
	
	// 토론 주제 추천 게시판 글 리스트 가져오기
	public List<SelectDiscussion_BoardVo> getSelectBoardList(PagingDto pagingDto,int b_addInfo) throws Exception;
	
	// 토론 주제 추천 게시판 글갯수 가져오기
	public int totalSelectBoardCount(PagingDto pagingDto,int b_addInfo) throws Exception;
	
	// 글 상세보기
	public SelectDiscussion_BoardVo readSelectBoard(int b_no) throws Exception;
	
	// 조회수 증가
	public void addReadCount(int b_no) throws Exception;
	
	// 글 쓰기 
	public void writeSelectBoard(SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception;
	
	// 글 수정 하기 
	public void modifySelectBoard(SelectDiscussion_BoardVo selectDiscussion_BoardVo) throws Exception;
	
	// 글 삭제 하기 (b_checkeddel = 0 -> 1 로 업데이트)
	public void deleteSelectBoard(int b_no) throws Exception;

}
