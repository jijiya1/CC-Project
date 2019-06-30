package com.kh.psh.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.psh.domain.Complaint_ReplyVo;
@Repository
public class ReplyDaoImpl implements IReplyDao {
	private static final String NAMESPACE = "reply";
	
	@Inject
	private SqlSession sqlSession;
	@Override
	public void insert(Complaint_ReplyVo replyVo) throws Exception {
		sqlSession.insert(NAMESPACE + ".insert", replyVo);

	}
	@Override
	public List<Complaint_ReplyVo> list(int b_no) throws Exception {
		List<Complaint_ReplyVo> list = sqlSession.selectList(NAMESPACE + ".list", b_no);
		return list;
	}

}
