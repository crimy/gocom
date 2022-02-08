package com.gocom.service;

import java.util.List;

import com.gocom.DTO.BoardDTO;

public interface BoardService {
	public int write(String title,String userid);
	public List<BoardDTO> list();
	public BoardDTO boardView(String con_no);
}
