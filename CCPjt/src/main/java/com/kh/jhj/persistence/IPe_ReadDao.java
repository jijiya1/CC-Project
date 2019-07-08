package com.kh.jhj.persistence;

import java.util.List;

import com.kh.jhj.domain.Pe_AgreeVo;
import com.kh.jhj.domain.Pe_ReplyVo;

public interface IPe_ReadDao {
	
	public int confirmAgree(Pe_AgreeVo peAgreeVo) throws Exception;
	public void addAgree(Pe_AgreeVo peAgreeVo) throws Exception;
	public void addBoardAgree(Pe_AgreeVo peAgreeVo) throws Exception;
	public List<Pe_ReplyVo> listReply(String b_serialno) throws Exception;
	public void writeReply(Pe_ReplyVo peReplyVo) throws Exception;	
}
