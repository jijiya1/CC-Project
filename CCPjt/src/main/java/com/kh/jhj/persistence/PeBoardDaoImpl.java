package com.kh.jhj.persistence;

import java.util.HashMap;
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
	public int listCount(DoSearchDto searchDto, int a_no) throws Exception {
		HashMap<String, Object> countMap = new HashMap<>();
		countMap.put("doSearchDto", searchDto);
		countMap.put("a_no", a_no);
		int count = sqlSession.selectOne(NAMESPACE+"listCount", countMap);
		return count;
	}

	@Override
	public List<PetitionVo> listMain(int a_no) throws Exception {
		List<PetitionVo> pMain = sqlSession.selectList(NAMESPACE+"listMain", a_no);
		return pMain;
	}

	@Override
	public PetitionVo petitionRead(int b_no) throws Exception {
		PetitionVo peVo = sqlSession.selectOne(NAMESPACE + "petitionRead", b_no);
		return peVo;
	}

	@Override
	public void petitionDel(String b_serialno) throws Exception {
		System.out.println("peDao : " +b_serialno);
		sqlSession.update(NAMESPACE + "petitionDel", b_serialno);
		
	}

}
