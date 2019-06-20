package com.kh.hys.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.hys.domain.Discussion_ReplyVo;


@Repository
public class Discussion_ReplyDaoImpl implements IDiscussion_ReplyDao {
	
	final String NAMESPACE = "Discussion_Reply.";
	
	@Inject
	SqlSession sqlSession;

	@Override
	public List<Discussion_ReplyVo> getDiscussionReply() throws Exception {
		 List<Discussion_ReplyVo> discussionReplyList = sqlSession.selectList(NAMESPACE+"getDiscussionReplyList");
		return discussionReplyList;
	}

}
