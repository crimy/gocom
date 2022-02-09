package com.gocom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.MemberDTO;
import com.gocom.DTO.RecListDTO;
import com.gocom.DTO.WarnListDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int write(String title, String name) {
		BoardDTO dto = new BoardDTO();
		dto.setTitle( title );
		dto.setName( name );
		sqlSession.insert("gocomMapper.write", dto );
		int con_no = dto.getCon_no();
		return con_no;
	}

	@Override
	public List<BoardDTO> list() {
		List<BoardDTO> list = sqlSession.selectList("gocomMapper.list");
		return list;
	}

	@Override
	public BoardDTO boardView(int con_no) {
		sqlSession.update("gocomMapper.boardView2",con_no);
		return sqlSession.selectOne("gocomMapper.boardView",con_no);
	}

	@Override
	@Transactional
	public int recommend(RecListDTO dto) {	
		sqlSession.update("gocomMapper.recommend",dto.getCon_no());	
		return sqlSession.insert("gocomMapper.recBoard", dto );
	}

	@Override
	@Transactional
	public int warn(WarnListDTO dto) {
		sqlSession.update("gocomMapper.warn",dto.getCon_no());	
		return sqlSession.insert("gocomMapper.warnBoard", dto );
	}

}
