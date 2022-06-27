package com.khie.model;

import lombok.Data;

@Data
public class PlaylistDTO {
	private int user_no;
	private int m_no;
	private int m_order;
	
	private int playlist_no;
	private String playlist_name;
	private String playlist_thumbnail;
	private int playlist_order;
}
