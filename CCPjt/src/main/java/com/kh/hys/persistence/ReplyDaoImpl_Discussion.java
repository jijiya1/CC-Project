package com.kh.hys.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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
	public int getReplyCount(ReplyPagingDto_Discussion replyPagingDto) throws Exception {
		int replyCount = sqlSession.selectOne(NAMESPACE+"getReplyCount", replyPagingDto);
		return replyCount;
	}

}
