package com.gocom.dao;

import java.util.List;

import com.gocom.DTO.EmojiDTO;

public interface EmojiDAO {

	public int react(EmojiDTO dto);

	public List<EmojiDTO> emoView(int con_no);

}
