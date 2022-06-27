package com.khie.model;

import lombok.Data;

@Data
public class QandADTO {

	private int QA_no;
    private String QA_writer;
    private String QA_title;
    private String QA_cont;
    private String QA_userID;
    private String QA_date;
    private String QA_update ;
    private int QA_group;
    private int QA_step;
    private int QA_indent;
    
}
