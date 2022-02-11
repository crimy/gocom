package com.gocom.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.GuestbookDTO;
import com.gocom.DTO.PagingDTO;
import com.gocom.DTO.RecListDTO;
import com.gocom.DTO.WarnListDTO;
import com.gocom.dao.BoardDAO;
import com.gocom.dao.GuestbookDAO;
import com.gocom.dao.MemberDAO;

@Service
public class GuestbookServiceImpl implements GuestbookService{
@Inject
GuestbookDAO gbDao;
	
	@Override
	public int write( String ment, String name ) {
		return gbDao.write(ment,name);		
	}

	@Override
	public List<GuestbookDTO> list( PagingDTO dto ) {
		
		return gbDao.list(dto);
	}

	@Override
	public int countgb() {		
		return gbDao.countgb();
	}

	@Override
	public int checktoday(String name) {
		return gbDao.checktoday(name);
	}

	@Override
	public List<GuestbookDTO> recent() {
		return gbDao.recent();
	}

}
