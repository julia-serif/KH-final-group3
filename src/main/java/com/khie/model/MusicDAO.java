package com.khie.model;

import java.util.List;

public interface MusicDAO {

	List<MusicDTO> selectAll();					//전체 목록 조회(최근 추가순으로)
	List<MusicDTO> selectNewMusic(PageDTO pDto);	//전체 목록 조회 중 일부 조회
	List<MusicDTO> selectTop();					//상위 10개 조회
	int selectTotalCont();						// 음원 총 개수 확인
	MusicDTO musicCont(int m_no);				//음악 상세 조회
	int insertMusic(MusicDTO dto);				//새 음악 삽입
	int updateMusic(MusicDTO dto);				//음악 상세 정보 수정
	int deleteMusic(int m_no);					//음악 삭제
	int updateLike(int m_no, int bool);					//좋아요 수 수정
	void updatePlayCount(int m_no);				//음원 플레이 수 수정
	
	int searchMusicCount(String field, String keyword);	//검색으로 표시될 음악의 숫자
	List<MusicDTO> searchMusicList(PageDTO pDto);	//검색 결과 음악들 페이지로 조회
}
