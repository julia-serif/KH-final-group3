package com.khie.model;

import java.util.List;

public interface MyMusicDAO {
	public List<MusicDTO> selectLike(PageDTO dto); // '좋아요' 누른 음악 표시
	public List<MusicDTO> selectRecent(PageDTO dto); // 최근 재생한 음악
	public List<MusicDTO> selectMuch(PageDTO dto); // 많이 재생한 음악
	
	public void clickLike(MyMusicDTO dto); // '좋아요' 클릭 시
	public void updatePlayMusic(MyMusicDTO dto); // 최근 재생 날짜 갱신 및 재생횟수 추가
	public int musicToPlaylist(PlaylistDTO dto); // 음악을 플레이리스트에 추가
	
	public List<PlaylistDTO> getPlaylist(int user_no); // 플레이리스트 목록 조회
	public int addPlaylist(PlaylistDTO dto); // 플레이리스트 추가하기
	public int modifyPlaylist(PlaylistDTO dto); // 플레이리스트 수정하기
	public int deletePlaylist(PlaylistDTO dto); // 플레이리스트 삭제하기
	public void updatePlaylistSequence(PlaylistDTO dto); // 플레이리스트 삭제 후 시퀀스 앞당기기
	public int imageRegister(PlaylistDTO dto); // 이미지로 곡 등록하기

	public List<MusicDTO> getMusiclist(PlaylistDTO dto); // 플레이리스트 보관 음악 조회
	public String getPlaylistName(PlaylistDTO dto); // 플레이리스트 이름 조회
	public List<MusicDTO> orderMusiclist(PlaylistDTO dto); // 플레이리스트 보관 음악 순서 정렬
	public void deleteMusiclist(PlaylistDTO dto); // 플레이리스트 보관 음악 삭제
	public void updateMusiclistSequence(PlaylistDTO dto); // 플레이리스트 보관 음악 삭제 후 시퀀스 앞당기기
	public List<PlaylistDTO> updatePlaylistCount(PlaylistDTO dto); // 플레이리스트 별 음악 수 업데이트
}
