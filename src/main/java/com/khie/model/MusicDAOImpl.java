package com.khie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MusicDAOImpl implements MusicDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MusicDTO> selectAll() {
		
		return this.sqlSession.selectList("newAll");
	}

	@Override
	public List<MusicDTO> selectNewMusic(PageDTO pDto) {
		
		return this.sqlSession.selectList("MusicList", pDto);
	}

	@Override
	public List<MusicDTO> selectTop() {
		
		return this.sqlSession.selectList("top10");
	}
	
	@Override
	public int selectTotalCont() {
		
		return this.sqlSession.selectOne("MusicCont");
	}
	
	@Override
	public MusicDTO musicCont(int m_no) {
		
		return this.sqlSession.selectOne("musicCont", m_no);
	
	}


	@Override
	public int insertMusic(MusicDTO dto) {
		
		int no = this.sqlSession.selectOne("selectM_no");
		
		dto.setM_no(no + 1);
		
		return this.sqlSession.insert("addMusic", dto);
	}

	@Override
	public int updateMusic(MusicDTO dto) {
		return this.sqlSession.update("updateMusic", dto);
	}

	@Override
	public int deleteMusic(int m_no) {
		
		return this.sqlSession.delete("deleteMusic", m_no);
	}

	@Override
	public int updateLike(int m_no, int bool) {
		if(bool==0) {
			return this.sqlSession.update("likeUp", m_no);
		} else {
			return this.sqlSession.update("likeDown", m_no);
		}
	}

	@Override
	public void updatePlayCount(int m_no) {
		this.sqlSession.update("playCountUp", m_no);
	}

	@Override
	public int searchMusicCount(String field, String keyword) {
		return this.sqlSession.selectOne("count"+field, keyword);
	}

	@Override
	public List<MusicDTO> searchMusicList(PageDTO pDto) {
		return this.sqlSession.selectList("search"+pDto.getField(), pDto);
	}

	
}
