package com.khie.model;

import java.util.List;


public interface QandADAO {

public int getQandAListCount();
	
	public List<QandADTO> getQandAList(PageDTO dto);
	
	public int insertQandA(QandADTO dto);
	
	public void readCount(int no);
	
	public BoardDTO boardCont(int no);
	
	public int updateBoard(BoardDTO dto);
	
	public int deleteBoard(int no);
	
	public void updateSequence(int no);
	
	public int searchBoardCount(String field, String keyword);
	
	public List<BoardDTO> searchBoardList(PageDTO dto);
}
