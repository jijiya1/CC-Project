package com.kh.sbj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

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

}
