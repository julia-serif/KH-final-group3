package com.khie.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QandADAOImpl implements QandADAO{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int getQandAListCount() {
		
		return this.sqlSession.selectOne("qa_count");
	}

	@Override
	public List<QandADTO> getQandAList(QA_PageDTO dto) {
		
		return this.sqlSession.selectList("qa_list", dto);
	}

	@Override
	public int insertQandA(QandADTO dto) {
		
		return this.sqlSession.insert("qa_add", dto);
	}

	@Override
	public void readCount(int qa_no) {
		
		this.sqlSession.update("qa_read", qa_no);
		
	}

	@Override
	public QandADTO boardCont(int qa_no) {
		
		return this.sqlSession.selectOne("qa_content", qa_no);
	}

	@Override
	public int updateBoard(QandADTO dto) {
		return this.sqlSession.update("qa_modify", dto);
	}

	@Override
	public int deleteBoard(int qa_no) {
		
		return this.sqlSession.delete("qa_delete",qa_no);
	}

	@Override
	public void updateSequence(int qa_no) {
		
		this.sqlSession.update("qa_seq", qa_no);
		
	}

	@Override
	public int searchBoardCount(String qa_field, String qa_keyword) {
		
		return this.sqlSession.selectOne(qa_field, qa_keyword);
	}

	@Override
	public List<QandADTO> searchBoardList(QA_PageDTO dto) {
		
		return this.sqlSession.selectList(dto.getQa_field()+"1",dto);
	}

	@Override
	public void updateSequence2(int qa_no) {
		this.sqlSession.update("qa_seq2", qa_no);
		
	}

	@Override
	public int insertQandA2(QandADTO dto) {
		return this.sqlSession.insert("qa_reply1", dto);
	}

}
