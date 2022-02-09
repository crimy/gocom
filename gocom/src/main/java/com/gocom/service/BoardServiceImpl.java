package com.gocom.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.RecListDTO;
import com.gocom.DTO.WarnListDTO;
import com.gocom.dao.BoardDAO;
import com.gocom.dao.MemberDAO;

@Service
public class BoardServiceImpl implements BoardService{
	@Inject
	BoardDAO boardDao;
	
	@Override
	public int write( String title, String name ) {
		int con_no = boardDao.write(title,name);
		return con_no;
		
	}

	@Override
	public List<BoardDTO> list() {
		List<BoardDTO> list = boardDao.list();
		return list;
	}

	@Override
	public BoardDTO boardView(int con_no) {
		BoardDTO dto = boardDao.boardView(con_no); 
		return dto;
	}

	@Override
	public int recommend(int con_no, String userid) {
		RecListDTO dto = new RecListDTO( userid, con_no );
		return boardDao.recommend(dto);
	}

	@Override
	public int warn(int con_no, String userid) {
		WarnListDTO dto = new WarnListDTO( userid, con_no);
		return boardDao.warn(dto);
	}

}
