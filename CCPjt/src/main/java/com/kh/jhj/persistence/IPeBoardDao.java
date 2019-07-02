package com.kh.jhj.persistence;

import java.util.List;

import com.kh.jhj.domain.DoSearchDto;
import com.kh.jhj.domain.PetitionVo;

public interface IPeBoardDao {
	public List<PetitionVo> listAll(int a_no) throws Exception;
	public int listCount(DoSearchDto searchDto, int a_no) throws Exception;
	public List<PetitionVo> listMain(int a_no) throws Exception;
	public PetitionVo petitionRead (int b_no) throws Exception;
	public void petitionDel (String b_serialno) throws Exception;
}
