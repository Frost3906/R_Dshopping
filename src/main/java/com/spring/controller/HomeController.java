package com.spring.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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

	@Autowired
	private ProductService service;
	@Autowired
	private MemberService memberService;
	
	
	//소셜 로그인을 위한 객체
	@Inject
	private SNSValue naverSNS;
	@Inject
	private SNSValue googleSNS;
//	@Inject
//	private GoogleConnectionFactory googleConnectionFactory;
//	@Inject
//	private OAuth2Parameters googleOAuth2Parameters;
	
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
	
	@RequestMapping(value = "/auth/{snsName}/callback", 
			method = { RequestMethod.GET, RequestMethod.POST})
	public String snsLogin(@PathVariable("snsName") String snsName, Model model, @RequestParam String code, HttpSession session) throws Exception {
		log.info("SNS로그인 절차 진행");
		log.info("snsLogin : snsName => {}", snsName);
//		snsName="google";
		SNSValue snsValue=null;
		if(StringUtils.pathEquals("naver", snsName)) {
			snsValue=naverSNS;
		}else if(StringUtils.pathEquals("google", snsName)) {
			snsValue=googleSNS;			
		}
		
		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		SNSSignIn snsSignin = new SNSSignIn(snsValue);
		MemberVO snsMember=snsSignin.getUserProfile(code);
		log.info("Profile >> " + snsMember);
		
		// 3. DB 해당 유저가 존재하는 체크 (googleid, naverid 컬럼 추가)	
		MemberVO member=memberService.getBySNS(snsMember);
		
		if(member == null) {
			model.addAttribute("result", "존재하지 않는 사용자 입니다. 가입해 주세요.");
			return "redirect:/member/signUp";
		}else {
			model.addAttribute("result", member.getFirstName()+"님 반갑습니다.");			
			// 4. 존재시 강제로그인
			session.setAttribute("auth", member);
		}
		return "redirect:/";
	}
}
