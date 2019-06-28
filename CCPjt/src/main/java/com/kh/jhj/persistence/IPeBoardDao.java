package com.kh.jhj.persistence;

import java.util.List;

import com.kh.jhj.domain.PetitionVo;

public interface IPeBoardDao {
	public List<PetitionVo> listAll(int b_agree) throws Exception;

}
