package com.kh.jhj.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.jhj.domain.Pe_AgreeVo;
import com.kh.jhj.domain.Pe_ReplyVo;
import com.kh.jhj.persistence.IPe_ReadDao;

@Service
public class Pe_ReadServiceImpl implements IPe_ReadService{

	@Inject
	private IPe_ReadDao pe_readDao;
	
	@Override
	public int confirmAgree(Pe_AgreeVo peAgreeVo) throws Exception {
		int agree = pe_readDao.confirmAgree(peAgreeVo);
		return agree;
	}

	@Transactional
	@Override
	public void addAgree(Pe_AgreeVo peAgreeVo) throws Exception {
		pe_readDao.addAgree(peAgreeVo);
		pe_readDao.addBoardAgree(peAgreeVo);
		
	}

	@Override
	public List<Pe_ReplyVo> listReply(String b_serialno) throws Exception {
		List<Pe_ReplyVo> listReply = pe_readDao.listReply(b_serialno);
		return listReply;
	}

	@Override
	public void writeReply(Pe_ReplyVo peReplyVo) throws Exception {
		pe_readDao.writeReply(peReplyVo);
	}

}
