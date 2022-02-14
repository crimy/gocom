package com.gocom.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gocom.DTO.EmojiDTO;
import com.gocom.dao.EmojiDAO;

@Service
public class EmojiServiceImpl implements EmojiService{

@Inject
EmojiDAO emojiDao;

	@Override
	public int react(int con_no, String emo_name, String name, Integer x_pos, Integer y_pos) {
		EmojiDTO dto = new EmojiDTO();
		dto.setCon_no(con_no);
		dto.setEmo_name(emo_name);
		dto.setName(name);
		dto.setX_pos(x_pos);
		dto.setY_pos(y_pos);
		return emojiDao.react(dto);
	}

	@Override
	public List<EmojiDTO> emoView(int con_no) {
		return emojiDao.emoView(con_no);
	}

}
