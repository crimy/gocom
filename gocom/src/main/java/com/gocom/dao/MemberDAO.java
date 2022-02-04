package com.gocom.dao;

import com.gocom.DTO.MemberDTO;

public interface MemberDAO {
	public String loginCheck( MemberDTO dto );

	public int idvalidCheck( String userid );
	public int namevalidCheck( String username );
	public void registerMember( MemberDTO dto );
}