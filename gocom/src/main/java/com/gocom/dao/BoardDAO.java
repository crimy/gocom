package com.gocom.dao;

import java.util.List;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.RecListDTO;
import com.gocom.DTO.WarnListDTO;

public interface BoardDAO {
	public int write(String title, String name);
	public List<BoardDTO> list();
	public BoardDTO boardView(int con_no);
	public int recommend(RecListDTO dto);
	public int warn(WarnListDTO dto);
}
