package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberCriteria;
import com.spring.domain.MemberVO;
import com.spring.domain.ModifyMemberVO;

public interface MemberService {
	//Member
	public int signUp(MemberVO member);
	public MemberVO getMember(String email);
	public MemberVO checkPwd(MemberVO member);
	public int modify(ModifyMemberVO modifyMember);
	public int forgetPwd(MemberVO member);
	public MemberVO getBySNS(MemberVO snsMember);
	public List<MemberVO> listMember();
	
	public int totalMember(MemberCriteria memberCri);
	
	//Admin
	public List<MemberVO> manageList(MemberCriteria memberCri);
	
	//MyPage
	public List<BoardVO> qnaList(String email);
}
