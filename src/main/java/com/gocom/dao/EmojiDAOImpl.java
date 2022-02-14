package com.gocom.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gocom.DTO.EmojiDTO;

@Repository
public class EmojiDAOImpl implements EmojiDAO{

@Inject
SqlSession sqlSession;
	@Override
	public int react(EmojiDTO dto) {
		return sqlSession.insert("gocomMapper.react",dto);
	}
	@Override
	public List<EmojiDTO> emoView(int con_no) {
		return sqlSession.selectList("gocomMapper.emoView",con_no);
	}

}
