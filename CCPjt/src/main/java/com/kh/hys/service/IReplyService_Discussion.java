package com.kh.hys.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.hys.domain.ReplyLikeInfoDto_Discussion;
import com.kh.hys.domain.ReplyPagingDto_Discussion;
import com.kh.hys.domain.ReplyVo_Discussion;

public interface IReplyService_Discussion {
	
	// 토론 게시판 댓글 리스트 가져오기
	public List<ReplyVo_Discussion> getDiscussionReply(ReplyPagingDto_Discussion replyPagingDto) throws Exception;
	
	// 토론 게시판 댓글수
	public int getReplyCount(String b_serialno) throws Exception;
	
	// 각 토론별 댓글입력
	public void writeReply(ReplyVo_Discussion replyVo_Discussion) throws Exception;
	
	// 댓글에 대해 좋아요 싫어요 추가
	public void replylikeInfoAdd(ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) throws Exception;
	
	// 댓글에 좋아요 싫어요 값 갱신
	public void replyLikeCountModify(int r_no) throws Exception;
	
	//특정 댓글에 관하여 좋아여 싫어요 했는지 판단 0 = 안함  1 = 함
	public int replyLikeInfoExist(ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) throws Exception;
	
	// 유저가 좋아요or싫어요 표시한 정보 가져오기
	public List<ReplyLikeInfoDto_Discussion> replyLikeInfoById(String u_id) throws Exception;
	
	// 이미 유저가 해당 댓글에 좋아요 또는 싫어요를 클릭했다면 변경
	public void replyLikeInfoModify(ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) throws Exception;
	
	// 댓글에 답글 달기 
	public void replyComentWrite(ReplyVo_Discussion replyVo_Discussion) throws Exception;
	
	// 댓글에 달린 답글 리스트 가져오기
	public List<ReplyVo_Discussion> replyComentList(int r_no) throws Exception;
	
	// 댓글에 달린 답글 카운트 업데이트
	public void replyComentCountModify(int r_no) throws Exception;
	
}
