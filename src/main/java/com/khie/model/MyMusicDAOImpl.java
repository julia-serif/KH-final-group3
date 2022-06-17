package com.khie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MyMusicDAOImpl implements MyMusicDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MusicDTO> selectLike(int user_no) {
		return this.sqlSession.selectList("select_Like", user_no);
	}

	@Override
	public List<MusicDTO> selectRecent(int user_no) {
		return this.sqlSession.selectList("recent_Watch", user_no);
	}

	@Override
	public List<MusicDTO> selectMuch(int user_no) {
		return this.sqlSession.selectList("much_Watch", user_no);
	}

	@Override
	public void clickLike(MyMusicDTO dto) {
		this.sqlSession.update("like", dto);
	}

	@Override
	public void updatePlayMusic(MyMusicDTO dto) {
		this.sqlSession.update("updateWatch", dto);
	}

	@Override
	public MyMusicDTO musicToPlaylist(MyMusicDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaylistDTO> getPlaylist(int user_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaylistDTO> getMusiclist(int user_no, int playlist_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void playlistOrder(int user_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public MyMusicDTO addPlaylist() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void modifyPlaylist(int playlist_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deletePlaylist(int playlist_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void imageRegister(int playlist_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void orderMusiclist(int playlist_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void deleteMusiclist(int playlist_no, int music_no) {
		// TODO Auto-generated method stub

	}

}
