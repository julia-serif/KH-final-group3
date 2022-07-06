package com.khie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MusicArtistDAOImpl implements MusicArtistDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MusicArtistDTO> selectArtist(PageDTO pDto) {
		
		return this.sqlSession.selectList("selectArtist", pDto);
	}

	@Override
	public int insertArtist(MusicArtistDTO dto) {
		
		int no = this.sqlSession.selectOne("selectArtistNo");
		
		dto.setM_artist_no(no+1);
		
		System.out.println("artist >>> "+dto);
		
		return this.sqlSession.insert("insertArtist", dto);
	}

	@Override
	public int updateArtist(MusicArtistDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteAritst(int m_artist_no) {
		
		return this.sqlSession.delete("deleteArtist", m_artist_no);
	}

	@Override
	public MusicArtistDTO selectContArtist(int m_artist_no) {
		
		return this.sqlSession.selectOne("selectArtistCont", m_artist_no);
	}

	@Override
	public List<MusicArtistDTO> searchArtist(PageDTO pDto) {
		// TODO Auto-generated method stub
		return null;
	}

}
