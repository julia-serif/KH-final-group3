package com.khie.model;

import lombok.Data;

@Data
public class QandADTO {

	private int qa_no;
	private String qa_writer;
	private String qa_pwd;
	private String qa_title;
	private String qa_cont;  
    private String qa_date;
    private String qa_update;
    private int qa_group;
    private int qa_step;
    private int qa_indent;
    private int qa_hit;
    
}
