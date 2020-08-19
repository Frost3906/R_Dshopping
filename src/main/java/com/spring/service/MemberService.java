package com.spring.service;

import java.util.List;

import com.spring.domain.BoardVO;
import com.spring.domain.MemberCriteria;
import com.spring.domain.MemberVO;
import com.spring.domain.ModifyMemberVO;

public interface MemberService {
	//Member
	public int signUp(MemberVO member);
	public MemberVO getMember(String username);
	public MemberVO checkPwd(MemberVO member);
	public int modify(ModifyMemberVO modifyMember);
	public int manageModify(MemberVO member);
	public int forgetPwd(MemberVO member);
	public MemberVO getBySNS(MemberVO snsMember);
	public List<MemberVO> listMember();
	public int leaveMember(String username);	
	
	public int totalMember(MemberCriteria memberCri);
	
	//security table 
	public int SmemAuthInsert(MemberVO member);
	public int SmemInsert(MemberVO member);
	
	//Admin
	public List<MemberVO> manageList(MemberCriteria memberCri);
	
	//MyPage
	public List<BoardVO> qnaList(String username);
}
