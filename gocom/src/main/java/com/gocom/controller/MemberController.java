package com.gocom.controller;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gocom.DTO.MemberDTO;
import com.gocom.Util.AlertUtil;
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
	
	@RequestMapping(value="login_check",method = RequestMethod.POST)
	public ModelAndView login_check(@ModelAttribute MemberDTO dto, HttpSession session ) {
		boolean result = memberService.loginCheck( dto, session );
		ModelAndView mnv = new ModelAndView();
		if( result == true ) {
			mnv.setViewName("redirect:/");
			mnv.addObject("message", "success" );
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
	
	@RequestMapping("regi")
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
	public String regi_form(MemberDTO dto,HttpServletResponse response) throws IOException {
		
		memberService.registerMember(dto);
		AlertUtil.alert(response, "가입됐습니다!");
		return "redirect:/member/login";
	}
}
