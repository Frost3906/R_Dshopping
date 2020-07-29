package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.MemberVO;
import com.spring.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	@GetMapping("/signIn")
	public void signinForm() {
		log.info("로그인 폼 화면 표시");		
	}
	
	@GetMapping("/signUp")
	public void signupForm() {
		log.info("회원가입 폼 화면 표시");
	}	
	
	@PostMapping("/signUp")
	public String signUpPost(MemberVO member, RedirectAttributes rttr) {
		log.info("회원가입 절차 진행");
		log.info(""+member);
		
		if(service.signUp(member)>0) {
			rttr.addFlashAttribute("info","회원가입이 완료되었습니다.\n 로그인 해 주세요.");
			return "redirect:signIn";
		}else {
			rttr.addFlashAttribute("error","회원가입이 실패했습니다.");			
			return "/member/signUp";
		}
	}
}
