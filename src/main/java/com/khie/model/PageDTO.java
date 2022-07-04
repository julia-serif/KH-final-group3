package com.khie.model;

import lombok.Data;

@Data
public class PageDTO {
	
	//페이징 처리 변수
	private int page;			//현재 페이지
	private int rowpage;		//한 페이지에서 보여질 게시글 수
	private int totalMusic;		//전체 음원 수
	private int startNo;		//시작 은원 번호
	private int endNo;			//끝 음원 번호
	private int startBlock;		//시작 블럭
	private int endBlock;		//마지막 블럭
	private int totalBlock;		//전제 블럭 수
	private int block = 3;		//아래에 보여질 페이지 블럭 최대 수
	private int user_no;		//회원 번호
	
	//검색 변수
	private String keyword;
	private String field;
	
	//음원이나 동영상 상세 댓글 표시에 쓰기 위한 현재 숫자 변수, setter로 세팅해줘야 함.
	private int no;
	
	public PageDTO() { }
	public PageDTO(int page, int rowPage, int totalMusic) { 
		
		this.page = page;
		this.rowpage = rowPage;
		this.totalMusic = totalMusic;
		
		this.startNo = (page * rowPage)- rowPage + 1;
		this.endNo = (page * rowPage);
		
		this.startBlock = ((page - 1)/this.block)*this.block + 1;		
		this.endBlock = ((page -1)/this.block)*this.block + this.block;
		
		this.totalBlock = (int)Math.ceil(totalMusic/(double)this.rowpage);
		
		if(this.endBlock > this.totalBlock) {
			this.endBlock = this.totalBlock;
		}
			
	} //페이징 처리를 위한 인자 생성자
	
	public PageDTO(int page, int rowsize, int totalMusic, String field, String keyword) {
		this(page, rowsize, totalMusic);
		this.field = field;
		this.keyword = keyword;
	}
	
	public PageDTO(int page, int rowsize, int totalMusic, int user_no) {
		this(page, rowsize, totalMusic);
		this.user_no = user_no;
	} // 내 음악에서 찾기

}
