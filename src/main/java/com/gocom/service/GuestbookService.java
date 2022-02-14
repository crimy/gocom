package com.gocom.service;

import java.util.List;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.GuestbookDTO;
import com.gocom.DTO.PagingDTO;

public interface GuestbookService {
	public int write(String ment,String name);
	public List<GuestbookDTO> list(PagingDTO dto);
	public int countgb();
	public int checktoday(String name);
	public List<GuestbookDTO> recent();
}
