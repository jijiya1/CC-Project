package com.kh.jhj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.jhj.domain.Pe_AgreeVo;
import com.kh.jhj.domain.Pe_ReplyVo;

@Repository
public class Pe_ReadDaoImpl implements IPe_ReadDao {

	private static final String NAMESPACE = "petition_ajax.";
	
	@Inject
	private SqlSession sqlsession;
	
	@Override
	public int confirmAgree(Pe_AgreeVo peAgreeVo) throws Exception {
		int agree = sqlsession.selectOne(NAMESPACE+"confirmAgree",peAgreeVo);
		return agree;
	}

	@Override
	public void addAgree(Pe_AgreeVo peAgreeVo) throws Exception {
		sqlsession.insert(NAMESPACE+"addAgree",peAgreeVo);
		
	}

	@Override
	public void addBoardAgree(Pe_AgreeVo peAgreeVo) throws Exception {
		sqlsession.update(NAMESPACE+"addBoardAgree",peAgreeVo);
		
	}

	@Override
	public List<Pe_ReplyVo> listReply(String b_serialno) throws Exception {
		List<Pe_ReplyVo> listReply = sqlsession.selectList(NAMESPACE+"listReply", b_serialno);
		return listReply;
	}

	@Override
	public void writeReply(Pe_ReplyVo peReplyVo) throws Exception {
		sqlsession.insert(NAMESPACE+"writeReply", peReplyVo);
		
	}

}
