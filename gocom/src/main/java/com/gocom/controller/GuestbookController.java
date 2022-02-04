package com.gocom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/guestbook/*", method=RequestMethod.GET )
public class GuestbookController {
	
	@RequestMapping(value="/guestbook/list", method=RequestMethod.GET)
	public String gb_list() {
		return "gb_list";
		
	}
}
