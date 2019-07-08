package com.kh.sbj.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.domain.AreaDataVo;
import com.kh.domain.UserInfoVo;
import com.kh.sbj.domain.PersonVo;


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

}
