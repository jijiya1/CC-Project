package com.kh.hys.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.hys.domain.ReplyPagingDto_Discussion;
import com.kh.hys.domain.ReplyVo_Discussion;
import com.kh.hys.persistence.IReplyDao_Discussion;

@Service
public class ReplyserviceImpl_Discussion implements IReplyService_Discussion {
	
	@Inject
	IReplyDao_Discussion discussion_replyDao;

	@Override
	public List<ReplyVo_Discussion> getDiscussionReply(ReplyPagingDto_Discussion replyPagingDto) throws Exception {
		List<ReplyVo_Discussion> discussionReplyList = discussion_replyDao.getDiscussionReply(replyPagingDto);
		return discussionReplyList;
	}

	@Override
	public int getReplyCount(ReplyPagingDto_Discussion replyPagingDto) throws Exception {
		int replyCount = discussion_replyDao.getReplyCount(replyPagingDto);
		return replyCount;
	}

}
