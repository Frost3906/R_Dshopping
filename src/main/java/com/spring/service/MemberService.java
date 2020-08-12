package com.spring.service;

import com.spring.domain.MemberVO;
import com.spring.domain.ModifyMemberVO;

public interface MemberService {
	public int signUp(MemberVO member);
	public MemberVO getMember(String email);
	public MemberVO checkPwd(MemberVO member);
	public int modify(ModifyMemberVO modifyMember);
	public int forgetPwd(MemberVO member);
	public MemberVO getBySNS(MemberVO snsMember);
}
