package com.gocom.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gocom.DTO.MemberDTO;
import com.gocom.service.MemberService;

@Controller
@RequestMapping("/member/*")
public class MemberController {

@Inject
MemberService memberService;


	@RequestMapping("login")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("login_check")
	public ModelAndView login_chect(@ModelAttribute MemberDTO dto , HttpSession session) {
		String name = memberService.loginCheck( dto, session );
		ModelAndView mnv = new ModelAndView();
		if( name != null ) {
			mnv.addObject("name", name );
			mnv.setViewName("home");			
		}
		else {
			mnv.setViewName("member/login");
			mnv.addObject("message", "error" );
		}
		return mnv;
	}
	@RequestMapping("logout")
	public ModelAndView logout(HttpSession session , ModelAndView mnv ) {
		memberService.logout(session);
		mnv.setViewName("member/login");
		mnv.addObject("message", "logout" );
		return mnv;
	}		
	
	@RequestMapping("signin")
	public String register() {
		return "member/regi";
	}
	
	@ResponseBody
	@RequestMapping(value="idvalidcheck", method=RequestMethod.POST)
	public int idvalidCheck( @RequestParam("userid") String userid ) {
		int result = memberService.idvalidCheck(userid);
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="namevalidcheck", method=RequestMethod.POST)
	public int namevalidCheck( @RequestParam("username") String username ) {
		System.out.println(username);
		int result = memberService.namevalidCheck(username);
		System.out.println(result);
		return result;
	}
	
	@RequestMapping(value="regi_form", method=RequestMethod.POST)
	public String regi_form(MemberDTO dto) {
		memberService.registerMember(dto);
		return "redirect:/member/login";
	}
}
