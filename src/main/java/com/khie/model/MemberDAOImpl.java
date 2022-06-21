package com.khie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public MemberDTO login(MemberDTO dto) throws Exception {
		return sqlSession.selectOne("login", dto);
	}

	@Override
	public void purchase1(int no) throws Exception {
		this.sqlSession.update("pur1", no);
		
	}

	@Override
	public void purchase2(int no) throws Exception {
		this.sqlSession.update("pur2", no);
		
	}

	@Override
	public void purchase3(int no) throws Exception {
		this.sqlSession.update("pur3", no);
		
	}

	@Override
	public void purchase4(int no) throws Exception {
		this.sqlSession.update("pur4", no);
		
	}

	@Override
	public void purchase5(int no) throws Exception {
		this.sqlSession.update("pur5", no);
		
	}

	@Override
	public int updateBoard(MemberDTO dto) {
		
		return this.sqlSession.update("modify", dto);
	}

	@Override
	public List<MemberDTO> getMemberList() {
		
		return this.sqlSession.selectList("all");
	}

	@Override
	public MemberDTO getMember(int user_no) {
		
		return this.sqlSession.selectOne("content", user_no);
	}


}
