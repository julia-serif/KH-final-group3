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
	public void readCount(int QA_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public QandADTO boardCont(int QA_no) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateBoard(QandADTO dto) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteBoard(int QA_no) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void updateSequence(int QA_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int searchBoardCount(String QA_field, String QA_keyword) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<QandADTO> searchBoardList(QA_PageDTO dto) {
		// TODO Auto-generated method stub
		return null;
	}

}