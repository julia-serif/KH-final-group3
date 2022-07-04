package com.khie.model;

import java.util.List;

public interface VideoReplyDAO {
	
public int getBoardCount();
	
	public List<VideoReplyDTO> getBoardList(PageDTO dto);
	
	public int insertBoard(VideoReplyDTO dto);
	
	public VideoReplyDTO boardCont(int no);
	
	public int updateBoard(VideoReplyDTO dto);
	
	public int deleteBoard(int no);
	
	public void updateSeq(int no);
	
}
