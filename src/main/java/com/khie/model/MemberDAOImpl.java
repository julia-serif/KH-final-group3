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
		
		return this.sqlSession.selectList("every");
	}

	@Override
	public MemberDTO getMember(int user_no) {
		
		return this.sqlSession.selectOne("content", user_no);
	}

	@Override
	public int insertMember(MemberDTO dto) {
		
		return this.sqlSession.insert("add", dto);
	}

	@Override
	public int deleteMember(int user_no) {
		
		return this.sqlSession.delete("user_delete",user_no);
	}

	@Override
	public void updateSequence(int user_no) {
		
		this.sqlSession.update("Sequence",user_no);
		
	}

	@Override
	public int updateMypass(int user_no) {
		return this.sqlSession.update("change", user_no);
	}

	@Override
	public int cancelMypass(int user_no) {
		
		return this.sqlSession.update("cancle", user_no);
	}

	@Override
	public int updateMypass2(int user_no) {
		
		return this.sqlSession.update("change2", user_no);
	}

	@Override
	public int updateMypass3(int user_no) {
		
		return this.sqlSession.update("change3", user_no);
	}

	@Override
	public int updateMypass4(int user_no) {
		
		return this.sqlSession.update("change4", user_no);
	}

	@Override
	public int updateMypass5(int user_no) {
		
		return this.sqlSession.update("change5", user_no);
	}


}
