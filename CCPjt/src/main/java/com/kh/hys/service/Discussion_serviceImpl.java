package com.kh.hys.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.hys.domain.Discussion_BoardVo;
import com.kh.hys.persistence.IDiscussion_BoardDao;

@Service
public class Discussion_serviceImpl implements IDiscussion_BoardService {
	
	@Inject
	IDiscussion_BoardDao discussionBoardDao;

	@Override
	public List<Discussion_BoardVo> getDiscussionList() throws Exception {
		List<Discussion_BoardVo> discussionList = discussionBoardDao.getDiscussionList();
		
		return discussionList;
	}

}
