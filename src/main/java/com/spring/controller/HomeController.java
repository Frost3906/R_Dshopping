package com.spring.controller;

import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.MemberVO;
import com.spring.domain.ProductVO;
import com.spring.service.MemberService;
import com.spring.service.ProductService;
import com.spring.sns.SNSSignIn;
import com.spring.sns.SNSValue;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {

	//비밀번호 암호화
	@Autowired
	private PasswordEncoder encorder;
	@Autowired
	private ProductService service;
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		log.info("홈페이지 호출");
		List<String> list = service.homeCategoryList();
		model.addAttribute("category", list);
		return "shop/home";
	}
	
	@RequestMapping("/board/list")
	public String board() {
		log.info("게시판 호출");
		return "/board/list";
	}
	@RequestMapping("/board/modify")
	public String modify() {
		log.info("게시판 호출");
		return "/board/modify";
	}
	@RequestMapping("/board/read")
	public String read() {
		log.info("게시판 호출");
		return "/board/read";
	}
	@RequestMapping("/board/register")
	public String register() {
		log.info("게시판 호출");
		return "/board/register";
	}
	
	// 구글 Callback호출 메소드
	@RequestMapping(value = "/auth/google/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String googleCallback(MemberVO member, @RequestParam String email, Model model, RedirectAttributes rttr, HttpSession session) throws IOException {
		log.info("GOOGLE Callback");
		log.info(email);
		member.setUsername(email);
		log.info(""+member);
		
		member.setPassword(encorder.encode("123"));
		
		MemberVO vo=memberService.getMember(member.getUsername());
		if(vo == null) {
			memberService.googleSignUp(member);
			memberService.SmemAuthInsert(member);
			memberService.SmemInsert(member);
			session.setAttribute("auth", member);
			return "redirect:/";
		}else {
			session.setAttribute("auth", vo);
			return "redirect:/";
		}
	}
}
