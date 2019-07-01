package com.kh.hys.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.hys.domain.LocalDto;
import com.kh.hys.domain.SelectDiscussion_BoardVo;
import com.kh.hys.persistence.ISelectBoardDao_Discussion;

@Service
public class SelectService_Discussion implements ISelectService_Discussion {
	
	@Inject
	ISelectBoardDao_Discussion selectBoardDao;

	@Override
	public List<SelectDiscussion_BoardVo> getSelectBoardList(LocalDto localDto) throws Exception {
		List<SelectDiscussion_BoardVo> selectBoardList = selectBoardDao.getSelectBoardList(localDto);
		return selectBoardList;
	}

}
