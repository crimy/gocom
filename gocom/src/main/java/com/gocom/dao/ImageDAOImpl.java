package com.gocom.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.gocom.DTO.ImageDTO;

@Repository
public class ImageDAOImpl implements ImageDAO {

@Inject
SqlSession sqlSession;

	@Override
	public int upload(List<String> fsnlist, int con_no) {	
		for(String fsn : fsnlist ) {
			ImageDTO dto = new ImageDTO();
			dto.setFsn(fsn);
			dto.setCon_no(con_no);
			sqlSession.insert("gocomMapper.upload", dto);
		}
		return fsnlist.size();
		
	}

	@Override
	public List<ImageDTO> imageView(String con_no) {
		return sqlSession.selectList("gocomMapper.imageView",con_no);
	}

}
