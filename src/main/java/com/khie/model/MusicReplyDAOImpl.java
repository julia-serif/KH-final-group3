package com.khie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MusicReplyDAOImpl implements MusicReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getBoardCount(int no) {
		return this.sqlSession.selectOne("count", no);
	}

	@Override
	public List<MusicReplyDTO> getBoardList(PageDTO dto) {
		return this.sqlSession.selectList("musicReplyList", dto);
	}

	@Override
	public int insertBoard(MusicReplyDTO dto) {
		return this.sqlSession.insert("music_reply", dto);
	}

	@Override
	public MusicReplyDTO boardCont(int no) {
		return null;
	}

	@Override
	public int updateBoard(MusicReplyDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int mr_no) {
		return this.sqlSession.delete("musicReplyDel", mr_no);
	}

	@Override
	public void updateSeq(int no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int insertMusicReply(MusicReplyDTO dto) {
		
		return this.sqlSession.insert("MusicReplyInsert", dto);
	}

}
