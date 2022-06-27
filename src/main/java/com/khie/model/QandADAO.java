package com.khie.model;

import java.util.List;


public interface QandADAO {

public int getQandAListCount();
	
	public List<QandADTO> getQandAList(QA_PageDTO dto);
	
	public int insertQandA(QandADTO dto);
	
	public void readCount(int QA_no);
	
	public QandADTO boardCont(int QA_no);
	
	public int updateBoard(QandADTO  dto);
	
	public int deleteBoard(int QA_no);
	
	public void updateSequence(int QA_no);
	
	public int searchBoardCount(String QA_field, String QA_keyword);
	
	public List<QandADTO> searchBoardList(QA_PageDTO dto);
}
