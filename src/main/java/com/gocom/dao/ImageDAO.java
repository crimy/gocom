package com.gocom.dao;

import java.util.List;

import com.gocom.DTO.ImageDTO;

public interface ImageDAO {

	public int upload( List<String> fsnlist, int con_no );

	public List<ImageDTO> imageView(int con_no);
}
