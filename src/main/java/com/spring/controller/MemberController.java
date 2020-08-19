package com.spring.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
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
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.AuthVO;
import com.spring.domain.BoardVO;
import com.spring.domain.MemberCriteria;
import com.spring.domain.MemberPageVO;
import com.spring.domain.MemberVO;
import com.spring.domain.ModifyMemberVO;
import com.spring.domain.ReviewVO;
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
	
	//비밀번호 암호화
	@Autowired
	private PasswordEncoder encorder;
	@Autowired
	private MemberService service;
	
	//email 발송을 위한 객체 
	@Inject
	private EmailSender emailSender;	
	@Inject
	private EmailVO email;
	
	
	@Inject
	private SNSValue naverSNS;
//	@Inject
//	private SNSValue googleSNS;
	@Inject
	private GoogleConnectionFactory googleConnectionFactory;
	@Inject
	private OAuth2Parameters googleOAuth2Parameters;
	
	//나라선택 country.jsp 테스트용 컨트롤러
	@GetMapping("/country")
	public void country() {
		
	}
	
	@GetMapping("/login")
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
	
//	@PostMapping("/login")
//	public String signinPost(MemberVO vo, HttpSession session) {
//		log.info("로그인 절차 진행");
//		log.info(""+vo);		
//		
//		MemberVO member=service.getMember(vo.getUsername());		
//		if(member != null) {
//			if(member.getPassword().equals(vo.getPassword())) {
//				session.setAttribute("auth", member);
//				log.info("member 정보 : " + member);
//				return "redirect:/";				
//			}
//		}
//		return "/member/login";		
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
		member.setPassword(encorder.encode(member.getPassword()));
		log.info(""+member);
		if(service.signUp(member)>0) {
			//Security 테이블에 회원정보 입력
			MemberVO vo=service.getMember(member.getUsername());
			service.SmemInsert(vo);
			service.SmemAuthInsert(vo);
			
			rttr.addFlashAttribute("info","회원가입이 완료되었습니다.\n 로그인 해 주세요.");
			return "redirect:login";
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
		modifyMember.setConfirm_password(encorder.encode(modifyMember.getConfirm_password()));
		if(service.modify(modifyMember)>0) {
			session.removeAttribute("auth");
			return "redirect:/member/login";
		}
		return "/member/myPage";
	}
	
	@GetMapping("/myPage")
	public void myPageForm(Model model, @ModelAttribute("memberCri") MemberCriteria memberCri) {;
		log.info("마이페이지 화면 표시");
		
		model.addAttribute("memberPage", new MemberPageVO(memberCri, service.totalMember(memberCri)));
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
        
        
        MemberVO vo=service.checkPwd(member);	//메일 발송 알림 팝업 창 설정 필요
        if(vo != null) {
        	if(member.getMobile().equals(vo.getMobile())) {
        		vo.setPassword(tempPwd);
        		service.forgetPwd(vo);
        		email.setContent("비밀번호는 "+vo.getPassword()+" 입니다.");
        		email.setReciver(vo.getUsername());
        		email.setSubject(vo.getFirstName()+"님 비밀번호 찾기 메일입니다.");
        		emailSender.SendEmail(email);
        		return "redirect:/member/login";        	
        	}else {
        		return "redirect:/";
        	}           	
        }else {
        	return "redirect:/";
        }
    }
	
	
	//MyPage
	@GetMapping("/myPage/qnaList")
	@ResponseBody
	public List<BoardVO> qnaList(String username) {
		log.info("MyPage QnA 탭 테이블 처리");
		log.info(username);
		
		return service.qnaList(username);
	}
	
	//Admin
	@GetMapping("/member_manage")
	public void memberManage(Model model, @ModelAttribute("memberCri") MemberCriteria memberCri) {
		log.info("Member Manage 화면 표시");
		log.info(""+memberCri);
		
		MemberPageVO memberPage = new MemberPageVO(memberCri, service.totalMember(memberCri));
		log.info(""+memberPage);
		
		int members=service.totalMember(memberCri);
		int idx = 0;
		if(members%memberCri.getAmount()==0) {
			idx = (members/memberCri.getAmount());
		} else {
			idx = (members/memberCri.getAmount()+1);
		}
		
		List<MemberVO> list=service.manageList(memberCri);
		model.addAttribute("list", list);		
		model.addAttribute("idx", idx);	
		model.addAttribute("memberPage", memberPage);
	}
	
	@GetMapping("/manage_member/get")
	@ResponseBody
	public MemberVO getManageMember(String username) {
		return service.getMember(username);
	}
	
	@PostMapping("/manageModify")
	public String manageMember(RedirectAttributes rttr, MemberVO member) {
		log.info("ManageModal Modify 진행");
		
		if(service.manageModify(member)>0) {
			//rttr.addFlashAttribute("success", "변경이 완료 되었습니다.");
			return "redirect:/member/member_manage";			
		}else {
			//rttr.addFlashAttribute("fail", "변경이 실패했습니다..");			
			return "redirect:/";			
		}		
	}
	
	@PostMapping("/manageDelete")
	public String manageDelete(String username) {
		log.info("ManageDelete Delete 진행");
		
		if(service.leaveMember(username)>0) {
			//rttr.addFlashAttribute("success", "삭제가 완료 되었습니다.");
			return "redirect:/member/member_manage";	
		}else {
			//rttr.addFlashAttribute("fail", "삭제가 실패했습니다..");			
			return "redirect:/";			
		}				
	}
}
