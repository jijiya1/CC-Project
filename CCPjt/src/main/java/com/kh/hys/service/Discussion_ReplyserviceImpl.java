package com.kh.hys.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.hys.domain.Discussion_ReplyVo;
import com.kh.hys.persistence.IDiscussion_ReplyDao;

@Service
public class Discussion_ReplyserviceImpl implements IDiscussion_ReplyService {
	
	@Inject
	IDiscussion_ReplyDao discussion_replyDao;

	@Override
	public List<Discussion_ReplyVo> getDiscussionReply() throws Exception {
		List<Discussion_ReplyVo> discussionReplyList = discussion_replyDao.getDiscussionReply();
		return discussionReplyList;
	}

}
