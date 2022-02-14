package com.gocom.service;

import java.util.List;
import java.util.Map;

import com.gocom.DTO.EmojiDTO;
import com.gocom.DTO.EmostaticDTO;

public interface EmojiService {

	public int react(int con_no, String emo_name, String name, Integer x, Integer y);

	public List<EmojiDTO> emoView(int con_no);

	public List<EmostaticDTO> statics();
	
}
