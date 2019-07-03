package com.kh.jhj.persistence;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.AreaDataVo;
import com.kh.domain.PagingDto;
import com.kh.jhj.domain.DoSearchDto;
import com.kh.jhj.domain.PetitionVo;

@Repository
public class PeBoardDaoImpl implements IPeBoardDao {

	private static final String NAMESPACE = "petition_board.";
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<PetitionVo> listAll(PagingDto pageDto, int a_no) throws Exception {
		AreaDataVo areaDataVo = new AreaDataVo();
			areaDataVo.setA_no(a_no);
		
		HashMap<String, Object> listMap = new HashMap<>();
			listMap.put("areaDataVo", areaDataVo);
			listMap.put("pagingDto", pageDto);
//		System.out.println("Dao pageDto:" + pageDto);
		List<PetitionVo> pList = sqlSession.selectList(NAMESPACE+"listAll", listMap);
		return pList;
	}

	@Override
	public int listCount(PagingDto pageDto, int a_no) throws Exception {
			AreaDataVo areaDataVo = new AreaDataVo();
				areaDataVo.setA_no(a_no);
			
			HashMap<String, Object> countMap = new HashMap<>();
				countMap.put("pagingDto", pageDto);
				countMap.put("areaDataVo", areaDataVo);
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
//		System.out.println("peDao : " +b_serialno);
		sqlSession.update(NAMESPACE + "petitionDel", b_serialno);
		
	}

	@Override
	public List<PetitionVo> listRunOut(int a_no) throws Exception {
		List<PetitionVo> peVo = sqlSession.selectList(NAMESPACE + "listRunOut", a_no);
//		System.out.println("peVo" + peVo);
		return peVo;
	}

}
