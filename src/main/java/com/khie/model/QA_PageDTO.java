package com.khie.model;

	import lombok.Data;

	// 페이징 처리 작업 시 작업할 내용을 설정하는 객체

	@Data
	public class QA_PageDTO {

		// 페이징 처리 관련 멤버 선언
		private int qa_page;                 // 현재 페이지
		private int qa_rowsize;              // 한 페이지당 보여질 게시물의 수
		private int qa_totalRecord;          // DB 상의 테이블의 전체 레코드 수
		private int qa_startNo;              // 해당 페이지에서 시작 번호
		private int qa_endNo;                // 해당 페이지에서 끝 번호
		private int qa_startBlock;           // 해당 페이지의 시작 블럭
		private int qa_endBlock;             // 해당 페이지의 마지막 블럭
		private int qa_allPage;              // 전체 페이지 수
		private int qa_block = 3;            // 아래에 보여질 페이지 최대 수
		
		// 검색 관련 멤버 선언
		private String qa_field;
		private String qa_keyword;
		
		
		public QA_PageDTO() {    }      // 기본 생성자
		
		// 일반적인 페이징 처리 생성자
		public QA_PageDTO(int page, int rowsize, int totalRecord) {
			this.qa_page = page;
			this.qa_rowsize = rowsize;
			this.qa_totalRecord = totalRecord;
			
			// 해당 페이지에서 시작 번호
			this.qa_startNo = (this.qa_page * this.qa_rowsize) - (this.qa_rowsize - 1);
			
			// 해당 페이지에서 마지막 번호
			this.qa_endNo = (this.qa_page * this.qa_rowsize);
			
			// 해당 페이지에서 시작 블럭
			this.qa_startBlock = 
					(((this.qa_page - 1) / this.qa_block) * this.qa_block) + 1;
			
			// 해당 페이지에서 끝 블럭
			this.qa_endBlock = 
					(((this.qa_page - 1) / this.qa_block) * this.qa_block) + this.qa_block;
			
			// 전체 페이지 수 얻어오는 과정
			this.qa_allPage = (int)Math.ceil(this.qa_totalRecord / (double)this.qa_rowsize);
			
			if(this.qa_endBlock > this.qa_allPage) {
				this.qa_endBlock = this.qa_allPage;
			}
			
		} // 인자 생성자
		
		// 검색 처리  페이징 생성자
		public QA_PageDTO(int qa_page, int qa_rowsize, int qa_totalRecord,
				String qa_field, String qa_keyword) {
			this(qa_page, qa_rowsize, qa_totalRecord);
			this.qa_field = qa_field;
			this.qa_keyword = qa_keyword;
		}
		
	}
