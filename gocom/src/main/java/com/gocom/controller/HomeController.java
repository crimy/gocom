package com.gocom.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.gocom.service.BoardService;
import com.gocom.service.GuestbookService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
@Inject
BoardService boardService;
@Inject
GuestbookService gbService;
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/")
	public ModelAndView home(Locale locale, Model model, HttpSession session) {
		ModelAndView mnv = new ModelAndView();
		mnv.addObject("hotlist", boardService.hotlist());
		mnv.addObject("recentgb",gbService.recent() );
		mnv.setViewName("index");
		return mnv;
	}

}
