package com.gocom.service;

import java.util.regex.Pattern;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.gocom.DTO.MemberDTO;
import com.gocom.dao.MemberDAO;


@Service
public class MemberServiceImpl implements MemberService {
@Inject
MemberDAO memberDao;
	@Override
	public String loginCheck(MemberDTO dto, HttpSession session) {
		String name = memberDao.loginCheck( dto );
		if( name != null ) {
			session.setAttribute("userid", dto.getUserid() );
			session.setAttribute("name", name );
		}
		return name;
	}

	@Override
	public void logout(HttpSession session) {
		session.invalidate();		
	}

	@Override
	public int idvalidCheck( String userid ) {
		if( Pattern.matches("^[0-9a-zA-Z]*$" , userid ) ) {
			int result = memberDao.idvalidCheck( userid );
			return result;
			}
		
		 else return 2;
		}
	@Override
	public int namevalidCheck( String username ) {
		if( Pattern.matches("^[0-9a-zA-Z가-힣]*$" , username ) ) {
			int result = memberDao.namevalidCheck( username );
			return result;
			}
		
		 else return 2;
		}

	@Override
	public void registerMember(MemberDTO dto) {
		memberDao.registerMember( dto );
		
	}
}



