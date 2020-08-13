package com.spring.mapper;

import com.spring.domain.MemberVO;
import com.spring.domain.ModifyMemberVO;

public interface MemberMapper {
	public MemberVO read			(String userid);
	public int		signUp			(MemberVO member);
	public MemberVO getMember		(String email);
	public MemberVO checkPwd		(MemberVO member);
	public int		modify			(ModifyMemberVO modifyMember);
	public int		forgetPwd		(MemberVO member);
	public MemberVO getBySnsNaver	(MemberVO snsMember);
	public MemberVO getBySnsGoogle	(MemberVO snsMember);
}
