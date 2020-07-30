package com.spring.service;

import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;

public interface MemberService {
	public int signUp(MemberVO member);
}
