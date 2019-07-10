package com.kh.sbj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.sbj.domain.AccountVo;
import com.kh.sbj.domain.PersonAccountDeleteDto;
import com.kh.sbj.domain.PersonPromiseDeleteDto;
import com.kh.sbj.domain.PersonPromiseVo;
@Repository
public class PersonMinipageDaoImpl implements IPersonMinipageDao {

	@Inject
	private SqlSession sqlSession;
	
	@Override
	public List<PersonPromiseVo> selectAllPromise(String u_email) throws Exception {
		List<PersonPromiseVo> list = sqlSession.selectList("person_promise.selectAllPromise", u_email);
		return list;
	}

	@Override
	public void insertPromise(PersonPromiseVo personPromiseVo) throws Exception {
		sqlSession.insert("person_promise.insertPromise", personPromiseVo);
		
	}

	@Override
	public void updatePromise(PersonPromiseVo personPromiseVo) throws Exception {
		sqlSession.update("person_promise.updatePromise", personPromiseVo);
		
	}

	@Override
	public void deletePromise(PersonPromiseDeleteDto deleteDto) throws Exception {
		sqlSession.delete("person_promise.deletePromise", deleteDto);
		
	}

	@Override
	public List<AccountVo> selectAllAccount(String u_email) throws Exception {
		List<AccountVo> list = sqlSession.selectList("person_promise.selectAllAcc", u_email);
		return list;
	}

	@Override
	public void insertAccount(AccountVo accountVo) throws Exception {
		sqlSession.insert("person_promise.insertAcc", accountVo);
	}

	@Override
	public void deleteAccount(PersonAccountDeleteDto deleteDto) throws Exception {
		sqlSession.delete("person_promise.deleteAcc", deleteDto);
		
	}

}
