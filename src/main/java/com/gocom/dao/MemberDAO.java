package com.gocom.dao;

import com.gocom.DTO.MemberDTO;
import com.gocom.DTO.RecListDTO;

public interface MemberDAO {
	public boolean loginCheck( MemberDTO dto );

	public int idvalidCheck( String userid );
	public int namevalidCheck( String username );
	public void registerMember( MemberDTO dto );
	public MemberDTO viewMember( MemberDTO dto );

}
