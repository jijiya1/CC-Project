package com.kh.jhj.persistence;

import java.util.List;

import com.kh.jhj.domain.DoSearchDto;
import com.kh.jhj.domain.PetitionVo;

public interface IPeBoardDao {
	public List<PetitionVo> listAll(int b_agree) throws Exception;
	public int listCount(DoSearchDto searchDto) throws Exception;
	public List<PetitionVo> listMain() throws Exception;

}
