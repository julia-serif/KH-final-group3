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
		return this.sqlSession.update("image_register", dto);
	}

	@Override
	public List<MusicDTO> getMusiclist(PlaylistDTO dto) {
		return this.sqlSession.selectList("get_musiclist", dto);
	}

	@Override
	public List<MusicDTO> orderMusiclist(PlaylistDTO dto) {
		return this.sqlSession.selectList("order_musiclist", dto);
	}

	@Override
	public void deleteMusiclist(PlaylistDTO dto) {
		this.sqlSession.delete("delete_musiclist", dto);
	}

	@Override
	public List<PlaylistDTO> updatePlaylistCount(PlaylistDTO dto) {
		return this.sqlSession.selectList("playlist_order", dto);
	}
}
