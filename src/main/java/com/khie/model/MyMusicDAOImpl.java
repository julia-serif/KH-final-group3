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
	public List<MusicDTO> selectLike(PageDTO dto) {
		return this.sqlSession.selectList("select_like", dto);
	}

	@Override
	public List<MusicDTO> selectRecent(PageDTO dto) {
		return this.sqlSession.selectList("recent_watch", dto);
	}

	@Override
	public List<MusicDTO> selectMuch(PageDTO dto) {
		return this.sqlSession.selectList("much_watch", dto);
	}

	@Override
	public void clickLike(MyMusicDTO dto) {
		this.sqlSession.update("like", dto);
	}

	@Override
	public void updatePlayMusic(MyMusicDTO dto) {
		this.sqlSession.insert("first_watch", dto);
		this.sqlSession.update("watch_record", dto);
	}

	@Override
	public List<PlaylistDTO> seePlaylist(PlaylistDTO dto) {
		return this.sqlSession.selectList("see_playlist", dto);
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
	public void updatePlaylistSequence(PlaylistDTO dto) {
		this.sqlSession.update("update_p_seq", dto);
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
	public String getPlaylistName(PlaylistDTO dto) {
		return this.sqlSession.selectOne("get_playlist_name", dto);
	}

	@Override
	public int orderMusiclist(PlaylistDTO dto) {
		return this.sqlSession.update("order_musiclist", dto);
	}

	@Override
	public int deleteMusiclist(PlaylistDTO dto) {
		return this.sqlSession.delete("delete_musiclist", dto);
	}

	@Override
	public void updateMusiclistSequence(PlaylistDTO dto) {
		this.sqlSession.update("update_m_seq", dto);
	}

	@Override
	public MyMusicDTO getMyMusicInfo(MyMusicDTO dto) {
		return this.sqlSession.selectOne("my_info", dto);
	}
	
	@Override
	public void deletePlaylistUser(int user_no) {
		this.sqlSession.delete("delete_playlist_user", user_no);
	}
	
	@Override
	public void deleteMusicByUser(int user_no) {
		this.sqlSession.delete("delete_music_by_user", user_no);
	}
}
