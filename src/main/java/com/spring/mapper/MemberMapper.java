package com.spring.mapper;

import com.spring.domain.MemberVO;

public interface MemberMapper {
	public int signUp(MemberVO member);
	public MemberVO getMember(String email);
}
