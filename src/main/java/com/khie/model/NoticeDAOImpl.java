package com.khie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO{

	@Autowired
	private SqlSessionTemplate SqlSession;

	@Override
	public void updateSequence(int music_no) {
		
		this.SqlSession.delete("seq", music_no);
		
	}

	@Override
	public List<NoticeDTO> getNoticeList() {
	return this.SqlSession.selectList("all");
	}

	@Override
	public int insertNotice(NoticeDTO dto) {
		
		return this.SqlSession.insert("write", dto);
	}

	@Override
	public NoticeDTO getNotice(int music_no) {

		return this.SqlSession.selectOne("cont", music_no);
	}

	@Override
	public int updateNotice(NoticeDTO dto) {
		
		return this.SqlSession.update("notice_modify", dto);
	}

	@Override
	public int deleteNotice(int music_no) {
		
		return this.SqlSession.delete("delete", music_no);
	}

	@Override
	public void readCount(int music_no) {
		
		this.SqlSession.update("read", music_no);
		
	}
	
	

}
