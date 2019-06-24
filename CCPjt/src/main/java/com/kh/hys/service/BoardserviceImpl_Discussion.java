package com.kh.hys.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.hys.domain.BoardVo_Discussion;
import com.kh.hys.persistence.IBoardDao_Discussion;

@Service
public class BoardserviceImpl_Discussion implements IBoardService_Discussion {
	
	@Inject
	IBoardDao_Discussion discussionBoardDao;

	@Override
	public List<BoardVo_Discussion> getDiscussionList() throws Exception {
		List<BoardVo_Discussion> discussionList = discussionBoardDao.getDiscussionList();
		
//		System.out.println("Discussion_serviceImpl, getDiscussionList, discussionList : " + discussionList);
		
		return discussionList;
	}

}
