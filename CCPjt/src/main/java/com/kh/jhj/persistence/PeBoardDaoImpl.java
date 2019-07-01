package com.kh.jhj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.jhj.domain.DoSearchDto;
import com.kh.jhj.domain.PetitionVo;

@Repository
public class PeBoardDaoImpl implements IPeBoardDao {

	private static final String NAMESPACE = "petition_board.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<PetitionVo> listAll(int a_no) throws Exception {
		List<PetitionVo> pList = sqlSession.selectList(NAMESPACE+"listAll", a_no);
		return pList;
	}

	@Override
	public int listCount(DoSearchDto searchDto) throws Exception {
		int count = sqlSession.selectOne(NAMESPACE+"listCount");
		return count;
	}

	@Override
	public List<PetitionVo> listMain(int a_no) throws Exception {
		List<PetitionVo> pMain = sqlSession.selectList(NAMESPACE+"listMain", a_no);
		return pMain;
	}

}
