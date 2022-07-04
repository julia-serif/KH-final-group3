package com.khie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class VideoReplyDAOImpl implements VideoReplyDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getBoardCount() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<VideoReplyDTO> getBoardList(PageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertBoard(VideoReplyDTO dto) {
		return this.sqlSession.insert("video_reply", dto);
	}

	@Override
	public VideoReplyDTO boardCont(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(VideoReplyDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSeq(int no) {
		// TODO Auto-generated method stub
		
	}

}
