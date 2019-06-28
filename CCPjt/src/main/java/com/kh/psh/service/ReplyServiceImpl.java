package com.kh.psh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.kh.psh.domain.Complaint_ReplyVo;
import com.kh.psh.persistence.IReplyDao;
@Repository
public class ReplyServiceImpl implements IReplyService {
	
	@Inject
	private IReplyDao replyDao;

	@Override
	public void insert(Complaint_ReplyVo replyVo) throws Exception {
		replyDao.insert(replyVo);

	}

	@Override
	public List<Complaint_ReplyVo> list(int b_no) throws Exception {
		List<Complaint_ReplyVo> list = replyDao.list(b_no);
		return list;
	}

}
