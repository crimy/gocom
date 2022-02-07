package com.gocom.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gocom.Util.ImageUtil;
import com.gocom.service.BoardService;
import com.gocom.service.ImageService;

@Controller
@RequestMapping(value="/board/*", method = RequestMethod.GET )
public class BoardController {

@Inject
BoardService boardService;

	@RequestMapping(value="list", method = RequestMethod.GET )
		public String list() throws Exception {
		return "board/list";
	}
	
	@RequestMapping(value="write", method = RequestMethod.GET )
		public String write(HttpSession session) throws Exception {
		return "board/write";
	}
	
	@RequestMapping(value="upload", method = RequestMethod.POST )
	public String upload(MultipartHttpServletRequest request, HttpServletResponse response ) throws Exception {
		request.setCharacterEncoding("utf-8");
		List<String> fsnlist = new ArrayList<String>();
		HttpSession session = request.getSession();
		String userid = (String) session.getAttribute("userid");
		String title = request.getParameter("title");
		System.out.println(userid+","+title);
		List<MultipartFile> files = request.getFiles("file");
		System.out.println(files.toString());
		for( MultipartFile file : files ) {
			String fsn = ImageUtil.createFsn( file );
			fsnlist.add( fsn );
		}
		int con_no = boardService.write(title,userid);
		//imageService.download();
		return "board/write";
}
}
