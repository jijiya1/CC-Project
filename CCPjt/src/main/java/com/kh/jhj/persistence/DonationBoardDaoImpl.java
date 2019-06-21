package com.kh.jhj.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.jhj.domain.DonationVo;

@Repository
public class DonationBoardDaoImpl implements IDonationBoardDao{

	@Inject
	SqlSession sqlSession;
	
	private static final String NAMESPACE = "donation_board.";

	@Override
	public List<DonationVo> list() throws Exception {
		List<DonationVo> doList = sqlSession.selectList(NAMESPACE+"list");
		return doList;
	}

	@Override
	public DonationVo read(int serialNo) throws Exception {
		DonationVo doVo = sqlSession.selectOne(NAMESPACE+ "read", serialNo);
		return doVo;
	}
	

}
