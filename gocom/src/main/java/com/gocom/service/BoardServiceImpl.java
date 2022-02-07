package com.gocom.service;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

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

}
