package com.gocom.service;

import java.util.List;

import com.gocom.DTO.ImageDTO;

public interface ImageService {
	public int upload(List<String> fsnlist, int con_no );

	public List<ImageDTO> imageView(String con_no);
		
}
