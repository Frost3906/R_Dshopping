package com.spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.MemberVO;
import com.spring.domain.ModifyMemberVO;
import com.spring.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public int signUp(MemberVO member) {
		return mapper.signUp(member);
	}

	@Override
	public MemberVO getMember(String email) {
		return mapper.getMember(email);
	}

	@Override
	public MemberVO checkPwd(MemberVO member) {
		return mapper.checkPwd(member);
	}

	@Override
	public int modify(ModifyMemberVO modifyMember) {
		return mapper.modify(modifyMember);
	}

	@Override
	public int forgetPwd(MemberVO member) {
		return mapper.forgetPwd(member);
	}

	@Override
	public MemberVO getBySNS(MemberVO snsMember) {
		MemberVO member=null;
		if(snsMember.getGoogleid() != null) {
			member=mapper.getBySnsGoogle(snsMember);			
		}else if(snsMember.getNaverid() != null) {
			member=mapper.getBySnsNaver(snsMember);			
		}
		return member;
	}
}
