package com.gocom.dao;

import java.util.List;

import com.gocom.DTO.BoardDTO;

public interface BoardDAO {
	public int write(String title, String userid);
	public List<BoardDTO> list();
	public BoardDTO boardView(String con_no);
}
