package com.spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberCriteria;
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
		if(snsMember.getGoogleID() != null) {
			member=mapper.getBySnsGoogle(snsMember);			
		}else if(snsMember.getNaverID() != null) {
			member=mapper.getBySnsNaver(snsMember);			
		}
		return member;
	}
	
	@Override
	public List<MemberVO> listMember() {
		return mapper.listMember();
	}
	
	@Override
	public int totalMember(MemberCriteria memberCri) {
		return mapper.totalMember(memberCri);
	}
	
	//Admin
	@Override
	public List<MemberVO> manageList(MemberCriteria memberCri){
		return mapper.manageList(memberCri);
	}
	
	
	//MyPage
	@Override
	public List<BoardVO> qnaList(String email) {
		return mapper.qnaList(email);
	}
}
