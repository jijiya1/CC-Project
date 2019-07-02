package com.kh.psh.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.psh.domain.Complaint_ReplyVo;
import com.kh.psh.persistence.IReplyDao;
@Service
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

	@Override
	public void update(Complaint_ReplyVo replyVo) throws Exception {
		replyDao.update(replyVo);
		
	}

	@Override
	public void delete(int b_no, int r_no) throws Exception {
		replyDao.delete(r_no);
		
	}

}
