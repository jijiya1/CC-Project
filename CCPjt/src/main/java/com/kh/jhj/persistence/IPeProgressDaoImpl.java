package com.kh.jhj.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
@Repository
public class IPeProgressDaoImpl implements IPeProgressDao {

	private static final String NAMESPACE = "petition_progress.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void prevAgree() throws Exception {
		sqlSession.update(NAMESPACE+"prevAgree");

	}

	@Override
	public void startAgree() throws Exception {
		sqlSession.update(NAMESPACE+"startAgree");
	}

	@Override
	public void ingAgree() throws Exception {
		sqlSession.update(NAMESPACE+"ingAgree");
	}

	@Override
	public void rouOutAgree() throws Exception {
		sqlSession.update(NAMESPACE+"rouOutAgree");
	}

}
