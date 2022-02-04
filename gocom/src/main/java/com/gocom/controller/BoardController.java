package com.gocom.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.gocom.service.BoardService;

@Controller
@RequestMapping(value="/board/*", method = RequestMethod.GET )
public class BoardController {



	@RequestMapping(value="list", method = RequestMethod.GET )
		public String list() throws Exception {
		return "board/list";
	}
	
	@RequestMapping(value="write", method = RequestMethod.GET )
		public String write() throws Exception {
		return "board/write";
	}
}
