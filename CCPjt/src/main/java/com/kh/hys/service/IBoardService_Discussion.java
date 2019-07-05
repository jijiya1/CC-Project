package com.kh.hys.service;

import java.util.List;

import com.kh.hys.domain.BoardAgreeInfoVo_Discussion;
import com.kh.hys.domain.BoardVo_Discussion;

public interface IBoardService_Discussion {
	// 토론 주제 리스트 가져오기
	public List<BoardVo_Discussion> getDiscussionList(int a_no) throws Exception;
	
	// 특정유저가 토론 게시판 해당글 찬성 또는 반대 첫투표
	public void insertAgreeInfo(BoardAgreeInfoVo_Discussion agreeInfoVo_Discussion) throws Exception;
	
	// 해당 유저가 토론 게시판 해당 글에 찬성 또는 반대 투표 했었는지 판단
	public int AgreeById(BoardAgreeInfoVo_Discussion agreeInfoVo_Discussion) throws Exception;
	
	// 찬성 또는 반대 투표 업데이트
	public void ModifyAgreeInfo(BoardAgreeInfoVo_Discussion agreeInfoVo_Discussion) throws Exception;
	
	// 찬성 또는 반대 투표로 인한 메인 테이블 찬반 카운트 업데이트
	public void BoardAgreeCountModify(int b_no) throws Exception;
	
	//특정 토론글 찬성 반대 갯수 가져오기
	public BoardVo_Discussion getAgreeRatio(int b_no) throws Exception;
	
	//관리자 권한으로 토른 글 삭제 (b_checkeddel = 0 -> 1 로 업데이트)
	public void deleteDiscussionBySerialno(String b_serialno) throws Exception;
}
