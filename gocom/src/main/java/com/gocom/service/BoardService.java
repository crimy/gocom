package com.gocom.service;

import java.util.List;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.PagingDTO;

public interface BoardService {
	public int write(String title,String name);
	public List<BoardDTO> list(PagingDTO dto);
	public BoardDTO boardView(int con_no);
	public int recommend(int con_no, String userid);
	public int warn(int con_no, String userid);
	public int countboard();
	public List<BoardDTO> hotlist();
}
