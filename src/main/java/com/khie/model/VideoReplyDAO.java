package com.khie.model;

import java.util.List;

public interface VideoReplyDAO {
	
	public int getRecordCount(int no);	//no에 해당하는 동영상에 달린 댓글들의 수를 확인하는 메서드
	
	public List<VideoReplyDTO> getVideoReplyList(PageDTO dto);	//특정 동영상의 페이지에 해당하는 동영상 댓글들을 가져오는 메서드
	
	public int insertVideoReply(VideoReplyDTO dto);
	
	public VideoReplyDTO videoReplyCont(int no);
	
	public int updateVideoReply(VideoReplyDTO dto);
	
	public int deleteVideoReply(int vr_no);	//vr_no에 해당하는 레코드를 삭제하는 메서드
	
	public void updateSeq(int no);
	
}
