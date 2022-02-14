package com.gocom.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.gocom.DTO.ImageDTO;
import com.gocom.dao.ImageDAO;


@Service
public class ImageServiceImpl implements ImageService {

@Inject
ImageDAO imageDao;

	@Override
	public int upload( List<String> fsnlist , int con_no ) {
		return imageDao.upload( fsnlist, con_no );
	}

	@Override
	public List<ImageDTO> imageView(int con_no) {
		return imageDao.imageView(con_no);
	}
	
}
