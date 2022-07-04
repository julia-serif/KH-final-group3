package com.khie.model;

import lombok.Data;

@Data
public class MusicDTO {
	
	private int m_no;
    private String m_name;
    private String m_cont;
    private String m_album;
    private String m_artist;
    private int m_like;
    private String m_audio;
    private String m_mv;
    private String m_image;
    private int m_pcount;
    private int m_ptime;
    private String m_lyrics;
    private String m_date;
    private String m_update;
    
	private String play_date;
	private int play_counts;

}
