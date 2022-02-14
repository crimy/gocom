package com.gocom.dao;

import java.util.List;

import java.util.Map;

import com.gocom.DTO.EmojiDTO;
import com.gocom.DTO.EmostaticDTO;

public interface EmojiDAO {

	public int react(EmojiDTO dto);

	public List<EmojiDTO> emoView(int con_no);

	public List<EmostaticDTO> statics();

}
