package com.gocom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.MemberDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int write(String title, String userid) {
		BoardDTO dto = new BoardDTO();
		dto.setTitle( title );
		dto.setUserid( userid );
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
	public BoardDTO boardView(String con_no) {
		sqlSession.update("gocomMapper.boardView2",con_no);
		return sqlSession.selectOne("gocomMapper.boardView",con_no);
	}

}
