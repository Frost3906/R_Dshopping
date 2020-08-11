package com.spring.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.social.google.connect.GoogleConnectionFactory;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import com.spring.domain.MemberVO;
import com.spring.domain.ModifyMemberVO;
import com.spring.email.EmailSender;
import com.spring.email.EmailVO;
import com.spring.email.RandomString;
import com.spring.service.MemberService;
import com.spring.sns.SNSSignIn;
import com.spring.sns.SNSValue;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/member/*")
public class MemberController {

	@Autowired
	private MemberService service;
	
	//email 발송을 위한 객체 
	@Inject
	private EmailSender emailSender;	
	@Inject
	private EmailVO email;
	
	//소셜 로그인을 위한 객체
	@Inject
	private SNSValue naverSNS;
	@Inject
	private SNSValue googleSNS;
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;
	
	
	@GetMapping("/signIn")
	public void signinForm(Model model) {
		log.info("로그인 화면 표시");	
		
		//네이버code 발행을 위한 URL 생성
		SNSSignIn snsLogin = new SNSSignIn(naverSNS);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());
		
//		SNSSignIn googleLogin = new SNSSignIn(googleSNS);
//		model.addAttribute("naver_url", googleLogin.getNaverAuthURL());
		
		//구글code 발행을 위한 URL 생성
		OAuth2Operations oauthOperations = googleConnectionFactory.getOAuthOperations();
		String url = oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE, googleOAuth2Parameters);
		model.addAttribute("google_url", url);
	}
	
	@PostMapping("/signIn")
	public String signinPost(MemberVO vo, HttpSession session) {
		log.info("로그인 절차 진행");
		log.info(""+vo);		
		
		MemberVO member=service.getMember(vo.getEmail());
		if(member != null) {
			if(member.getPassword().equals(vo.getPassword())) {
				session.setAttribute("auth", member);
				return "redirect:/";				
			}
		}
		return "/member/signIn";		
	}
	
//	@RequestMapping(value = "/auth/{snsService}/callback", 
//			method = { RequestMethod.GET, RequestMethod.POST})
//	public String snsLoginCallback(@PathVariable String snsService,
//			Model model, @RequestParam String code, HttpSession session) throws Exception {
//		
//		SNSValue sns = null;
//		if (StringUtils.pathEquals("naver", snsService)) {
//			sns = naverSNS;			
//		}else if(StringUtils.pathEquals("google", snsService)) {
//			sns = googleSNS;			
//		}
//		
//		// 1. code를 이용해서 access_token 받기
//		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
//		SNSSignIn snsLogin = new SNSSignIn(sns);
//		
//		MemberVO snsMember = snsLogin.getUserProfile(code); // 1,2번 동시
//		System.out.println("Profile>>" + snsLogin);
//		
//		// 3. DB 해당 유저가 존재하는 체크 (googleid, naverid 컬럼 추가)
//		MemberVO member = service.getBySns(snsMember);
//		if (member == null) {
//			model.addAttribute("result", "존재하지 않는 사용자입니다. 가입해 주세요.");
//			
//			//미존재시 가입페이지로!!
//			
//		} else {
//			model.addAttribute("result", member.getFirstName() + "님 반갑습니다.");
//			
//			// 4. 존재시 강제로그인
//			session.setAttribute(SessionNames.LOGIN, member);
//		}
//		return "loginResult";
//	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("로그아웃");
		session.removeAttribute("auth");
		return "redirect:/";
	}
	
	@GetMapping("/signUp")
	public void signupForm() {
		log.info("회원가입 화면 표시");
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
	
	@PostMapping("/checkPwd")
	@ResponseBody
	public String checkPwd(MemberVO member) {
		log.info("비밀번호 검사 절차 진행 ");
		log.info(""+member);
		MemberVO vo=service.checkPwd(member);
		if(member.getPassword().equals(vo.getPassword())) {
			return "true";
		}else {
			return "false";
		}
	}
	
	@PostMapping("/modify")
	public String modifyPost(ModifyMemberVO modifyMember, HttpSession session) {
		log.info("회원정보 수정 절차 진행");
		log.info(""+modifyMember);
		
		if(service.modify(modifyMember)>0) {
			session.removeAttribute("auth");
			return "redirect:/member/signIn";
		}
		return "/member/myPage";
	}
	
	@GetMapping("/myPage")
	public void myPageForm() {
		log.info("마이페이지 화면 표시");
	}
	
	
	@PostMapping("/forgetPwd")
    public String sendEmailAction (MemberVO member, Model model) throws Exception {
        log.info("E-mail 전송 서비스");
        log.info(""+member);
        
        //랜덤 문자열 reference
        String ENGLISH_LOWER = "abcdefghijklmnopqrstuvwxyz";
        String ENGLISH_UPPER = ENGLISH_LOWER.toUpperCase();
        String NUMBER = "0123456789";
        
        //랜덤을 생성할 대상 문자열
        String DATA_FOR_RANDOM_STRING = ENGLISH_LOWER + ENGLISH_UPPER + NUMBER;
        
        //랜덤 문자열 길이
        int random_string_length=10;
    	
        RandomString randomStr = new RandomString();
        String tempPwd=randomStr.generate(DATA_FOR_RANDOM_STRING, random_string_length);
        
        
        MemberVO vo=service.checkPwd(member);
        if(vo != null) {
        	if(member.getMobile().equals(vo.getMobile())) {
        		vo.setPassword(tempPwd);
        		service.forgetPwd(vo);
        		email.setContent("비밀번호는 "+vo.getPassword()+" 입니다.");
        		email.setReciver(vo.getEmail());
        		email.setSubject(vo.getFirstName()+"님 비밀번호 찾기 메일입니다.");
        		emailSender.SendEmail(email);
        		return "redirect:/member/signIn";        	
        	}else {
        		return "redirect:/";
        	}           	
        }else {
        	return "redirect:/";
        }
    }
}
