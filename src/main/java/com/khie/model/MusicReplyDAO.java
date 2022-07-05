package com.khie.model;

import java.util.List;

public interface MusicReplyDAO {
	
	public int getBoardCount(int no);
	
	public List<MusicReplyDTO> getBoardList(PageDTO dto);
	
	public int insertBoard(MusicReplyDTO dto);
	
	public int insertMusicReply(MusicReplyDTO dto);
	
	public MusicReplyDTO boardCont(int no);
	
	public int updateBoard(MusicReplyDTO dto);
	
	public int deleteBoard(int mr_no);
	
	public void updateSeq(int no);
	
}
