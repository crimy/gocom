package com.gocom.dao;

import java.util.List;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.GuestbookDTO;
import com.gocom.DTO.PagingDTO;
import com.gocom.DTO.RecListDTO;
import com.gocom.DTO.WarnListDTO;

public interface GuestbookDAO {
	public int write(String ment, String name);	
	public int countgb();
	public List<GuestbookDTO> list(PagingDTO dto);
	public int checktoday(String name);
	public List<GuestbookDTO> recent();
}
