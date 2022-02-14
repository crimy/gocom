package com.gocom.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gocom.DTO.BoardDTO;
import com.gocom.DTO.EmojiDTO;
import com.gocom.DTO.ImageDTO;
import com.gocom.DTO.PagingDTO;
import com.gocom.Util.AlertUtil;
import com.gocom.Util.EmojiUtil;
import com.gocom.Util.ImageUtil;
import com.gocom.service.BoardService;
import com.gocom.service.EmojiService;
import com.gocom.service.ImageService;
import com.gocom.service.MemberService;

@Controller
@RequestMapping(value="/board/*", method = RequestMethod.GET )
public class BoardController {

@Inject
BoardService boardService;
@Inject
ImageService imageService;
@Inject
MemberService memberService;
@Inject
EmojiService emoService;

	@RequestMapping(value="list", method = RequestMethod.GET )
	public ModelAndView list(PagingDTO dto, ModelAndView mnv
			, @RequestParam(value="nowPage", required=false)String nowPage) throws Exception {
		int total = boardService.countboard();
		String cntPerPage = "10";
		if (nowPage == null ) {
			nowPage = "1";
		}
		dto = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		mnv.addObject("paging", dto);
		mnv.addObject("list", boardService.list(dto));
		mnv.setViewName("/board/list2");
		return mnv;
	}
	
	@RequestMapping(value="write", method = RequestMethod.GET )
	public String write(HttpSession session) throws Exception {
		return "board/write2";
	}
	
	@RequestMapping(value="upload", method = RequestMethod.POST )
	public ModelAndView upload(MultipartHttpServletRequest request, HttpServletResponse response ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		
		request.setCharacterEncoding("utf-8");
		List<String> fsnlist = new ArrayList<String>();
		HttpSession session = request.getSession();
		
		String name = (String) session.getAttribute("name");
		String title = request.getParameter("title");

		List<MultipartFile> files = request.getFiles("file");
		System.out.println(files.toString());
		for( MultipartFile file : files ) {
			String fsn = ImageUtil.createFsn( file );
			fsnlist.add( fsn );
		}
		
		int con_no = boardService.write(title,name);
		int img_cnt = imageService.upload(fsnlist,con_no);
		mnv.setViewName("redirect:/board/list");
		return mnv;
	}
	
	@RequestMapping(value="reactEmoji")
	public ModelAndView reactemoji(HttpServletRequest request,HttpServletResponse response) throws Exception {
		ModelAndView mnv = new ModelAndView();
		int con_no = Integer.parseInt( request.getParameter("no") );
		String emo_name = request.getParameter("emoname");
		HttpSession session = request.getSession();
		String name = (String) session.getAttribute("name");
		Map<String,Integer> map = EmojiUtil.setPosition();
		System.out.println( map.get("x").toString() );
		int result = emoService.react(con_no, emo_name, name, map.get("x") , map.get("y") );
		if( result == 1 ) {		
			AlertUtil.alert(response, "등록됐습니다");
		} else {
			AlertUtil.alert(response, "다시 시도해주세요");
		}
		mnv.setViewName("redirect:board/content2");
		return mnv;
	}
	
	@RequestMapping(value="view", method = RequestMethod.POST )
	public ModelAndView view(HttpServletRequest request) throws Exception {
		int con_no = Integer.parseInt( request.getParameter("no") );
		ModelAndView mnv = new ModelAndView();
		BoardDTO dto = boardService.boardView(con_no);
		List<EmojiDTO> e_list = emoService.emoView(con_no);
		List<ImageDTO> i_list = imageService.imageView(con_no);
		List<String> allemoji = EmojiUtil.loadEmoji();
		
		mnv.addObject("emoji",e_list);
		mnv.addObject("allemoji",allemoji);
		mnv.addObject("i_cnt", i_list.size() );
		mnv.addObject("path", ImageUtil.path() );
		mnv.addObject("image", i_list);
		mnv.addObject("board", dto);
		mnv.setViewName("board/content2");
		return mnv;
	}
		
	@RequestMapping(value="recommend")
	public ModelAndView recommend(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int con_no = Integer.parseInt( request.getParameter("no") );
		String userid = "";
		ModelAndView mnv = new ModelAndView();
		HttpSession session = request.getSession();
		userid = (String) session.getAttribute("userid");
		
		System.out.println( con_no + "," + userid );
		try {
			if( userid != null ) {			
				int result1 = boardService.recommend(con_no,userid);
				if( result1 == 0 ) {					
					mnv.addObject("message","error");		
					AlertUtil.alert(response, "추천했습니다");
				}
			} else {
				AlertUtil.alertAndBackPage(response, "로그인이 필요합니다");
				return mnv;
			}
		} catch ( Exception e ) {
			e.printStackTrace();
			AlertUtil.alert(response, "이미 추천했습니다");
			return mnv;
		}
		
		mnv.setViewName("redirect:board/content2");
		
		return mnv;
	}
	
	@RequestMapping(value="warn")
	public ModelAndView warn(HttpServletRequest request,HttpServletResponse response) throws Exception {
		int con_no = Integer.parseInt( request.getParameter("no") );
		String userid = "";
		ModelAndView mnv = new ModelAndView();
		HttpSession session = request.getSession();
		userid = (String) session.getAttribute("userid");
		
		System.out.println( con_no + "," + userid );
		try {
			if( userid != null ) {			
				int result1 = boardService.warn(con_no,userid);
				if( result1 == 0 ) {					
					mnv.addObject("message","error");					
				}
			} else {
				AlertUtil.alertAndBackPage(response, "로그인이 필요합니다");
			}
		} catch ( Exception e ) {
			e.printStackTrace();
			AlertUtil.alertAndBackPage(response, "이미 반대했습니다");			
		}
			
		mnv.setViewName("redirect:board/content2");
		
		return mnv;
	}
	

}
