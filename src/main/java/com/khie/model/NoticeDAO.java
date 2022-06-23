package com.khie.model;

import java.util.List;


public interface NoticeDAO {

    List<NoticeDTO> getMemberList();
	
	int insertMember(NoticeDTO dto);
	
	NoticeDTO getMember(int num);
	
	int updateMember(NoticeDTO dto);
	
	int deleteMember(int num);
	
	void updateSequence(int num);

}
