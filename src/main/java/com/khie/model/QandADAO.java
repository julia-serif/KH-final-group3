package com.khie.model;

import java.util.List;


public interface QandADAO {

public int getQandAListCount();
	
	public List<QandADTO> getQandAList(QA_PageDTO dto);
	
	public int insertQandA(QandADTO dto);
	
	public int insertQandA2(QandADTO dto);
	
	public void readCount(int qa_no);
	
	public QandADTO boardCont(int qa_no);
	
	public int updateBoard(QandADTO  dto);
	
	public int deleteBoard(int qa_no);
	
	public void updateSequence(int qa_no);
	
	public void updateSequence2(int qa_no);
	
	public int searchBoardCount(String qa_field, String qa_keyword);
	
	public List<QandADTO> searchBoardList(QA_PageDTO dto);
}
