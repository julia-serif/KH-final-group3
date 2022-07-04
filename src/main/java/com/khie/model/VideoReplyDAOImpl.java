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
	public int getRecordCount(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<VideoReplyDTO> getVideoReplyList(PageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertVideoReply(VideoReplyDTO dto) {
		return this.sqlSession.insert("video_reply", dto);
	}

	@Override
	public VideoReplyDTO videoReplyCont(int no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateVideoReply(VideoReplyDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteVideoReply(int no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSeq(int no) {
		// TODO Auto-generated method stub
		
	}
	
}
