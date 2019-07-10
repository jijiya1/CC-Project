package com.kh.psh.persistence;

import static org.junit.Assert.*;


import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.psh.domain.Complaint_BoardVo;
import com.kh.psh.domain.Complaint_PagingDto;
import com.kh.sbj.persistence.IUserJoinDao;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})

public class Complaint_BoardDaoImplTest {
	
	@Inject
	private IBoardDao boardDao;
	
	@Inject
	private IUserJoinDao userJoinDao;

	@Test
	public void testInsert() throws Exception {
		Complaint_BoardVo vo = new Complaint_BoardVo();
		vo.setB_serialno("가");
		vo.setB_no(2);
		vo.setB_addinfo("지역2");
		vo.setB_detailinfo("구2");
		vo.setB_title("글제목2");
		vo.setU_name("작성자2");
		vo.setB_content("글내용2");
		boardDao.suggest_insert(vo);
	}

	@Test
	public void testSelect() {
		fail("Not yet implemented");
	}

	@Test
	public void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	public void testDelete() {
		fail("Not yet implemented");
	}
	
	@Test
	public void testUserDul() throws Exception {
		String n="sbj5757@naver.com";
		userJoinDao.duplicateCheck(n);
	}
	
}
