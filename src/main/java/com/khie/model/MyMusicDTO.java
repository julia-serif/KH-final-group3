package com.khie.model;

import lombok.Data;

@Data
public class MyMusicDTO {
	private int user_no;
	private int m_no;
	
	private String play_date;
	private String play_thumbs;
	private int play_counts;
	
	private int playlist_no;
	private String playlist_name;

}
