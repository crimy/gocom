package com.gocom.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.gocom.DTO.PagingDTO;
import com.gocom.Util.AlertUtil;
import com.gocom.Util.ImageUtil;
import com.gocom.service.GuestbookService;

@Controller
@RequestMapping(value="/guestbook/*", method=RequestMethod.GET )
public class GuestbookController {
	
@Inject
GuestbookService gbService;

	@RequestMapping(value="/guestbook/list", method=RequestMethod.POST)
	public ModelAndView gb_list(PagingDTO dto, ModelAndView mnv
			, @RequestParam(value="nowPage", required=false)String nowPage) throws Exception {
		int total = gbService.countgb();

		String cntPerPage = "6";

		if (nowPage == null ) {
			nowPage = "1";
		}
		dto = new PagingDTO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
		
		mnv.addObject("paging", dto);
		mnv.addObject("list", gbService.list(dto));
		mnv.setViewName("/guestbook/list");
		return mnv;
	}
	@RequestMapping(value="writegb", method = RequestMethod.POST )
	public ModelAndView upload(HttpServletRequest request, HttpServletResponse response ) throws Exception {
		ModelAndView mnv = new ModelAndView();
		
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		
		String name = (String) session.getAttribute("name");
		int result = gbService.checktoday(name);
		System.out.println( result );
		if( result != 0 ) {
			AlertUtil.alertAndBackPage(response, "하루에 1번만 작성 가능합니다");
		}
		
		String ment = request.getParameter("ment");
		if( ment == "" ) {
			AlertUtil.alert(response, "내용을 작성해주세요");
		}
		int gb_no = gbService.write(ment,name);
		mnv.setViewName("redirect:/guestbook/list");
		return mnv;
	}	
}

