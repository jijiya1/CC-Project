package com.kh.psh.persistence;

import static org.junit.Assert.*;

import javax.inject.Inject;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kh.psh.domain.Complaint_ReplyVo;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*.xml"})
public class ReplyDaoImplTest {
	
	@Inject
	private IReplyDao replyDao;

	@Test
	public void testInsert() throws Exception {
		Complaint_ReplyVo vo = new Complaint_ReplyVo();
		vo.setB_serialno("2");
		vo.setR_no(2);
		vo.setR_content("댓글내용2");
		vo.setR_writer("작성자2");
		replyDao.insert(vo);

	}

	@Test
	public void testList() {
		
	}

}
