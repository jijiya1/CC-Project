package com.kh.sbj.persistence;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.domain.AreaDataVo;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.domain.AssemblyVo;


@Repository
public class PersonDaoImpl implements IPersonDao {


	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<UserInfoVo> selectAll(String a_name) throws Exception {
		List<UserInfoVo> list = sqlSession.selectList("person.selectAll", a_name);
		return list;
	}

	@Override
	public UserInfoVo selectPerson(String u_id) throws Exception {
		UserInfoVo userInfoVo = sqlSession.selectOne("person.selectPerson", u_id);
		return userInfoVo;
	}

	@Override
	public AreaDataVo selectArea(int a_no) throws Exception {
		AreaDataVo areaDataVo = sqlSession.selectOne("person.selectArea", a_no);
		return areaDataVo;
	}
	
	@Transactional
	@Override
	public List<AssemblyVo> selectAssemList(String u_email) throws Exception {
		List<Integer> noList = sqlSession.selectList("person.selectAssemNo", u_email);
		List<AssemblyVo> list = new ArrayList<>();
		List<AssemblyVo> list2 = new ArrayList<>();
		
		for(int i : noList) {
			AssemblyVo assemVo = sqlSession.selectOne("person.selectAssemList", i);
			list.add(assemVo);
		}
		
		for(int i=0 ; i<list.size(); i++) {
			if(!list2.contains(list.get(i))) {
				list2.add(list.get(i));
			}
		}
		return list2;
	}

	@Override
	public String selectElection(int electionCnt) throws Exception {
		String election_name = sqlSession.selectOne("person.selectElection", electionCnt);
		return election_name;
	}

}
