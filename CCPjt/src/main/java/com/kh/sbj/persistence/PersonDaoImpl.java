package com.kh.sbj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.AreaDataVo;
import com.kh.sbj.domain.PersonVo;


@Repository
public class PersonDaoImpl implements IPersonDao {


	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<PersonVo> selectAll() throws Exception {
		List<PersonVo> list = sqlSession.selectList("person.selectAll");
		return list;
	}

	@Override
	public PersonVo selectPerson(String u_id) throws Exception {
		PersonVo personVo = sqlSession.selectOne("person.selectPerson", u_id);
		return personVo;
	}

	@Override
	public AreaDataVo selectArea(int a_no) throws Exception {
		AreaDataVo areaDataVo = sqlSession.selectOne("person.selectArea", a_no);
		return areaDataVo;
	}

}
