package com.gocom.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.gocom.DTO.BoardDTO;
import com.gocom.dao.BoardDAO;
import com.gocom.dao.MemberDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO boardDao;
	
	@Override
	public int write( String title, String userid ) {
		int con_no = boardDao.write(title,userid);
		return con_no;
		
	}

	@Override
	public List<BoardDTO> list() {
		List<BoardDTO> list = boardDao.list();
		return list;
	}

	@Override
	public BoardDTO boardView(String con_no) {
		BoardDTO dto = boardDao.boardView(con_no); 
		return dto;
	}

}
