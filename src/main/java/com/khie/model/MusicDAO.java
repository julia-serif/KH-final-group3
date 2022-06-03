package com.khie.model;

import java.util.List;

public interface MusicDAO {

	List<MusicDTO> selectAll();					//전체 목록 조회
	List<MusicDTO> selectMusic();					//전체 목록 조회
	List<MusicDTO> selectTop();					//상위 10개 조회
	int insertMusic(MusicDTO dto);				//새 음악 삽입
	int updateMusic(MusicDTO dto);				//음악 상세 정보 수정
	int deleteMusic(int m_no);					//음악 삭제
	void updateLike(int m_no);					//좋아요 수 수정
	void updatePlayCount(int m_no);				//음원 플레이 수 수정
	
}
