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
		// TODO Auto-generated method stub
		
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
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteNotice(int music_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void readCount(int music_no) {
		
		this.SqlSession.update("read", music_no);
		
	}
	
	

}
