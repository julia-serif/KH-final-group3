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
		return this.sqlSession.selectOne("count_v_reply", no);
	}

	@Override
	public List<VideoReplyDTO> getVideoReplyList(PageDTO dto) {
		return this.sqlSession.selectList("select_v_reply_list", dto);
	}

	@Override
	public int insertVideoReply(VideoReplyDTO dto) {
		return this.sqlSession.insert("video_reply", dto);
	}
	
	@Override
	public int insertVideoReReply(VideoReplyDTO dto) {
		return this.sqlSession.insert("video_rereply", dto);
	}
	
	@Override
	public int deleteVideoReply(int vr_no) {
		return this.sqlSession.delete("delete_v_reply", vr_no);
	}
	
}
