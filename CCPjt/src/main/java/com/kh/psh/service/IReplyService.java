package com.kh.psh.service;

import java.util.List;

import com.kh.psh.domain.Complaint_ReplyVo;

public interface IReplyService {
	public void insert(Complaint_ReplyVo replyVo) throws Exception;
	public List<Complaint_ReplyVo> list(int b_no) throws Exception;

}
