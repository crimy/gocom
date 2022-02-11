package com.gocom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.GuestbookDTO;
import com.gocom.DTO.MemberDTO;
import com.gocom.DTO.PagingDTO;
import com.gocom.DTO.RecListDTO;
import com.gocom.DTO.WarnListDTO;

@Repository
public class GuestbookDAOImpl implements GuestbookDAO {
	@Inject
	SqlSession sqlSession;
	
	@Override
	public int write(String ment, String name) {
		GuestbookDTO dto = new GuestbookDTO();
		dto.setMent( ment );
		dto.setName( name );
		sqlSession.insert("gocomMapper.writegb", dto );
		int gb_no = dto.getGb_no();
		return gb_no;
	}

	@Override
	public int countgb() {
		return sqlSession.selectOne("gocomMapper.countgb");
	}

	@Override
	public List<GuestbookDTO> list(PagingDTO dto) {
		return sqlSession.selectList("gocomMapper.selectgb",dto);
	}

	@Override
	public int checktoday(String name) {
		return sqlSession.selectOne("gocomMapper.checktoday",name);
	}

	@Override
	public List<GuestbookDTO> recent() {
		return sqlSession.selectList("gocomMapper.recent");
	}

}
