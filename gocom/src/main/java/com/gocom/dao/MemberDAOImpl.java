package com.gocom.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gocom.DTO.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

@Inject
SqlSession sqlSession;

	@Override
	public String loginCheck(MemberDTO dto) {
		return sqlSession.selectOne("gocomMapper.login_check", dto );
	}
	@Override
	public int idvalidCheck(String userid) {
		return sqlSession.selectOne("gocomMapper.id_valid_check", userid );
	}
	@Override
	public int namevalidCheck(String username) {
		return sqlSession.selectOne("gocomMapper.name_valid_check", username );
	}
	@Override
	public void registerMember(MemberDTO dto) {
		sqlSession.selectOne("gocomMapper.register_member", dto );
		
	}

}
