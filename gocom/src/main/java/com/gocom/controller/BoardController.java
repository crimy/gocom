package com.gocom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.ImageDTO;
import com.gocom.Util.ImageUtil;
import com.gocom.service.BoardService;
import com.gocom.service.ImageService;

@Controller
@RequestMapping(value="/board/*", method = RequestMethod.GET )
public class BoardController {

@Inject
BoardService boardService;
@Inject
ImageService imageService;

	@RequestMapping(value="list", method = RequestMethod.GET )
	public ModelAndView list() throws Exception {
		ModelAndView mnv = new ModelAndView();
		List<BoardDTO> list = boardService.list();
		mnv.setViewName("board/list");
		mnv.addObject("list",list);
		return mnv;
	}
	
	@RequestMapping(value="write", method = RequestMethod.GET )
	public String write(HttpSession session) throws Exception {
		return "board/write";
	}
	
	@RequestMapping(value="upload", method = RequestMethod.POST )
	public ModelAndView upload(MultipartHttpServletRequest request, HttpServletResponse response ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		
		request.setCharacterEncoding("utf-8");
		List<String> fsnlist = new ArrayList<String>();
		HttpSession session = request.getSession();
		
		String userid = (String) session.getAttribute("userid");
		String title = request.getParameter("title");

		List<MultipartFile> files = request.getFiles("file");
		System.out.println(files.toString());
		for( MultipartFile file : files ) {
			String fsn = ImageUtil.createFsn( file );
			fsnlist.add( fsn );
		}
		
		int con_no = boardService.write(title,userid);
		int img_cnt = imageService.upload(fsnlist,con_no);
		mnv.setViewName("redirect:/board/list");
		return mnv;
	}
	@RequestMapping(value="view")
	public ModelAndView view(HttpServletRequest request) throws Exception {
		String con_no = request.getParameter("no");
		ModelAndView mnv = new ModelAndView();
		BoardDTO dto = boardService.boardView(con_no);
		List<ImageDTO> i_list = imageService.imageView(con_no);
		
		mnv.addObject("i_cnt", i_list.size() );
		mnv.addObject("path", ImageUtil.path() );
		mnv.addObject("image", i_list);
		mnv.addObject("board", dto);
		mnv.setViewName("board/content");
		return mnv;
	}
}
