package com.khie.model;


public interface MemberDAO {

	public MemberDTO login(MemberDTO dto) throws Exception;
	
	public void purchase1(int no) throws Exception;
	
	public void purchase2(int no) throws Exception;
	
	public void purchase3(int no) throws Exception;
	
	public void purchase4(int no) throws Exception;
	
	public void purchase5(int no) throws Exception;
}
