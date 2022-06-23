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
	public List<NoticeDTO> getMemberList() {
		return this.SqlSession.selectList("all");
	}

	@Override
	public int insertMember(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public NoticeDTO getMember(int num) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateMember(NoticeDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMember(int num) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSequence(int num) {
		// TODO Auto-generated method stub
		
	}
	
	

}
