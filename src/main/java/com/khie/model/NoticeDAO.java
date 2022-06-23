package com.khie.model;

import java.util.List;


public interface NoticeDAO {

    List<NoticeDTO> getNoticeList();
	
	int insertNotice(NoticeDTO dto);
	
	public void readCount(int music_no);
	
	NoticeDTO getNotice(int music_no);
	
	int updateNotice(NoticeDTO dto);
	
	int deleteNotice(int music_no);
	
	void updateSequence(int music_no);

}
