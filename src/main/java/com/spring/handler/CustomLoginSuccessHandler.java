package com.spring.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.spring.domain.MemberVO;
import com.spring.service.CustomUser;
import com.spring.service.CustomUserDetailService;
import com.spring.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private MemberService memberService;
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, 
										HttpServletResponse response,
										Authentication authentication) 
												throws IOException, ServletException {
		log.info("Login Success Handler");
		
		//Authentication 정보 확인해 보기
		List<String> roleNames = new ArrayList<String>();
		authentication.getAuthorities()
		              .forEach(authority -> roleNames.add(authority.getAuthority()));		
				
		log.info("roleNames "+roleNames);
		
		User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		MemberVO member=memberService.getMember(user.getUsername());
		HttpSession session=request.getSession();
		session.setAttribute("auth", member);
		
		//부여된 권한에 따라서 페이지 이동시키기
		if(roleNames.contains("ROLE_ADMIN")) {			
			response.sendRedirect("/");
			return;
		}else if(roleNames.contains("ROLE_MEMBER") || roleNames.contains("ROLE_MANAGER")) {
			response.sendRedirect("/");
			return;
		}
		response.sendRedirect("/");		
	}

}











