package com.kh.jhj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.jhj.domain.PetitionVo;

@Repository
public class PeBoardDaoImpl implements IPeBoardDao {

	private static final String NAMESPACE = "petition_board.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<PetitionVo> listAll(int b_agree) throws Exception {
		List<PetitionVo> pList = sqlSession.selectList(NAMESPACE+"listAll");
		return pList;
	}

}
