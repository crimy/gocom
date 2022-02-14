package com.gocom.dao;

import java.util.List;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.PagingDTO;
import com.gocom.DTO.RecListDTO;
import com.gocom.DTO.WarnListDTO;

public interface BoardDAO {
	public int write(String title, String name);	
	public BoardDTO boardView(int con_no);
	public int recommend(RecListDTO dto);
	public int warn(WarnListDTO dto);
	// 게시물 총 갯수
	public int countBoard();
	// 페이징 처리 게시글 조회
	public List<BoardDTO> list(PagingDTO dto);
	public List<BoardDTO> hotlist();
}
