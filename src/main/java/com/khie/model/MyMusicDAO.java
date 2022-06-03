package com.khie.model;

import java.util.List;

public interface MyMusicDAO {
	public List<MusicDTO> selectThumbs(String id); // '좋아요' 누른 음악 표시
	public List<MusicDTO> selectRecent(String id); // 최근 재생한 음악
	public List<MusicDTO> selectMuch(String id); // 많이 재생한 음악
	
	public void thumbsUpDown(String id, int no); // '좋아요' 클릭 시
	public void updatePlaydate(String id, int no); // 최근 재생 날짜 갱신
	public void updateCount(String id, int no); // 내가 영상을 재생한 횟수 추가
	public MyMusicDTO musicToPlaylist(String id, int no); // 음악을 플레이리스트에 추가
	
	public List<MyMusicDTO> getPlaylist(String id); // 플레이리스트 목록 조회
	public List<MyMusicDTO> getMusiclist(String id, int playlist_no); // 플레이리스트 보관 음악 조회
	public void playlistOrder(String id); // 플레이리스트 순서 정렬
	public MyMusicDTO addPlaylist(); // 플레이리스트 추가하기
	public void modifyPlaylist(int playlist_no); // 플레이리스트 수정하기
	public void deletePlaylist(int playlist_no); // 플레이리스트 삭제하기
	public void imageRegister(int playlist_no); // 이미지로 곡 등록하기
	
	public void orderMusiclist(int playlist_no); // 플레이리스트 보관 음악 순서 정렬
	public void deleteMusiclist(int playlist_no, int music_no); // 플레이리스트 보관 음악 삭제

}
