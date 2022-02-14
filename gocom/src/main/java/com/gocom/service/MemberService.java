package com.gocom.service;

import javax.servlet.http.HttpSession;

import com.gocom.DTO.MemberDTO;

public interface MemberService {
	public boolean loginCheck( MemberDTO dto , HttpSession session );
	public void logout( HttpSession session );
	public int idvalidCheck( String userid );
	public int namevalidCheck( String username );
	public void registerMember( MemberDTO dto );
	public MemberDTO viewMember( MemberDTO dto );

}
