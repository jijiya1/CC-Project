package com.kh.hys.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.hys.domain.ReplyLikeInfoDto_Discussion;
import com.kh.hys.domain.ReplyPagingDto_Discussion;
import com.kh.hys.domain.ReplyVo_Discussion;
import com.kh.hys.persistence.IReplyDao_Discussion;

@Service
public class ReplyserviceImpl_Discussion implements IReplyService_Discussion {
	
	@Inject
	IReplyDao_Discussion replyDao_Discussion;
	
	// 토론 게시판 댓글 리스트 가져오기
	@Override
	public List<ReplyVo_Discussion> getDiscussionReply(ReplyPagingDto_Discussion replyPagingDto) throws Exception {
		List<ReplyVo_Discussion> discussionReplyList = replyDao_Discussion.getDiscussionReply(replyPagingDto);
		return discussionReplyList;
	}
	
	// 토론 게시판 댓글수
	@Override
	public int getReplyCount(String b_serialno) throws Exception {
		int replyCount = replyDao_Discussion.getReplyCount(b_serialno);
		return replyCount;
	}
	
	// 각 토론별 댓글입력
	@Override
	public void writeReply(ReplyVo_Discussion replyVo_Discussion) throws Exception {
		replyDao_Discussion.writeReply(replyVo_Discussion);
	}
	
	// 댓글에 대해 좋아요 싫어요 추가
	@Transactional
	@Override
	public void replylikeInfoAdd(ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) throws Exception {
		
		int likeExist = replyDao_Discussion.replyLikeInfoExist(replyLikeInfoDto_Discussion);
//		System.out.println("ReplyserviceImpl_Discussion, likeExist : " + likeExist);
//		System.out.println("ReplyserviceImpl_Discussion, replyLikeInfoDto_Discussion : " + replyLikeInfoDto_Discussion);
		
		if(likeExist >= 1) {
			replyDao_Discussion.replyLikeInfoModify(replyLikeInfoDto_Discussion);
		} else {
			replyDao_Discussion.replylikeInfoAdd(replyLikeInfoDto_Discussion);
		}//if
		
		replyDao_Discussion.replyLikeCountModify(replyLikeInfoDto_Discussion.getR_no());
	}
	
	// 댓글에 좋아요 싫어요 값 갱신
	@Override
	public void replyLikeCountModify(int r_no) throws Exception {
		replyDao_Discussion.replyLikeCountModify(r_no);
	}
	
	//특정 댓글에 관하여 좋아여 싫어요 했는지 판단 0 = 안함  1 = 함
	@Override
	public int replyLikeInfoExist(ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) throws Exception {
		int likeExist = replyDao_Discussion.replyLikeInfoExist(replyLikeInfoDto_Discussion);
		return likeExist;
	}
	
	// 유저가 좋아요or싫어요 표시한 정보 가져오기
	@Override
	public List<ReplyLikeInfoDto_Discussion> replyLikeInfoById(String u_email) throws Exception {
		List<ReplyLikeInfoDto_Discussion> replyLikeInfoList = replyDao_Discussion.replyLikeInfoById(u_email);
		return replyLikeInfoList;
	}
	
	// 이미 유저가 해당 댓글에 좋아요 또는 싫어요를 클릭했다면 변경
	@Override
	public void replyLikeInfoModify(ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) throws Exception {
		replyDao_Discussion.replyLikeInfoModify(replyLikeInfoDto_Discussion);
	}
	
	// 댓글에 답글 달기 
	@Transactional
	@Override
	public void replyComentWrite(ReplyVo_Discussion replyVo_Discussion) throws Exception {
		replyDao_Discussion.replyComentWrite(replyVo_Discussion);
		replyDao_Discussion.replyComentCountModify(replyVo_Discussion.getR_no());
	}
	
	// 댓글에 달린 답글 리스트 가져오기
	@Override
	public List<ReplyVo_Discussion> replyComentList(int r_no) throws Exception {
		List<ReplyVo_Discussion> comentList = replyDao_Discussion.replyComentList(r_no);
		return comentList;
	}
	
	// 댓글에 달린 답글 카운트 업데이트
	@Override
	public void replyComentCountModify(int r_no) throws Exception {
		replyDao_Discussion.replyComentCountModify(r_no);
	}

}
