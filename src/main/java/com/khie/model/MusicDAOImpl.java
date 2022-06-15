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
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MusicDTO> selectSomeMusic(PageDTO pDto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MusicDTO> selectTop() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int insertMusic(MusicDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateMusic(MusicDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteMusic(int m_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateLike(int m_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void updatePlayCount(int m_no) {
		// TODO Auto-generated method stub

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
