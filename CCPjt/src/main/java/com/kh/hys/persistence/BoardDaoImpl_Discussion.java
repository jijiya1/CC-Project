package com.kh.hys.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.hys.domain.BoardVo_Discussion;

@Repository
public class BoardDaoImpl_Discussion implements IBoardDao_Discussion {
	
	private final String NAMESPACE = "Board_Discussion."; 
	
	@Inject
	private SqlSession sqlSession;
	
	// 토론 게시판 리스트 가져오기
	@Override
	public List<BoardVo_Discussion> getDiscussionList() throws Exception {
		List<BoardVo_Discussion> discussionList = sqlSession.selectList(NAMESPACE+"getDiscussionList");
		
//		System.out.println("Discussion_BoardDaoImpl, getDiscussionList, discussionList : " + discussionList);
		return discussionList;
	}

}
