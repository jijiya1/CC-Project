package com.kh.sbj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.sbj.domain.PersonPromiseVo;
@Repository
public class PersonMinipageDaoImpl implements IPersonMinipageDao {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<PersonPromiseVo> selectAllPromise(String u_id) throws Exception {
		List<PersonPromiseVo> list = sqlSession.selectList("person_promise.selectAllPromise", u_id);
		System.out.println("DAO LIST = " + list);
		return list;
	}

	@Override
	public void insertPromise(PersonPromiseVo personPromiseVo) throws Exception {
		sqlSession.insert("person_promise.insertPromise", personPromiseVo);
		
	}

}
