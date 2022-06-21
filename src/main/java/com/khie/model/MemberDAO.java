package com.khie.model;

import java.util.List;

public interface MemberDAO {

	public MemberDTO login(MemberDTO dto) throws Exception;
	
	public void purchase1(int no) throws Exception;
	
	public void purchase2(int no) throws Exception;
	
	public void purchase3(int no) throws Exception;
	
	public void purchase4(int no) throws Exception;
	
	public void purchase5(int no) throws Exception;
	
	public int updateBoard(MemberDTO dto);
	
	public List<MemberDTO> getMemberList();

	public MemberDTO getMember(int user_no);
}

