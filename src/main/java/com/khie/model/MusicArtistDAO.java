package com.khie.model;

import java.util.List;

public interface MusicArtistDAO {

	public List<MusicArtistDTO> selectArtist(PageDTO pDto);
	public int insertArtist(MusicArtistDTO dto);
	public int updateArtist(MusicArtistDTO dto);
	public int deleteAritst(int m_artist_no);
	public MusicArtistDTO selectContArtist(int m_artist_no);
	public List<MusicArtistDTO> searchArtist(PageDTO pDto);
}
