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
	
	public int updateMypass(int user_no);
	
	public int updateMypass2(int user_no);
	
	public int updateMypass3(int user_no);
	
	public int updateMypass4(int user_no);
	
	public int updateMypass5(int user_no);
	
	public int cancelMypass(int user_no);
	
	public List<MemberDTO> getMemberList();

	public MemberDTO getMember(int user_no);
	
	public int insertMember(MemberDTO dto);

    int deleteMember(int user_no);
	
	void updateSequence(int user_no);
}

