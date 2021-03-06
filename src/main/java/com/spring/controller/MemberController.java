package com.spring.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
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
import com.spring.domain.Criteria;
import com.spring.domain.MemberCriteria;
import com.spring.domain.MemberPageVO;
import com.spring.domain.MemberVO;
import com.spring.domain.ReviewVO;
import com.spring.domain.MyPageOrderVO;
import com.spring.domain.ReplyVO;
import com.spring.email.EmailSender;
import com.spring.email.EmailVO;
import com.spring.email.RandomString;
import com.spring.service.BoardService;
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
	@Autowired
	private BoardService boardService;
	
	//email 발송을 위한 객체 
	@Inject
	private EmailSender emailSender;	
	@Inject
	private EmailVO email;
	
	@GetMapping("/login")
	public void signinForm(Model model) {
		log.info("로그인 화면 표시");
	}
	
//	@PostMapping("/googleSignIn")
//	public String googleSignIn(MemberVO member) {
//		log.info("구글 로그인 처리");
//		log.info(""+member);
//		
//		return "redirect:/";
//	}
	
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		log.info("로그아웃");
		session.invalidate();
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
			rttr.addFlashAttribute("info","회원가입이 실패했습니다.");			
			return "redirect/member/signUp";
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
	public String modifyPost(MemberVO member, HttpSession session, RedirectAttributes rttr) {
		log.info("회원정보 수정 절차 진행");
		log.info(""+member);
		MemberVO vo=(MemberVO)session.getAttribute("auth");
		if(member.getNew_password().equals(vo.getPassword())) {
			if(service.modifyNull(member)>0) {
				rttr.addFlashAttribute("info", "회원 정보 변경에 성공했습니다.");
				return "redirect:/member/myPage";
			}else {
				rttr.addFlashAttribute("info", "회원 정보 변경에 실패했습니다.\n 다시 시도해 주세요.");
				return "redirect:/member/myPage";				
			}			
		}else {
			member.setConfirm_password(encorder.encode(member.getConfirm_password()));
			if(service.modify(member)>0) {
				service.SmemUpdateM(member);
				session.removeAttribute("auth");
				rttr.addFlashAttribute("info", "비밀번호 변경에 성공했습니다.\n 다시 로그인해 주세요.");
				return "redirect:/member/login";
			}else {
				rttr.addFlashAttribute("info", "비밀번호 변경에 실패했습니다.\n 다시 시도해 주세요.");
				return "redirect:/member/myPage";				
			}			
		}
			
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myPage")
	public void myPageForm(Model model, @ModelAttribute("memberCri") MemberCriteria memberCri, HttpSession session) {;
		log.info("마이페이지 화면 표시");
		
		MemberVO vo=(MemberVO) session.getAttribute("auth");
		model.addAttribute("memberPage", new MemberPageVO(memberCri, service.getTotalBoard(vo.getUsername())));
	}
	
	
	@PostMapping("/forgetPwd")
    public String sendEmailAction (RedirectAttributes rttr, MemberVO member, Model model) throws Exception {
        log.info("비밀번호 찾기 => E-mail 전송 서비스");
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
        
        
        MemberVO vo=service.getMember(member.getUsername());	
        if(vo != null) {
        	if(member.getMobile().equals(vo.getMobile())) {
        		vo.setPassword(encorder.encode(tempPwd));
        		service.forgetPwd(vo);
        		service.SmemUpdateA(vo);
        		email.setContent("비밀번호는 "+tempPwd+" 입니다.");
        		email.setReciver(vo.getUsername());
        		email.setSubject(vo.getFirstName()+"님 비밀번호 찾기 메일입니다.");
        		emailSender.SendEmail(email);
        		rttr.addFlashAttribute("info", "메일이 발송되었습니다.");
        		return "redirect:/member/login";        	
        	}else {
        		rttr.addFlashAttribute("info", "핸드폰 번호가 일치하지 않습니다.");
        		return "redirect:/";
        	}           	
        }else {
        	rttr.addFlashAttribute("info", "이메일이 존재 하지 않습니다.");
        	return "redirect:/";
        }
    }
	
	
	//MyPage
	//QnA 게시판 글 가져오기
	@GetMapping("/myPage/qnaList")
	@ResponseBody
	public List<BoardVO> qnaList(String username, MemberCriteria memberCri, Model model) {
		log.info("MyPage QnA 탭 테이블 처리");
		log.info(username);
		log.info(""+memberCri);
		MemberPageVO memberPage = new MemberPageVO(memberCri, service.getTotalBoard(username));
		log.info(""+memberPage);
		
		int boards=service.getTotalBoard(username);
		log.info(""+boards);
		int idx = 0;
		if(boards%memberCri.getAmount()==0) {
			idx = (boards/memberCri.getAmount());
		} else {
			idx = (boards/memberCri.getAmount()+1);
		}	
		model.addAttribute("memberPage", memberPage);
		return service.myPageList(username, memberCri);
	}
	
	//QnA 게시판 글 읽기
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/myPage/read")
	public String QnARead(int bno, Model model, @ModelAttribute ("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("게시물 읽기 요청" + bno + "..." + cri);
		BoardVO vo = boardService.getBoard(bno);
		rttr.addFlashAttribute("vo", vo);
		return "redirect:/board/read";
	}
	
	//구매내역 가져오기
	@GetMapping("/myPage/orderList")
	@ResponseBody
	public List<MyPageOrderVO> orderList(String username, Model model) {
		log.info("MyPage Order 탭 테이블 처리");
		log.info(username);
		
		return service.orderList(username);
	}
	
	//Admin
	@PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_MANAGER')")
	@GetMapping("/member_manage")
	public void memberManage(Model model, @ModelAttribute("memberCri") MemberCriteria memberCri, HttpSession session) {
		log.info("Member Manage 화면 표시");
		log.info(""+memberCri);
		MemberVO vo=(MemberVO)session.getAttribute("auth");
		
		MemberPageVO memberPage=null;
		List<MemberVO> list=null;
		int members=0;
		int idx = 0;		
		
		//Admin 접속시
		if(vo.getAuth().equals("ROLE_ADMIN")) {
			if(memberCri.getKeyword() == null) {
				log.info("Admin 접속");
				members=service.totalMember(memberCri);
				memberPage = new MemberPageVO(memberCri, members);
				log.info(""+memberPage);
				if(members%memberCri.getAmount()==0) {
					idx = (members/memberCri.getAmount());
				} else {
					idx = (members/memberCri.getAmount()+1);
				}			
				list=service.manageList(memberCri);
				model.addAttribute("list", list);
			//Admin 접속 검색 시
			}else {
				log.info("Admin 접속 검색");
				members=service.searchTotal(memberCri);
				memberPage = new MemberPageVO(memberCri, members);
				log.info(""+memberPage);			
				if(members%memberCri.getAmount()==0) {
					idx = (members/memberCri.getAmount());
				} else {
					idx = (members/memberCri.getAmount()+1);
				}			
				list=service.searchMember(memberCri);
				model.addAttribute("search", list);		
			}	
		//Manager 접속 시	
		}else {
			log.info("Manager 접속");
			String role="ROLE_M";
			if(memberCri.getKeyword() == null) {
				members=service.getNotAdminTotal(memberCri, role);
				memberPage = new MemberPageVO(memberCri, members);
				log.info(""+memberPage);
				if(members%memberCri.getAmount()==0) {
					idx = (members/memberCri.getAmount());
				} else {
					idx = (members/memberCri.getAmount()+1);
				}			
				list=service.getNotAdmin(memberCri, role);
				model.addAttribute("list", list);
			//Manager 접속 검색 시
			}else {
				log.info("Manager 접속 검색");
				members=service.getNotAdminSearchTotal(memberCri, role);
				memberPage = new MemberPageVO(memberCri, members);
				log.info(""+memberPage);			
				if(members%memberCri.getAmount()==0) {
					idx = (members/memberCri.getAmount());
				} else {
					idx = (members/memberCri.getAmount()+1);
				}			
				list=service.getNotAdminSearch(memberCri, role);
				model.addAttribute("search", list);	
			}
		}
		model.addAttribute("idx", idx);	
		model.addAttribute("memberPage", memberPage);
	}
	
	//member_manager modal에 정보 띄우기
	@GetMapping("/manage_member/get")
	@ResponseBody
	public MemberVO getManageMember(String username) {
		return service.getMember(username);			
	}	
	
	@PostMapping("/manageModify")
	public String manageMember(RedirectAttributes rttr, MemberVO member) {
		log.info("ManageModal Modify 진행");
		member.setPassword(encorder.encode(member.getPassword()));
		if(service.manageModify(member)>0) {
			service.SmemUpdateA(member);
			rttr.addFlashAttribute("info", "변경이 완료 되었습니다.");
			return "redirect:/member/member_manage";			
		}else {
			rttr.addFlashAttribute("info", "변경이 실패했습니다..");			
			return "redirect:/";			
		}		
	}
	
	@PostMapping("/manageDelete")
	public String manageDelete(RedirectAttributes rttr, String username) {
		log.info("ManageDelete Delete 진행");
		
		if(service.leaveMember(username)>0) {
			service.SmemAuthDelete(username);
			service.SmemDelete(username);
			rttr.addFlashAttribute("info", "삭제가 완료 되었습니다.");
			return "redirect:/member/member_manage";	
		}else {
			rttr.addFlashAttribute("fail", "삭제가 실패했습니다..");			
			return "redirect:/";			
		}				
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/createAdmin")
	public String createAdmin(MemberVO member, RedirectAttributes rttr, HttpSession session) {
		log.info("Admin 계정 생성 절차 진행");
		log.info(""+member);
		member.setAuth("ROLE_ADMIN");
		member.setPassword(encorder.encode(member.getPassword()));
		
		if(service.createAdmin(member)>0) {
			service.SmemInsert(member);
			service.SmemAuthInsert(member);
			
			//session.removeAttribute("auth");
			rttr.addFlashAttribute("info", "관리자 계정 생성이 완료 되었습니다.");			
			return "redirect:member_manage";
		}else {
			rttr.addFlashAttribute("info", "관리자 계정 생성이 실패 했습니다.");
			return "redirect:member_manage";			
		}
	}
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/createManager")
	public String createManager(MemberVO member, RedirectAttributes rttr, HttpSession session) {
		log.info("Admin 계정 생성 절차 진행");
		log.info(""+member);
		member.setAuth("ROLE_MANAGER");
		member.setPassword(encorder.encode(member.getPassword()));
		
		if(service.createAdmin(member)>0) {
			service.SmemInsert(member);
			service.SmemAuthInsert(member);
			
			//session.removeAttribute("auth");
			rttr.addFlashAttribute("info", "매니저 계정 생성이 완료 되었습니다.");			
			return "redirect:member_manage";
		}else {
			rttr.addFlashAttribute("info", "매니저 계정 생성이 실패 했습니다.");
			return "redirect:member_manage";			
		}
	}
}
