package com.kh.psh.service;

import java.util.List;

import com.kh.psh.domain.Complaint_ReplyVo;

public interface IReplyService {
	//댓글쓰기
	public void insert(Complaint_ReplyVo replyVo) throws Exception;
	//댓글 목록
	public List<Complaint_ReplyVo> list(int b_no) throws Exception;
	//댓글 수정
	public void update(Complaint_ReplyVo replyVo) throws Exception;
	//댓글 삭제
	public void delete(int b_no,int r_no) throws Exception;

}
