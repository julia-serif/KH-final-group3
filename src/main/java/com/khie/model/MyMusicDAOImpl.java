package com.khie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyMusicDAOImpl implements MyMusicDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public List<MusicDTO> selectLike(int user_no) {
		return this.sqlSession.selectList("select_like", user_no);
	}

	@Override
	public List<MusicDTO> selectRecent(int user_no) {
		return this.sqlSession.selectList("recent_watch", user_no);
	}

	@Override
	public List<MusicDTO> selectMuch(int user_no) {
		return this.sqlSession.selectList("much_watch", user_no);
	}

	@Override
	public void clickLike(MyMusicDTO dto) {
		this.sqlSession.update("like", dto);
	}

	@Override
	public void updatePlayMusic(MyMusicDTO dto) {
		this.sqlSession.update("watch_record", dto);
	}

	@Override
	public int musicToPlaylist(PlaylistDTO dto) {
		return this.sqlSession.insert("to_playlist", dto);
	}

	@Override
	public List<PlaylistDTO> getPlaylist(int user_no) {
		return this.sqlSession.selectList("select_playlist", user_no);
	}

	@Override
	public List<PlaylistDTO> getPlaylistcount(int user_no) {
		return this.sqlSession.selectList("select_playlistcount", user_no);
	}

	@Override
	public int addPlaylist(PlaylistDTO dto) {
		return this.sqlSession.insert("insert_playlist", dto);
	}

	@Override
	public int modifyPlaylist(PlaylistDTO dto) {
		return this.sqlSession.update("update_playlist", dto);
	}

	@Override
	public int deletePlaylist(PlaylistDTO dto) {
		return this.sqlSession.delete("delete_playlist", dto);
	}

	@Override
	public int imageRegister(PlaylistDTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<PlaylistDTO> getMusiclist(int user_no, int playlist_no) {
		// TODO Auto-generated method stub
		return null;
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
