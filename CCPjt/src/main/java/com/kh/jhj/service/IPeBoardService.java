package com.kh.jhj.service;

import java.util.List;

import com.kh.jhj.domain.DoSearchDto;
import com.kh.jhj.domain.PetitionVo;

public interface IPeBoardService {
	public List<PetitionVo> listAll(int a_no) throws Exception;
	public int listCount(DoSearchDto searchDto, int a_no) throws Exception;
	public List<PetitionVo> listMain(int a_no) throws Exception;
	public PetitionVo petitionRead (int b_no) throws Exception;
	public void petitionDel (String b_serialno) throws Exception;
}
