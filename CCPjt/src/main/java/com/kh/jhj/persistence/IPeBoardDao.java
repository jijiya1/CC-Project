package com.kh.jhj.persistence;

import java.util.List;

import com.kh.domain.DetailDataVo;
import com.kh.domain.PagingDto;
import com.kh.jhj.domain.PetitionVo;

public interface IPeBoardDao {
	public List<PetitionVo> listAll(PagingDto pageDto, int a_no) throws Exception;
	public int listCount(PagingDto pageDto, int a_no) throws Exception;
	public List<PetitionVo> listMain(int a_no) throws Exception;
	public PetitionVo petitionRead (String b_serialno) throws Exception;
	public void petitionDel (String b_serialno) throws Exception;
	public List<PetitionVo> listRunOut(int a_no) throws Exception;
	public List<DetailDataVo> detailArea(int a_no) throws Exception;
	public void write(PetitionVo peVo) throws Exception;
	public void writeLink(String link) throws Exception;
	public int runOutCount(PagingDto pageDto, int a_no) throws Exception;
	public List<String> readLink(String b_serialno) throws Exception;
	public void readCount(String b_serialno) throws Exception;
}
