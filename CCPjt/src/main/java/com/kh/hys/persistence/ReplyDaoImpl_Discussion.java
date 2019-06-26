package com.kh.hys.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.hys.domain.ReplyLikeInfoDto_Discussion;
import com.kh.hys.domain.ReplyPagingDto_Discussion;
import com.kh.hys.domain.ReplyVo_Discussion;


@Repository
public class ReplyDaoImpl_Discussion implements IReplyDao_Discussion {
	
	final String NAMESPACE = "Reply_Discussion.";
	
	@Inject
	SqlSession sqlSession;
	
	// 토론 게시판 댓글 리스트
	@Override
	public List<ReplyVo_Discussion> getDiscussionReply(ReplyPagingDto_Discussion replyPagingDto) throws Exception {
		 List<ReplyVo_Discussion> discussionReplyList = sqlSession.selectList(NAMESPACE+"getDiscussionReplyList", replyPagingDto);
		return discussionReplyList;
	}
	
	// 토론 게시판 댓글수 
	@Override
	public int getReplyCount(String b_serialno) throws Exception {
		int replyCount = sqlSession.selectOne(NAMESPACE+"getReplyCount", b_serialno);
		return replyCount;
	}
	
	// 각 토론별 댓글입력
	@Override
	public void writeReply(ReplyVo_Discussion replyVo_Discussion) throws Exception {
		sqlSession.insert(NAMESPACE+"writeReply", replyVo_Discussion);
	}
	
	// 댓글에 대해 좋아요 싫어요 추가
	@Override
	public void replylikeInfoAdd(ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) throws Exception {
		sqlSession.insert(NAMESPACE+"replylikeInfoAdd",replyLikeInfoDto_Discussion);
	}
	
	// 댓글에 좋아요 싫어요 값 갱신
	@Override
	public void replyLikeCountModify(int r_no) throws Exception {
		sqlSession.update(NAMESPACE+"replyLikeCountModify", r_no);
	}
	
	//특정 댓글에 관하여 좋아여 싫어요 했는지 판단 0 = 안함  1 = 함
	@Override
	public int replyLikeInfoExist(ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) throws Exception {
		int likeExist = sqlSession.selectOne(NAMESPACE+"replyLikeInfoExist", replyLikeInfoDto_Discussion);
		
		return likeExist;
	}
	
	// 유저가 좋아요or싫어요 표시한 정보 가져오기
	@Override
	public List<ReplyLikeInfoDto_Discussion> replyLikeInfoById(String u_id) throws Exception {
		List<ReplyLikeInfoDto_Discussion> replyLikeInfoList = sqlSession.selectList(NAMESPACE+"replyLikeInfoById", u_id);
		return replyLikeInfoList;
	}
	
	// 이미 유저가 해당 댓글에 좋아요 또는 싫어요를 클릭했다면 변경
	@Override
	public void replyLikeInfoModify(ReplyLikeInfoDto_Discussion replyLikeInfoDto_Discussion) throws Exception {
		sqlSession.update(NAMESPACE+"replyLikeInfoModify", replyLikeInfoDto_Discussion);
	}
	
	// 댓글에 좋아요 또는 싫어요 버튼 취소 기능
	@Override
	public void replyLikeInfoCancel() throws Exception {
		sqlSession.update(NAMESPACE+"replyLikeInfoCancel");
	}

}
